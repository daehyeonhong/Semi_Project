<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/WebMarketDB" user="root"
	password="1234" />
<%-- 조회 --%>
<sql:query dataSource="${dataSource}" var="resultSet">
  select * from ttmember where id=? and password=?
  <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>
<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2" />
</c:forEach>
<c:redirect url="loginMember.jsp?error=1" />



