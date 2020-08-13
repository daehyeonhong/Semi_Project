<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection con = null;
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@15.165.66.140:1521:xe", "ttestt", "ttestt11");
} catch (Exception e) {
	out.print("데이터베이스 연결이 실패되었습니다.<br>");
	out.print("<em>SQLException:" + e.getMessage() + "</em>");
}
%>