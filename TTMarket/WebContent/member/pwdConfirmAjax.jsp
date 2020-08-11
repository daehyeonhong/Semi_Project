<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
String id = (String) session.getAttribute("sessionId");
String pwd=request.getParameter("oldpwd");
%>

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
  select * from ttmember where id=? and password=?
  <sql:param value="<%=id%>"/>
  <sql:param value="<%=pwd%>"/>
</sql:query>

<%-- 비밀번호 인증 성공--%>
<c:forEach var="row" items="${resultSet.rows}">
success
</c:forEach>

<%--   비밀번호 인증 실패 --%>
<c:if test="${empty resultSet.rows}">
fail
</c:if>