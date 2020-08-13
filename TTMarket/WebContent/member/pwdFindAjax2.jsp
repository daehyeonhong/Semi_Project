<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
String id=request.getParameter("id");
String name=request.getParameter("name");
String mail=request.getParameter("mail");
%>
<%-- db접속 member테이블에서 조회 --%>
<sql:setDataSource
var="dataSource"
driver="oracle.jdbc.driver.OracleDriver"
url="jdbc:oracle:thin:@15.165.66.140:1521:xe"
user="ttestt"
password="ttestt11"
/>

<%--  조회 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
  SELECT PASSWORD FROM TTMember WHERE id=? AND name=? AND mail=?
  <sql:param value="<%=id%>"/>
  <sql:param value="<%=name%>"/>
  <sql:param value="<%=mail%>"/>
</sql:query>

<%-- 비밀번호 인증 성공--%>
<c:forEach var="row" items="${resultSet.rows}">
success
</c:forEach>

<%--   비밀번호 인증 실패 --%>
<c:if test="${empty resultSet.rows}">
fail
</c:if>