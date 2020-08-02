<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="numberFormat.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>결제</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$().ready(function() {
			$('#submitBtn').click(function() {
				$('#purchaseForm').submit();
			});
			$('#cancelBtn').click(function() {
				alert('취소합니다.');
				location.href = './cart.jsp';
			});
			$('#cardYY').change(function() {
				alert('삉');
			});
		});
	</script>
	<%@include file="../menu.jsp"%>
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
			
				<%
				long sum = Long.parseLong(request.getParameter("sum"));
				List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
				if (cartList != null) {
					for(Product product : cartList) {
					%>
							<input value="<%=product.getProductId()%>" disabled="disabled" />
							<input value="<%=product.getQuantity()%>" disabled="disabled" /><br />
					<%
					}
				} else {
					response.sendRedirect("exception/emptyCart.jsp");
				}
				%>
			<form id="purchaseForm" class="was-validated" action="processPurchase.jsp" method="post">
				<label>결제금액</label><br />
				<input class="text-right" value="<%=priceFormat.format(sum)%>" disabled="disabled" /><br />
				<input type="hidden" id="price" name="price" value="price" /><br />
				<label>카드 번호</label><br />
				<input id="cardId1" name="cardId1" maxlength="4" placeholder="0000" required="required" />
				<span>-</span>
				<input id="cardId2" name="cardId2" maxlength="4" placeholder="0000" type="password" required="required" />
				<span>-</span>
				<input id="cardId3" name="cardId3" maxlength="4" placeholder="0000" type="password" required="required" />
				<span>-</span>
				<input id="cardId4" name="cardId4" maxlength="4" placeholder="0000" required="required" /><br />
				<label>유효기간 월 MM</label> <label>유효기간 년</label><br />
				<select class="form-control" name="cardMM" id="cardMM" required="required">
					<option value="MM" selected="selected">MM</option>
					<option value="1">01</option>
					<option value="2">02</option>
					<option value="3">03</option>
					<option value="4">04</option>
					<option value="5">05</option>
					<option value="6">06</option>
					<option value="7">07</option>
					<option value="8">08</option>
					<option value="9">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<span>  </span>
				<input type="number" id="cardYY" name="cardYY" value="" min="0" max="99" placeholder="YY" required="required" /><br />
				<label>비밀번호 앞 2자리</label><br />
				<input type="password" id="cardPassword" name="cardPassword" maxlength="2" placeholder="비밀번호 앞 2자리" required="required" /><br />
				<label>인증번호 주민번호 앞 6자리</label><br />
				<input type="password" id="birth" name="birth" maxlength="6" placeholder="주민번호 앞 6자리" required="required" /><br />
				<label>할부기간</label><br />
				<select name="payment" id="payment" required="required">
					<option value="0" selected="selected">일시불</option>
					<option value="1">1개월</option>
					<option value="2">2개월</option>
					<option value="3">3개월</option>
					<option value="4">4개월</option>
					<option value="5">5개월</option>
					<option value="6">6개월</option>
					<option value="7">7개월</option>
					<option value="8">8개월</option>
					<option value="9">9개월</option>
					<option value="10">10개월</option>
					<option value="11">11개월</option>
					<option value="12">12개월</option>
				</select><br />
				<input class="btn btn-success" type="button" id="submitBtn" value="결제하기" />
				<input class="btn btn-danger" type="button" id="cancelBtn" value="취소하기" />
			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
