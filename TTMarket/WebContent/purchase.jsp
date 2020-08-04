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
	let year = new Date().getFullYear().toString();
	let month = (new Date().getMonth() + 1).toString();
		$().ready(function() {
			$('#cancelBtn').click(function() {
				alert('취소합니다.');
				location.href = './cart.jsp';
			});
			
			$('#cardYY').change(function() {
				let cardYY = $('#cardYY').val();
				let cardMM = $('#cardMM').val();
				if (isNaN(cardYY)) {
					alert('숫자를 입력하세요.');
					$('#cardYY').val('');
					$('#cardYY').focus();
				} else {
					if (cardYY < year.substr(2) || ((cardYY == year.substr(2)) && (cardMM < month))) {
						alert('올바른 유효기간을 입력하세요.');
						$('#cardYY').val('');
						$('#cardYY').focus();
					}
				}
			});

		 $('#cardMM').change(function () {
				let cardYY = $('#cardYY').val();
				let cardMM = $('#cardMM').val();
				if (isNaN(cardMM)) {
					alert('숫자를 입력하세요.');
					$('#cardMM').val('');
					$('#cardMM').focus();
				}	else {
					if (isNaN(cardYY) || cardMM > 12 || cardMM < 1 || (cardYY == year.substr(2)) && (cardMM < month)) {
						alert('올바른 유효기간을 입력하세요.');
						$('#cardMM').val('');
						$('#cardMM').focus();
					}
				}
			});
		 
		 $('#cardId1').change(function () {
			if (isNaN($('#cardId1').val())) {
				alert('숫자를 입력하세요.');
				$('#cardId1').val('');
				$('#cardId1').focus();
			}
		});
		 
		 $('#cardId2').change(function () {
			if (isNaN($('#cardId2').val())) {
				alert('숫자를 입력하세요.');
				$('#cardId2').val('');
				$('#cardId2').focus();
			}
		});
		 
		 $('#cardId3').change(function () {
			if (isNaN($('#cardId3').val())) {
				alert('숫자를 입력하세요.');
				$('#cardId3').val('');
				$('#cardId3').focus();
			}
		});
		 
		 $('#cardId4').change(function () {
			if (isNaN($('#cardId4').val())) {
				alert('숫자를 입력하세요.');
				$('#cardId4').val('');
				$('#cardId4').focus();
			}
		});
		 
		 $('#cardPassword').change(function () {
			if (isNaN($('#cardPassword').val())) {
				alert('올바른 값을 입력하세요.');
				$('#cardPassword').val('');
				$('#cardPassword').focus();
			}
		});
		 
		 $('#birth').change(function () {
			if (isNaN($('#birth').val())) {
				alert('올바른 값을 입력하세요.');
				$('#birth').val('');
				$('#birth').focus();
			}
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
				<label><%=sessionId%> 고객님</label>
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
			<form id="purchaseForm" action="processPurchase.jsp" method="post">
				<label>결제금액</label><br />
				<input class="text-right" value="<%=priceFormat.format(sum)%>" disabled="disabled" /><br />
				<input type="hidden" id="price" name="price" value="price" /><br />
				<label>카드 번호</label><br />
				<ul class="list-group list-group-horizontal">
					<li class="list-group col-sm-2"><input id="cardId1" class="form-control" name="cardId1" maxlength="4" placeholder="0000" required="required" /></li>
					<li class="list-group"><span>-</span></li>
					<li class="list-group col-sm-2"><input id="cardId2" class="form-control" name="cardId2" maxlength="4" placeholder="0000" type="password" required="required" /></li>
					<li class="list-group"><span>-</span></li>
					<li class="list-group col-sm-2"><input id="cardId3" class="form-control" name="cardId3" maxlength="4" placeholder="0000" type="password" required="required" /></li>
					<li class="list-group"><span>-</span></li>
					<li class="list-group col-sm-2"><input id="cardId4" class="form-control" name="cardId4" maxlength="4" placeholder="0000" required="required" /></li>
				</ul>
				<div>
				<label>유효기간 월 MM</label> <label>유효기간 년</label><br />
				<input type="number" class="form-control col-sm-2" style="display: inline-block;" name="cardMM" id="cardMM" required="required" placeholder="MM" />
				<span>  </span>
				<input type="number" class="form-control col-sm-2" style="display: inline-block;" id="cardYY" name="cardYY" value="" min="0" max="99" placeholder="YY" required="required" /><br />
				</div>
				<label>비밀번호 앞 2자리</label><br />
				<input type="password" class="form-control col-sm-4" id="cardPassword" name="cardPassword" maxlength="2" placeholder="비밀번호 앞 2자리" required="required" /><br />
				<label>인증번호 주민번호 앞 6자리</label><br />
				<input type="password" class="form-control col-sm-4" id="birth" name="birth" maxlength="6" placeholder="주민번호 앞 6자리" required="required" /><br />
				<label>할부기간</label><br />
				<select name="payment" class="form-control col-sm-2" id="payment" required="required">
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
				<input class="btn btn-success" type="submit" id="submitBtn" value="결제하기" />
				<input class="btn btn-danger" type="button" id="cancelBtn" value="취소하기" />
			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
