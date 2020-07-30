<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp" %>

<%
	String categoryName= request.getParameter("categoryName");
	String sql="delete from category where categoryName=?";
	con.setAutoCommit(false);
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, categoryName);
	
	int result= pstmt.executeUpdate();
	
	if(result>0)
		con.commit();
	if(result==0)
		con.rollback();
	con.setAutoCommit(true);
	
	response.sendRedirect("editCategory.jsp?edit=delete");
	
%>