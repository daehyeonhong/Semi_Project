<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Set"%>
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
<script>
	function find_password2(){
	opener.location.href="./loginMember.jsp";
	self.close();
	}
</script>
<title>비밀번호찾기(2)</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String mail=request.getParameter("mail");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="";
%>
<%
try{
	sql="select password from ttmember where id=? and name=? and mail=?";
	pstmt = con.prepareStatement(sql);	
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, mail);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		String  password = rs.getString("password");
		out.print(name+"님의 비밀번호는 "+password+"입니다.");
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
	<p><input type="submit" value="확인" onclick='find_password2()'/>
</div>
</body>
</html>