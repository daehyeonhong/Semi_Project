<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl sql</title>
</head>
<body>
	<%
		String seq = request.getParameter("seq");
		String pid = request.getParameter("id");
		String status = request.getParameter("status");
	%>
	<%-- db 연결설정 --%>
	<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@15.165.66.140:1521:xe" user="ttestt"
		password="ttestt11" />
	<%-- db update처리 --%>
	<sql:update dataSource="${dataSource}" var="resultSet">
    UPDATE TTSale SET status=? WHERE seq=? AND productId=?
    <sql:param value="<%=status%>" />
		<sql:param value="<%=seq%>" />
		<sql:param value="<%=pid%>" />
	</sql:update>
	<%-- 이동 --%>
	<c:redirect url="../salesInfo.jsp" />
</body>
</html>