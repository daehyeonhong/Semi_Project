<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductRepository"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	String cartId = (String) session.getAttribute("sessionId");
%>
<title>장바구니</title>
<script>
function change(seq){
	let id=document.getElementById("id"+seq).value;
	    id=id.substring(0,id.indexOf("-"));
	let qty = document.getElementById("qty"+seq).value;
	alert(id);
	let yesNo = confirm("수정하시겠습니까?");
	if (yesNo) location.href = "changeCart.jsp?id=" + id + "&qty=" + qty;
}
function k(seq){
	let btn = document.getElementById("btn" + seq);
	btn.disabled="";
}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>

		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가력</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>

				<%
					int sum = 0;
				List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
				if (cartList == null || (cartList.size() == 0))
					cartList = new ArrayList<Product>();

				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
				%>

				<tr>

					<td>
						<input type="text" value="<%=product.getProductId()%>-<%=product.getPname()%>" id="id<%=i%>" />
					</td>

					<td><%=product.getUnitPrice()%></td>

					<td>
						<input type="number" id="qty<%=i%>" value="<%=product.getQuantity()%>" onchange="k(<%=i%>)" />
						<input type="button" class="btn btn-primary" onclick="change(<%=i%>)" value="수정" id="btn<%=i%>" disabled="disabled" />
					</td>

					<td><%=total%></td>

					<td>
						<a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<a href="./products.jsp" class="btn btn=secondary">&laquo;쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>