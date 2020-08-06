<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>이메일 인증</title>
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
				$('#sendMailBtn').attr('type', 'hidden');
				$('#loadMailBtn').removeAttr('hidden');
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
				window.opener.$('#mail2').attr("disabled", "disabled");
				window.opener.$('#mailChecked').val('true');
				window.opener.$('#mailBtn').attr("type", "hidden");
				window.opener.$('#updMailBtn').attr("type", "button");
				<%session.removeAttribute("presentCode");
				session.removeAttribute("email");%>
				window.close();
			} else {
				alert('인증 실패');
				window.close();
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
		<p>
			<input type="button" class="btn btn-primary" id="sendMailBtn" value="메일보내기">
   		<button id="loadMailBtn" class="btn btn-primary" hidden="hidden" disabled="disabled">
    		<span class="spinner-grow spinner-grow-sm"></span>
		   Loading..
		 </button>
		</p>
		<input type="text" id="reciveCode" placeholder="인증코드입력" />
		<input type="hidden" id="presentCode" />
		<input type="button" id="checkCode" value="인증하기" />
	</form>

</body>

</html>