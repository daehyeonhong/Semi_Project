<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

/* String cartId = session.getId(); */
	String cartId = (String)session.getAttribute("sessionId");

String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_country = "";
String shipping_zipCode = "";
String shipping_addressName = "";

//request객체로 부터 쿠키 정보 얻기 getCookies()
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
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br> 성명 :<%=shipping_name%><br>
				우편번호:<%=shipping_zipCode%><br> 주소:<%=shipping_addressName%><br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>배송일:<%=shipping_shippingDate%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">상품수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;//총합계
				List<Product> cartList = (List<Product>) session.getAttribute("cartlist");

				if (cartList == null) {
					cartList = new ArrayList<Product>();
				}

				//상품리스트 하나씩 출력
				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname()%></em></td>
					<td class="text-center"><%=product.getQuantity()%></td>
					<td class="text-center"><%=product.getUnitPrice()%></td>
					<td class="text-center"><%=total%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액:</strong></td>
					<td class="text-center text-danger"><strong><%=new DecimalFormat("#,###").format(sum)%></strong></td>
				</tr>
			</table>
			<!-- 확정메뉴 -->
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>"
				class="btn btn-secondary" role="button">이전</a> <a
				href="./purchase.jsp" class="btn btn-success" role="button">결제</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary"
				role="button">취소</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
