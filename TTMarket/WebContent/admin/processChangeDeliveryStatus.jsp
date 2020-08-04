<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../dbconn.jsp"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String sessionId = request.getParameter("id"), productId = request.getParameter("productId");
int status = Integer.parseInt(request.getParameter("status").trim());
if (status != 0) {
	String sql = "update ttsale set status=? where productId=? and seq=?";
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	preparedStatement.setInt(1, status);
	preparedStatement.setString(2, productId);
	preparedStatement.setString(3, sessionId);
	int result = preparedStatement.executeUpdate();
	if (result > 0) {
		out.print("<script>alert(\"변경 완료\")</script>");
		out.print("<script>location.href='./deliveryList.jsp'</script>");
	}
}
%>