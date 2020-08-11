<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% String id=request.getParameter("id"); %>
<%-- db접속 member테이블에서 조회 --%>
<sql:setDataSource
var="dataSource"
driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://15.165.66.140:3306/TTMarketDB?useSSL=false"
user="root"
password="1234"
/>

<%--  조회 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
  select * from ttmember where id=?
  <sql:param value="<%=id%>"/>
</sql:query>

<%--  회원  id가 존재하면  처리 --%>
<c:forEach var="row" items="${resultSet.rows}">
fail
</c:forEach>

<%--   회원 id가 존재하지 않으면 --%>
<c:if test="${empty resultSet.rows}">
success
</c:if>