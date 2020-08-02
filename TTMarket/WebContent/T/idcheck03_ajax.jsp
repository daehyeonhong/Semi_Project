<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<%String id=request.getParameter("id"); %>

<sql:setDataSource   var="dataSource" 

      driver="com.mysql.jdbc.Driver"

      url="jdbc:mysql://localhost:3306/WebMarketDB"

      user="root"

      password="1234"/>
      
<sql:query var="resultSet" dataSource="${dataSource}">
select * from member where id=?
<sql:param value="<%=id %>"/>
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
fail
</c:forEach>

<c:if test="${empty resultSet.rows}">
success
</c:if>

</body>
</html>