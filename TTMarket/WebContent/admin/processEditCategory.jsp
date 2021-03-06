<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
int seq = Integer.parseInt(request.getParameter("seq"));
String categoryName = request.getParameter("categoryName"), description = request.getParameter("description");
%>
<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver"
	url="jdbc:oracle:thin:@15.165.66.140:1521:xe" user="ttestt"
	password="ttestt11" />
<c:catch var="except">
	<sql:update dataSource="${dataSource}" var="result">
	UPDATE TTCategory SET categoryName=?,description=? WHERE seq=?
		<sql:param value="<%=categoryName%>" />
		<sql:param value="<%=description%>" />
		<sql:param value="<%=seq%>" />
	</sql:update>
</c:catch>
<c:if test="${empty except}">
	<c:if test="${result>0}">
		<c:redirect url="updateCategory.jsp" />
	</c:if>
</c:if>
${except}