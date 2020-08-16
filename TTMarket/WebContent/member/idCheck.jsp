<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% String id=request.getParameter("id"); %>
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
  SELECT*FROM TTMember WHERE id=?
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