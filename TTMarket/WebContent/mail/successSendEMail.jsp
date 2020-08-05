<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>메일전송</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">메일전송</h1>
		</div>
	</div>
	<!-- jumbotron -->
	<div class="container">
		<div class="alert alert-success">
			<h3 class="display-3">Mail 전송 성공!</h3>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>