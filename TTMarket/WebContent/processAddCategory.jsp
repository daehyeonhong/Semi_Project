<%@page import="java.sql.PreparedStatement"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
   String categoryName=request.getParameter("categoryName");
   String description=request.getParameter("description");
   //db에 저장 - 오늘의 과제
   String sql
     ="insert into category(categoryName,description) values(?,?)";
   PreparedStatement pstmt=con.prepareStatement(sql);
   pstmt.setString(1, categoryName);
   pstmt.setString(2, description);
   
   int result = pstmt.executeUpdate();
   
   response.sendRedirect("./addCategory.jsp");
%>