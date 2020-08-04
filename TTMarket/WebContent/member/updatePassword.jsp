<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group row">
		<label class="col-sm-2">비밀번호</label>
		<div class="col-sm-3">
			<input type="password" name="password" class="form-control"
				placeholder="password" />
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2">비밀번호확인</label>
		<div class="col-sm-3">
			<input type="password" name="password_confirm" class="form-control"
				placeholder="password_confirm" /> <input type="button"
				class="btn btn-primary" value="비밀번호" id="changePassword"
				name="changePassword" onclick="changePass('${row.id}')" />
		</div>
	</div>
</body>
</html>