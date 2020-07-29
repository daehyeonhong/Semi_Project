<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 등록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<script type="text/javascript">
		function removeBtn(a) {
			alert(a);
		}
		function editBtn(a) {
			location.href = "editCategory.jsp?seq=" + a;
		}
	</script>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">카테고리 등록</h1>
		</div>
	</div>
	<div class="container">
		<table class="table table-bordered">
			<caption>카테고리 목록</caption>
			<thead class="thead-dark">
				<tr>
					<th>카테고리 번호</th>
					<th>카테고리 명</th>
					<th>카테고리 설명</th>
					<th>카테고리 관리</th>
				</tr>
			</thead>
			<%
				String sql = "select*from category";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
			%>
			<tr>
				<td>
					<%=resultSet.getString(1)%>
					<input type="hidden" id="seq" name="seq" value="<%=resultSet.getString(1)%>" />
				</td>
				<td><%=resultSet.getString(2)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td>
					<input type='button' value='삭제' id="remove<%=resultSet.getString(1)%>" onclick="removeBtn(<%=resultSet.getString(1)%>)" />
					<input type='button' value='수정' id="edit<%=resultSet.getString(1)%>" onclick="editBtn(<%=resultSet.getString(1)%>)" />
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<hr />
		<div class="text-right">
			<form class="form-horizontal" action="processAddCategory.jsp"
				method="post">
				<div class="form-group row">
					<label class="col-sm-2">카테고리 명: </label>
					<div class="col-sm-3">
						<input type="text" name="categoryName" class="form-control"
							required="required" placeholder="CategoryName" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">카테고리 설명: </label>
					<div class="col-sm-3">
						<input type="text" name="description" class="form-control"
							placeholder="Description" />
					</div>
				</div>
				<input type="submit" value="등록" class="btn btn-primary" /> <input
					type="reset" value="취소" class="btn btn-warning" /> <a
					href="./products.jsp" class="btn btn-secondary">리스트로 &raquo;</a>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<%
		if (resultSet != null) {
		resultSet.close();
	}
	if (preparedStatement != null) {
		preparedStatement.close();
	}
	if (con != null) {
		con.close();
	}
	%>
</body>
</html>