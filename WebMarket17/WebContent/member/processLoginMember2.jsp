<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="../dbconn.jsp" %>
<%
    //한글값 설정
	request.setCharacterEncoding("utf-8");
    
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    System.out.println("id:"+id+",password:"+password);
%>
<%-- 조회 --%>
<%
    String sql="select * from member where id=? and password=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2,password);
	
	ResultSet rs=pstmt.executeQuery();

	 RequestDispatcher rd
	 =request.getRequestDispatcher("resultMember.jsp?msg=2");
     
	 while(rs.next()){
        session.setAttribute("sessionId",id);
      // response.sendRedirect("resultMember.jsp?msg=2");
      rd.forward(request, response);
     }
     response.sendRedirect("loginMember.jsp?error=1");
%>