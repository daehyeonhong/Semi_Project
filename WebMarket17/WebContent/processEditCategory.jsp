<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
String categoryName = request.getParameter("categoryName"), description = request.getParameter("description");
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false" user="root"
	password="1234" />
<c:catch var="except">
	<sql:update dataSource="${dataSource}" var="result">
	update category set categoryName=?, description=? where seq=?
		<sql:param value="<%=categoryName%>" />
		<sql:param value="<%=description%>" />
		<sql:param value="<%=seq%>" />
	</sql:update>
</c:catch>
<c:if test="${empty except}">
	<c:if test="${result>0}">
		<c:redirect url="addCategory.jsp" />
	</c:if>
</c:if>
${except}
