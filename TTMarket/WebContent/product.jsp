<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page errorPage="exceptionNoProductId.jsp"%><!DOCTYPE html>
<%@include file="dbconn.jsp"%>
<html>
<head>
<meta charset="UTF-8" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	/* JavaScript Function Init function[function_name](argument){}*/
	function addToCart() {
		/* alert("카트에 담기"); */
		/* 메세지 출력 메소드 */
		let memberToken = document.getElementById("memberToken").value; 
		alert(memberToken);
		if (memberToken != 'true') {
			alert('로그인 후 이용 바랍니다');
		} else {
			let qty = prompt("수량을 입력하세요");
			if (qty === null) {
				qty = 0
			}
			if (qty > 0) {
				if (confirm('상품을 ' + qty + '개 장바구니에 추가하시겠습니까?')) {
					//document.addForm.submit();/* action경로로 이동처리 */
					let pid = document.getElementById("productId").value;
					location.href = "processAddCart.jsp?id=" + pid + "&qty=" + qty;
				} else {
					document.addForm.reset();/* 초기화 처리 */
				}
			}
		}
	}
</script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<div class="display-3">상품 정보</div>
		</div>
	</div>
	<%
	boolean memberToken = false;
	if (session.getAttribute("loginToken") == null){
		memberToken = false;
	}else{
	memberToken= (boolean) session.getAttribute("loginToken");
	}
	String sessionId = (String) session.getAttribute("sessionId");
		DecimalFormat priceDf = new DecimalFormat("\u00A4 #,###");
	DecimalFormat df = new DecimalFormat("#,###");
	String id = request.getParameter("id");
	String sql = "SELECT*FROM TTProduct WHERE p_id=?";
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	preparedStatement.setString(1, id);
	ResultSet resultSet = preparedStatement.executeQuery();
	Product product = new Product();
	if (resultSet.next()) {
		product.setProductId(resultSet.getString(1));
		product.setPname(resultSet.getString(2));
		product.setUnitPrice(resultSet.getInt(3));
		product.setDescription(resultSet.getString(4));
		product.setCategory(resultSet.getString(5));
		product.setManufacturer(resultSet.getString(6));
		product.setUnitsInStock(resultSet.getLong(7));
		product.setCondition(resultSet.getString(8));
		product.setFilename(resultSet.getString(9));
		String price = priceDf.format(product.getUnitPrice()),
				stock = df.format(product.getUnitsInStock());
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="상품 사진" src="./resources/images/<%=product.getFilename()%>"
					style="width: 100%;" />
			</div>
			<input type="hidden" value="<%=memberToken%>" id="memberToken" />
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p>
					<input type="hidden" value="<%=id%>" id="productId"> <b>상품코드
					</b>: <span class="badge badge-danger"><%=product.getProductId()%></span>
				</p>
				<p>
					<b>제조사</b>:<%=product.getManufacturer()%></p>
				<p>
					<b>분류</b>:<%=product.getCategory()%></p>
				<p>
					<b>재고</b>:<%=stock%></p>
				<h4>
					<%=price%>
				</h4>
				<form name="addForm" id="addForm"
					action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="javascript:addToCart()">상품
						주문&raquo;</a> <a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
				</form>
				<%-- <%=id%> --%>
			</div>
		</div>
	</div>
	<!-- container -->
	<jsp:include page="footer.jsp" />
	<%
		}
	if (resultSet != null) {
	resultSet.close();
	}
	if (preparedStatement != null) {
	preparedStatement.close();
	}
	if (con != null) {
	con.close();
	}
	%>
</body>
</html>
