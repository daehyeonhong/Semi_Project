<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../dbconn.jsp"%>
<%
	int seq = Integer.parseInt((String) request.getParameter("seq"));
String sql = "delete from ttcategory where seq=?";
PreparedStatement preparedStatement = con.prepareStatement(sql);
preparedStatement.setInt(1, seq);
int result = preparedStatement.executeUpdate();
if (result > 0) {
	out.print("<script>alert('삭제되었습니다!');location.href = 'addCategory.jsp';</script>");
} else {
	out.print("<script>alert('삭제실패!');location.href = '${pageContext.request.contextPath}/noPage.jsp';</script>");
}
%>