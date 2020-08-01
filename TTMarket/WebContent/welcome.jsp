<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!String greeting = "TTMarket에 오신 것을 환영합니다.";
	String tagline = "Welcome to TTMarket!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline%></h3>
			<%
				response.setIntHeader("Refresh", 1);
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			am_pm = (hour / 12 == 0) ? "AM" : "PM";
			hour = (hour / 12 == 0) ? hour : hour - 12;//15-12=3,
			DecimalFormat df1 = new DecimalFormat("00");
			String CT = df1.format(hour) + ":" + df1.format(minute) + ":" + df1.format(second) + " " + am_pm;
			out.print("현재 접속 시각: " + CT + "<br>");
			%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>