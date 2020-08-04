<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>TTMarket</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$().ready(function(){
		$("#currentTimer").load("currentTime.jsp");
		var auto_refresh = setInterval(function(){
			$("#currentTimer").load("currentTime.jsp");
		},1000);
	});	
</script>
</head>
<body>
	<%@include file="menu.jsp" %>	
	<%!
		String greeting="웹 쇼핑몰에 오신것을 환영합니다.";
		String tagline="Welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
			<p id="currentTimer"></p>
		</div>
		<hr>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>