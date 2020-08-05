<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html>

<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	overflow: hidden;
}
</style>
</head>
<script>
	$(document).ready(function() {

		$('#sendMailBtn').click(function() {

			let yesNo = confirm('정말 인증 코드 메일을 발송하시겠습니까?');
			if (yesNo) {
			$.ajax({
				type : 'POST',
				url : '../mail/EmailCheck.mail',
				dataType : 'text',
				success : function(data) {
					alert(data);
					$('#presentCode').val(data);
				}
			});
			} else {
				alert('요청이 취소되었습니다.');
				window.close();
			}
			
		});

		$('#checkCode').click(function() {
			let presentCode = $('#presentCode').val().trim();
			let resiveCode = $('#reciveCode').val().trim();
			if (resiveCode != '' && presentCode == resiveCode) {
				alert('인증 성공');
				window.opener.$('#mail1').attr("readonly", "readonly");
				window.opener.$('#mail2').attr("readonly", "readonly");
				window.opener.$('#mailChecked').val('true');
				window.opener.$('#mailBtn').attr("type", "hidden");
				window.opener.$('#updMailBtn').attr("type", "button");
				<%session.removeAttribute("presentCode");
				session.removeAttribute("email");%>
				window.close();
			} else {
				alert('인증 실패');
			}
		})
	});
</script>

<body>
	<%
		String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String email = mail1 + "@" + mail2;
	session.setAttribute("email", email);
	%>
	<form action="" method="post">
		<p>입력된 아이디:<%=email%></p>
		<p><input type="button" id="sendMailBtn" value="메일보내기" /></p>
		<input type="text" id="reciveCode" placeholder="인증코드입력" />
		<input type="hidden" id="presentCode" />
		<input type="button" id="checkCode" value="인증하기" />
	</form>

</body>

</html>