<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	String sessionId=(String)session.getAttribute("sessionId");
%>
<sql:setDataSource 
  var="dataSource"
  driver="com.mysql.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/WebMarketDB"
  user="root"
  password="1234"
  />

<c:catch var="ex">  
<sql:update dataSource="${dataSource}" var="resultSet">
    delete from member where id=?
    <sql:param value="<%=sessionId%>"/>
</sql:update> 
</c:catch>
${ex}

<c:if test="${resultSet>0}">
   <c:import url="logoutMember.jsp" var="url"/>
   <c:redirect url="resultMember.jsp"/>
</c:if>




 