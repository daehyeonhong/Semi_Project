<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
	int seq = Integer.parseInt((String) request.getParameter("seq"));
String sql = "delete from category where seq=?";
PreparedStatement preparedStatement = con.prepareStatement(sql);
preparedStatement.setInt(1, seq);
int result = preparedStatement.executeUpdate();
if (result > 0) {
	response.sendRedirect("addCategory.jsp");
} else {
	response.sendRedirect("exceptionNoPage.jsp");
}
%>