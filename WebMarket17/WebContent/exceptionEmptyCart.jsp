<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">장바구니가 비어있습니다.</h2>
		</div>
		<div class="container">
			<h5>상품 추가 후 다시 시도해주세요</h5>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL()%></p>
		<p>
			<a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
		</p>
	</div>
</body>
</html>
