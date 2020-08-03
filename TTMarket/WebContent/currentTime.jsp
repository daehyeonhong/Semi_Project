<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date day = new java.util.Date();
	String am_pm;
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	if(hour/12==0){
		am_pm="AM";
	}else{
		am_pm="PM";
		hour = hour-12;
	}
	DecimalFormat df1 = new DecimalFormat("00");
	String CT = df1.format(hour)+":"+df1.format(minute)+":"+df1.format(second)+" "+am_pm;
	out.print("현재 접속 시각: "+CT+"<br>");
%>
</body>
</html>