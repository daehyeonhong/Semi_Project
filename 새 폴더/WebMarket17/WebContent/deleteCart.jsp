<%@page import="java.util.List"%><%@page import="dto.Product"%><%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //cartId를 얻어서 정보가 없으면 다시 cartlist로 이동
   String id=request.getParameter("cartId");
   if(id==null || id.equals("")){
	   response.sendRedirect("cart.jsp");
	   return;
   }
   
   //session에서 모든정보 삭제
   session.invalidate();
   //삭제된 화면으로 이동.
   response.sendRedirect("cart.jsp");

   
%>