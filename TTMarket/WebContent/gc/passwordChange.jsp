<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	String newPasswordConfirm = request.getParameter("newPasswordConfirm");
	%>

	<form name="idCheck">
		<label>id:</label>
		<input name="id" id="id" value="<%=id%>" />
		<label>기존비밀번호:</label>
		<input type="password" id="oldPassword" name="oldPassword" autofocus required />
		<label>새 비밀번호:</label><input type="password" id="newPassword" name="newPassword" required />
		<label>비밀번호 확인:</label>
		<input type="password" id="newPasswordConfirm" name="newPasswordConfirm" required />
		<input type="submit" value="변경"> <input type="button" value="닫기" onclick="javascript:self.close();" />
	</form>

	<c:set var="id" value="<%=id%>" />
	<c:set var="oldPassword" value="<%=oldPassword%>" />
	<c:set var="newPassword" value="<%=newPassword%>" />

	<c:if
		test="${(id!=null) and (oldPassword!=null) and (newPassword!=null)}">
		<%-- db접속 member테이블에서 조회 --%>
		<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/WebMarketDB" user="root"
			password="1234" />
		<c:catch var="ex">
			<sql:query var="resultSet" dataSource="${dataSource}">
  select * from ttmember where id=? and password=?
  <sql:param value="<%=id%>" />
				<sql:param value="<%=oldPassword%>" />
			</sql:query>
		</c:catch>
${ex}

<c:forEach items="${resultSet.rows}">
			<sql:update var="result" dataSource="${dataSource}">
	  update ttmember set password=? where id=?
	 <sql:param value="${newPassword}" />
				<sql:param value="${id}" />
			</sql:update>
			<script>
				alert('비밀번호 변경 성공');
			</script>
		</c:forEach>
		<c:if test="${empty resultSet.rows}">
			<script>
				alert('비밀번호를 확인해주세요');
			</script>
		</c:if>
	</c:if>
</body>
</html>