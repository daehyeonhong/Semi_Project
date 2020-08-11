<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
	String p_id = request.getParameter("id");
int qty = Integer.parseInt(request.getParameter("qty"));
String sql = "SELECT p_unitsInStock FROM TTProduct WHERE p_id=?";
try {
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	preparedStatement.setString(1, p_id);
	ResultSet resultSet = preparedStatement.executeQuery();
	RequestDispatcher requestDispatcher = null;
	int stock = 0;
	out.print(stock);
	if (resultSet.next()) {
		stock = resultSet.getInt(1);
		out.print(stock);
		if (stock >= qty) {
		requestDispatcher = request.getRequestDispatcher("./addCart.jsp?id=" + p_id + "&qty=" + qty);
		requestDispatcher.forward(request, response);
		} else {
			out.print("<script>alert('재고가 부족합니다.');location.href='./product.jsp?id=" + p_id + "';</script>");
		}
	}
} catch (Exception e) {
	System.out.println("checkStock()Error: " + e);
} finally {
	if (con != null) {
		con.close();
	}
}
%>