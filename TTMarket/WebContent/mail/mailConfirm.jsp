<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../dbconn.jsp"%>
<%@ include file="../mail/randomNum.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	
	$('#sendMailBtn').click(function () {
		window.open("../mail/EmailCheck.mail", 'mail보내기', "_blank",
		"toolbar=yes", "scrollbars=yes",
		"resizable=yes,top=500,left=500,width=50,height=50"); 
		$('#confirm_num2').focus();
	  
		});
	$('#btn2').change(function () {
		let confirm_num2 = $('#confirm_num2').val().trim();
		if (isNaN(confirm_num2)) {
			$('#btn2').val('');
			$('#btn2').focus;
		}
	});
});
	function checkBtn(corNum) {
		alert(corNum);
		let ranNum = document.getElementById("random").value;
		if (corNum == ranNum) {
			alert('성공');
			window.opener.document.getElementById('mailChecked').value='true';
			window.close();
		}else {
			alert('실패');
		}
	}
</script>
<body>
<%
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String email = mail1 + "@" + mail2;
	session.setAttribute("sendRandom", random);
	String randomVal = session.getAttribute("sendRandom").toString();
	/* if (???.equals((String) session.getAttribute("sendRandom"))){
		인증
	} 실패 */
	%>
	<%-- 
	<p>입력된 아이디:<%=email %> --%>
	<form action=""method="post" >
			<p>입력된 아이디:<%=email %>
		<input type="button" id="sendMailBtn" value="메일보내기"/></p>
		<input type="text" id="random"  />
		<input type="button" id="checkRandom" onclick="checkBtn(<%=randomVal%>)"  value="인증하기" />
	</form>

</body>
</html>