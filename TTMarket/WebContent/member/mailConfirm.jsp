<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>이메일체크</title>
</head>
<script>
	$(document).ready(function() {
		$('#btn').click(function() {
			/* alert($('#confirm_num').val()); */
			if ($('#confirm_num').val() == 20) {
				alert('인증이완료되었습니다.');
				window.close();
			} else {
				alert('인증에 실패하였습니다.');
				return;
			}
		});
	});
</script>
<body>
	<%
		String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String email = mail1 + "@" + mail2;

	out.print(email);
	%>
	<form>
		<input type="text" name="confirm_num" id="confirm_num" />
		<input type="button" id="btn" value="전송" />
	</form>
</body>
</html>