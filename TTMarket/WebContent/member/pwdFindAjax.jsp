<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
String id=request.getParameter("id");
String pwd=request.getParameter("pwd"); 
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
<sql:update var="resultSet" dataSource="${dataSource}">
  update ttmember set password=? where id=?
  <sql:param value="<%=pwd%>"/>
  <sql:param value="<%=id%>"/>
</sql:update>
<%-- 비밀번호 변경 성공 --%>

<c:if test="${resultSet > 0}">
<%-- <c:redirect url="resultMember.jsp?msg=1"/> --%>
success
</c:if>
<%-- 비밀번호 변경 실패 --%>
<c:if test="${empty resultSet}">
<%-- <c:redirect url="resultMember.jsp?msg=1" /> --%>
fail
</c:if>