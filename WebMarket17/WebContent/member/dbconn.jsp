<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Connection con = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager
			.getConnection("jdbc:mysql://localhost:3306/WebMarketDB",
			"root","1234");
	/* out.print("연결성공"); */

}catch(Exception e){
	e.printStackTrace();
}
%>