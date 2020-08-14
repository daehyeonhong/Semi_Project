<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://15.165.66.140:3306/TTMarketDB?useSSL=false" user="ttestt"
	password="ttestt11#" />
<%-- 조회 --%>
<sql:query dataSource="${dataSource}" var="resultSet">
  SELECT*FROM TTMember WHERE id=?AND password=?
  <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>
<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
		session.setAttribute("loginToken", true);
	%>
	<c:redirect url="resultMember.jsp?msg=2" />
</c:forEach>
<c:redirect url="loginMember.jsp?error=1" />