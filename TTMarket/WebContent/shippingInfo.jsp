<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>배송 정보</title>
</head>
<body>
	<script type="text/javascript">
		function checkDefault (name,postcode,address) {
			let checkStatus = document.getElementById('check').value
			if (checkStatus == 'false') {
				document.getElementById('check').value = 'true';
				document.getElementById('name').value = name;
				document.getElementById('zipCode').value = postcode;
				document.getElementById('addressName').value = address;
			} else {
				document.getElementById('check').value = 'false';
				document.getElementById('name').value = '';
				document.getElementById('zipCode').value = '';
				document.getElementById('addressName').value = '';
			}
		}
	</script>
	<%
		String sql = "SELECT name,postcode,address,detailAddress,extraAddress FROM TTMember WHERE id=?",
				id = (String) session.getAttribute("sessionId"),
				name = null,
				postcode = null,
				address = null;
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, id);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			name = resultSet.getString(1);
			postcode = resultSet.getString(2);
			address = resultSet.getString(3) + "/ " + resultSet.getString(4) + "/ " + resultSet.getString(5);
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
			<div class="form-group">
				<div class="col-sm-3">
					<label class="col-sm-10">
						<input type="checkbox" id="check" value="false" onchange="checkDefault('<%=name%>','<%=postcode%>','<%=address%>')" />회원 정보로 입력
					</label>
				</div>
			</div>
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" id="name" class="form-control" required="required" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input name="shippingDate" class="form-control" placeholder="(yyyy/mm/dd)" required="required" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">국가</label>
				<div class="col-sm-3">
					<input name="country" class="form-control" required="required" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" id="zipCode" class="form-control" required="required" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="addressName" id="addressName" class="form-control" required="required" />
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button">이전</a>
					<input type="submit" class="btn btn-primary" value="등록" />
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>