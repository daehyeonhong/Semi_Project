<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../dbconn.jsp"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String sessionId = request.getParameter("id").trim(), productId = request.getParameter("productId").trim();
int status = Integer.parseInt(request.getParameter("status").trim());
if (status != 0) {
	String sql = "update ttsale set status=? where productId=? and seq=?";
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	preparedStatement.setInt(1, status);
	preparedStatement.setString(2, productId);
	preparedStatement.setString(3, sessionId);
	if (preparedStatement.executeUpdate() > 0) {
		out.print("<script>alert(\"변경 완료\");location.href='./deliveryList.jsp'</script>");
	}
}
%>