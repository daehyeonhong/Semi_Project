<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection con = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false", "root", "1234");
} catch (Exception e) {
	out.print("데이터베이스 연결이 실패되었습니다.<br>");
	out.print("<em>SQLException:" + e.getMessage() + "</em>");
}
%>