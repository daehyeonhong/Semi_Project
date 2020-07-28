<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
String sql = "";
PreparedStatement preparedStatement = con.prepareStatement(sql);
request.setCharacterEncoding("UTF-8");
	String price = request.getParameter("price"),
				 card1 = request.getParameter("cardId1"),
				 card2 = request.getParameter("cardId2"), 
				 card3 = request.getParameter("cardId3"),
				 card4 = request.getParameter("cardId4"),
				 cardMM = request.getParameter("cardMM"),
				 cardYY = request.getParameter("cardYY"),
				 cardPassword = request.getParameter("cardPassword"),
				 pC = request.getParameter("pC"), 
				 dd = request.getParameter("dd");
out.print(price+", "+card1+", "+card2+", "+card3+", "+card4+", "+cardMM+", "+cardYY+", "+cardPassword+", "+pC+", "+dd);
%>