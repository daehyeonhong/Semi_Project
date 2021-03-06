<%@page import="java.sql.ResultSet"%>
<%@page import="javax.print.PrintException"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.URLDecoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>주문완료</title>
</head>
<body>
	<%
		String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId")) {
		shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			} else if (n.equals("Shipping_name")) {
		shipping_name = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			} else if (n.equals("Shipping_shippingDate")) {
		shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			} else if (n.equals("Shipping_country")) {
		shipping_country = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			} else if (n.equals("Shipping_zipCode")) {
		shipping_zipCode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			} else if (n.equals("Shipping_addressName")) {
		shipping_addressName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
		}
	}
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
		int deliverySeq = 0;
		try {
			PreparedStatement pstmtD = null;
			String sql = "SELECT IFNULL(MAX(seq),0) FROM TTDelivery";
			pstmtD = con.prepareStatement(sql);
			ResultSet resultSet = pstmtD.executeQuery();
			if(resultSet.next())
			deliverySeq = resultSet.getInt(1) + 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	con.setAutoCommit(false);
	Date saleDate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	try {
		PreparedStatement pstmt = null;
		for (int i = 0; i < list.size(); i++) {
			String sql1 = "INSERT INTO TTSale(saleDate,sessionId,productId,unitPrice,saleQty,deliverySeq,status)VALUES(?,?,?,?,?,?,1)";
			pstmt = con.prepareStatement(sql1);

			pstmt.setString(1, sdf.format(saleDate));
			pstmt.setString(2, shipping_cartId);
			pstmt.setString(3, list.get(i).getProductId());
			pstmt.setInt(4, list.get(i).getUnitPrice());
			pstmt.setInt(5, list.get(i).getQuantity());
			pstmt.setInt(6, deliverySeq);

			pstmt.executeUpdate();
		}

		String sql2 = "INSERT INTO TTDelivery(sessionId,name,deliveryDate,nation,zipCode,address)VALUES(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql2);
		pstmt.setString(1, shipping_cartId);
		pstmt.setString(2, shipping_name);
		pstmt.setString(3, shipping_shippingDate);
		pstmt.setString(4, shipping_country);
		pstmt.setString(5, shipping_zipCode);
		pstmt.setString(6, shipping_addressName);
		pstmt.executeUpdate();

		//db에 반영
		con.commit();
	} catch (Exception e) {
		//이전 상태로 되돌리기
		con.rollback();
		e.printStackTrace();
	} finally {
		con.setAutoCommit(true);
	}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-success">
			<strong><%=shipping_name%></strong>님 주문해 주셔서 감사합니다.
		</h2>
		<p>
			주문은
			<%=shipping_shippingDate%>에 배송될 예정입니다.
		</p>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="./products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
						<a href="./deliveryInfo.jsp" class="btn btn-primary">배송 목록&raquo;</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<%
		//세션정보 삭제
	/* session.removeAttribute("cartlist");
	session.removeValue("cartlist"); */
	/* session.invalidate(); */
	session.setAttribute("cartlist", null);
	//쿠키에 저장된 장바구니 정보 삭제
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		//쿠키 유효기간 설정 0(즉시삭제)
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);

		//응답객체체 추가
		response.addCookie(thisCookie);
	}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>