<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기(2)</title>
<script>
	function Find_id2(){
	opener.location.href="./loginMember.jsp";
	self.close();
	}
</script>
</head>
<body>

<% 
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String mail=request.getParameter("mail");
		String phone=request.getParameter("phone");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="";
%>

<% 
	try {
		sql = "select * from ttmember where name=? and mail=? and phone=?";
		pstmt = con.prepareStatement(sql);
	 	pstmt.setString(1, name);
		pstmt.setString(2, mail);
		pstmt.setString(3, phone); 
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String id = rs.getString("id");
			out.print(name+"님의 ID는 "+id+"입니다."); 
			}else
			out.print(name+"님과 일치하는 정보를 찾지 못했습니다."); 
		}catch (SQLException e) {
			out.println(e.getMessage());
	
		} finally {
		
		if (rs !=null) rs.close();
		if (con !=null) con.close();
		if (pstmt !=null) pstmt.close();
		}
		
%>
<div>
	<p><input type="submit" value="확인" onclick='Find_id2()'/>
</div>
</body>
</html>