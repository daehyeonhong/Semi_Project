<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/WebMarketDB" user="root"
	password="1234" />
<sql:query var="resultSet" dataSource="${dataSource}">
  select * from ttmember where id=?
  <sql:param value="<%=sessionId%>" />
</sql:query>
<meta charset="UTF-8">
<title>이메일 변경</title>
</head>
<body>
<script type="text/javascript">
function cancelBtn() {
	let yesNo = confirm('정말 취소하시겠습니까?');
	if (yesNo) {
		history.back();
	} else {
		alert('요청이 취소되었습니다.');
	}
}
$().ready(function () {
	$('#mailBtn').click(function () {
		let email = $('#mail1').val().trim();
		let com =  $('#mail2').val().trim();
		if (email != '') {
		$('#mail2Val').val(com);
		window.open("../mail/mailConfirm.jsp?mail1="+email+"&mail2="+com, 'mail인증', "_blank",
				"toolbar=yes", "scrollbars=yes",
		"resizable=yes,top=500,left=500,width=50,height=50");
		} else {
			alert('인증하려는 메일 주소를 입력하세요');
		}
	});
	
	$('#updMailBtn').click(function () {
		$('#mail1').removeAttr("readonly");
		$('#mail2').removeAttr("disabled");
		$('#mailBtn').attr("type", "button");
		$('#updMailBtn').attr("type", "hidden");
		$('#mailChecked').val('false');
		$('#mail1').val('');
		$('#mail2Val').val('');
	});
	$('#checkForm').click(function () {
		let checkMail = $('#mailChecked').val();
		if (checkMail == 'true') {
			$('#newMember').submit();
		} else {
			alert('Mail 인증 후 다시 시도하세요.');
		}
	})
});
</script>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">이메일 변경</h1>
		</div>
	</div>
		<div class="container">
		<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="mail" value="${row.mail}" />
		<c:set var="mail1" value="${mail.split('@')[0]}" />
		<c:set var="mail2" value="${mail.split('@')[1]}" />
			<form name="newMember" id="newMember" class="form-horizontal"
				action="processUpdateMail.jsp" method="post">

				<div class="form-group row">
					<div class="input-group mb-3">
						<label class="col-sm-2">이메일</label>
			      <input name="mail1" id="mail1" maxlength="50" class="form-control col-sm-3" placeholder="Your Email" value="${mail1}" readonly="readonly" required="required"/>
			      <div class="input-group-prepend">
			        <span class="input-group-text">@</span>
			      </div>
			      <div class="input-group-append">
			        <select name="mail2" id="mail2" disabled="disabled">
								<option value="naver.com"
								<c:if test="${mail2=='naver.com'}">selected</c:if>>naver.com</option>
							<option value="daum.net"
								<c:if test="${mail2=='daum.net'}">selected</c:if>>daum.net</option>
							<option value="gmail.com"
								<c:if test="${mail2=='gmail.com'}">selected</c:if>>gmail.com</option>
							</select>
				      </div>
				      <div class="input-group-append">
							<input class="btn btn-info" type="hidden" id="mailBtn" value="이메일 인증">
							<input class="btn btn-warning" style="color: #FFF;" type="button" id="updMailBtn" value="이메일 수정">
					 	 </div>
							<input type="text" id="mailChecked" value="false" />
							<input type="text" id="mail2Val" name="mail2Val" />  
				    </div>
					</div>

				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" value="이메일 변경" class="btn btn-success" id="checkForm" />
						<input type="button" value="취소" class="btn btn-secondary" onclick="cancelBtn()">
					</div>
				</div>
			</form>
	</c:forEach>
		</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>