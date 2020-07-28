<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$().ready(function() {
			$('#submitBtn').click(function() {
				$('#purchaseForm').submit();
			});
		});
	</script>
	<%@include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">결제</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<label>하이요</label>
			</div>
		</div>
		<div>
			<form id="purchaseForm" action="processPurchase.jsp" method="post">
				<label>결제금액</label><br />
				<input value="결제금액" value="price" disabled="disabled" /><br />
				<input type=" value="결제금액" id="price" name="price" value="price" disabled="disabled" /><br />
				<label>카드 번호</label><br />
				<input value="카드 번호1" id="cardId1" name="cardId1" maxlength="4" placeholder="0000" />
				<span>-</span>
				<input value="카드 번호2" id="cardId2" name="cardId2" maxlength="4" placeholder="0000" />
				<span>-</span>
				<input value="카드 번호3" id="cardId3" name="cardId3" maxlength="4" placeholder="0000" />
				<span>-</span>
				<input value="카드 번호4" id="cardId4" name="cardId4" maxlength="4" placeholder="0000" /><br />
				<label>유효기간 월 MM</label> <label>유효기간 년</label><br />
				<input type="number" id="cardMM" name="cardMM" value="" min="1" max="12"  />
				<span>  </span>
				<input type="number" id="cardYY" name="cardYY" value=""min="0" max="99" /><br />
				<label>비밀번호 앞 2자리</label><br />
				<input type="password" id="cardPassword" name="cardPassword" maxlength="2" placeholder="비밀번호 앞 2자리"/><br />
				<label>인증번호</label><br />
				<label>주민번호 앞 6자리</label><br />
				<input type="password" id="pC" name="pC" maxlength="6" placeholder="주민번호 앞 6자리"/><br />
				<label>할부기간</label><br />
				<select name="dd" id="dd">
					<option value="hahaha">일시불</option>
					<option value="hahaha1" id="hahaha1">1개월</option>
					<option value="hahaha2" id="hahaha2">2개월</option>
					<option value="hahaha3" id="hahaha3">3개월</option>
					<option value="hahaha4" id="hahaha4">4개월</option>
					<option value="hahaha5" id="hahaha5">5개월</option>
					<option value="hahaha6" id="hahaha6">6개월</option>
					<option value="hahaha7" id="hahaha7">7개월</option>
					<option value="hahaha8" id="hahaha8">8개월</option>
					<option value="hahaha9" id="hahaha9">9개월</option>
					<option value="hahaha10" id="hahaha10">10개월</option>
					<option value="hahaha11" id="hahaha11">11개월</option>
					<option value="hahaha12" id="hahaha12">12개월</option>
				</select><br />
				<input type="button" id="submitBtn" value="결제하기" />
			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
