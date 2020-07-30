<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<% String id=request.getParameter("id"); %>
<%-- db접속 member테이블에서 조회 --%>
<sql:setDataSource
var="dataSource"
driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/WebMarketDB"
user="root"
password="1234"
/>

<%--  조회 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
  select * from member where id=?
  <sql:param value="<%=id %>"/>
</sql:query>

<%--  회원  id가 존재하면  처리 --%>addMember_windowOpen.jsp
<c:forEach var="row" items="${resultSet.rows}">
  <script>
   alert("이미 사용 중인 아이디입니다.");
   opener.newMember.id.value='';
   opener.newMember.id.focus();
   self.close();
  </script>
</c:forEach>

<%--   회원 id가 존재하지 않으면 --%>
<script>
   alert("사용가능한 아이디입니다.");
   opener.newMember.id.readOnly=true;
   opener.newMember.password.focus();
   self.close();
  </script>



</body>
</html>