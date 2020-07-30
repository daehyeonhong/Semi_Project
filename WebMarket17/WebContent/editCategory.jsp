<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
<script type="text/javascript">
	function cancelBtn() {
		alert('요청이 취소되었습니다.');
		location.href='./addCategory.jsp';
	}
	
	function confirmBtn() {
		let categoryName = document.getElementById('categoryName').value;
		let description = document.getElementById('description').value;
		let yesNo = confirm('정말 변경하시겠습니까?');
		if (yesNo) {
			categoryForm.submit();
		} else {
			alert('요청이 취소되었습니다.');
		}
	}
</script>
	<%
		int seq = Integer.parseInt(request.getParameter("seq"));
	String sql = "select*from category where seq=?";
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	preparedStatement.setInt(1, seq);
	ResultSet resultSet = preparedStatement.executeQuery();
	if (resultSet.next()) {
	%>
	<form action="./processEditCategory.jsp" id="categoryForm" method="post">
		<table class="table table-hover table-bordered col-sm-9">
			<thead class="thead-dark">
				<tr>
					<th>카테고리 번호</th>
					<th>카테고리 명</th>
					<th>카테고리 설명</th>
				</tr>
			</thead>
			<tr>
				<td><%=resultSet.getString(1)%><input type="hidden" name="seq" value="<%=seq%>" /></td>
				<td><input placeholder="CategoryName" id="categoryName" name="categoryName" value="<%=resultSet.getString(2)%>" /></td>
				<td><input placeholder="Description" id="description" name="description" value="<%=resultSet.getString(3)%>" /></td>
			</tr>
		</table>
			<div class="col-sm-9 text-right">
				<input class="btn btn-warning" type="button" value="취소" onclick="cancelBtn()" />
				<input class="btn btn-success" type="button" value="변경" onclick="confirmBtn()" />
			</div>
	</form>
	<%
		}
	%>
</body>
</html>