<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
	<%
		String option = request.getParameter("option"), keyword = request.getParameter("keyword");
	%>
	<c:set var="option" value="<%=option%>" />
	<c:set var="keyword" value="<%=keyword%>" />
	<c:choose>
		<c:when test="${option=='p_name'}">
			<title>제품명 검색</title>
		</c:when>
		<c:when test="${option=='p_category'}">
			<title>카테고리 검색</title>
		</c:when>
		<c:when test="${option=='p_condition'}">
			<title>상태별 검색</title>
		</c:when>
		<c:otherwise>
			<title>통합 검색</title>
		</c:otherwise>
	</c:choose>
</head>
<body>
	<%@include file="/menu.jsp"%>
	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB" user="root"
		password="1234" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">검색 결과</h1>
		</div>
	</div>
	<c:choose>
		<c:when test="${option=='p_name'}">
			
		</c:when>
		<c:when test="${option=='p_category'}">
			
		</c:when>
		<c:when test="${option=='p_condition'}">
			
		</c:when>
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
</body>
</html>