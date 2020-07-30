<%@page import="javax.sql.DataSource"%><%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%><%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Connection con=null;
try{
	 Context ini = new InitialContext();
	 Context ctx = (Context)ini.lookup("java:comp/env");
	 DataSource ds=(DataSource)ctx.lookup("jdbc/MysqlDB");
	 con=ds.getConnection();
	 
}catch(Exception e){
	out.print("데이터베이스 연결이 실패되었습니다.<br>");
	out.print("SQLException:"+e.getMessage());
}

%>