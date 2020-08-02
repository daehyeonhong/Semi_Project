<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<script>
alert("이미 사용중인 아이디 입니다.");
opener.newMember.id.value='';
opener.newMember.id.focuse();
self.close();
</script>
</c:forEach>
<script>
alert("사용가능한 아이디 입니다.");
opener.newMember.id.readOnly=true;
opener.newMember.password.focus();
self.close();

</script>


</body>
</html>