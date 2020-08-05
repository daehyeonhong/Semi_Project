<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public static String randomNumber(int random){
  String str = "";
  int n = 0;
  for (int i = 1; i <= random; i++){
    Random r = new Random();
    n = r.nextInt(9);
    str = str + Integer.toString(n);
  }
  return str;
}
%>
<%
String random = randomNumber(5);
/* out.print(random+"<br />"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>