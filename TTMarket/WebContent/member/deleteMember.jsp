<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function deleteMember() {
			let yesNo = confirm("정말 탈퇴하시겠습니까?");
			if (yesNo) {
				location.href = "deleteMember.jsp";
			} else {
				return;
			}
		}
	</script>
	<a href="javascript:deleteMember();" class="btn btn-danger">회원탈퇴</a>
</body>
</html>