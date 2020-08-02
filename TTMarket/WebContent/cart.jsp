<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@include file="numberFormat.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	priceFormat = new DecimalFormat("\u00A4 #,###");
numberFormat = new DecimalFormat("#,###");
String cartId = (String) session.getAttribute("sessionId");
int sum = 0;
List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
if (cartList == null || (cartList.size() == 0)) {
	cartList = new ArrayList<Product>();
}
%>
<!-- sessionId -->
<meta charset="UTF-8" />
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/* JavaScript Function Init function[function_name](argument){}*/
	function deleteCart() {
		/* alert("카트초기화"); */
		/* 메세지 출력 메소드 */
		if (confirm("장바구니를 비우시겠습니까?")) {
			document.addForm.submit();/* action경로로 이동 처리 */
		} else {
			document.addForm.reset();/* 초기화 처리 */
		}
	}

	function change(id) {
		/* let id = document.getElementById("id").value.substring(0, 5); */
		let qty = document.getElementById(id).value;
		let name = document.getElementById(id).name;
		if (qty < 0) {
			qty = 0;
		}
		
		if(qty==0){
				if (confirm(name + "의 수량을 " + qty + "개로 변경하시겠습니까?\n\r상품 수량이 없으면 장바구니에서 삭제됩니다.")) {
					location.href = "./removeCart.jsp?id="+id;
				} else {
					location.href = "cart.jsp";
				 }
		}else{
		if (confirm(name + "의 수량을 " + qty + "개로 변경하시겠습니까?")) {
			location.href = "changeCart.jsp?id=" + id + "&qty=" + qty;
		} else {
			document.addForm.reset();
		}
	}
		}

	function changeNumber(id) {
		let btn = document.getElementById(id);
		btn.disabled = "";
	}
	
	function checkCart (cartSize) {
		if (cartSize > 0) {
			location.href = './shippingInfo.jsp?cartId=<%=cartId%>';
		} else {
			alert('카트가 비어있습니다.');
		}
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
	<!-- jumbotron -->
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger" onclick="deleteCart()">삭제하기</a>
					</td>
					<td align="right">
						<a class="btn btn-success" style="color: #fff" onclick="checkCart(<%=cartList.size()%>)">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px;">
			<table class="table talbe-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					String id = product.getProductId();
					int total = product.getUnitPrice() * product.getQuantity();/* 단가 * 수량 = 금액 */
					sum = sum + total;/* sum(총금액) = 개별 상품의 가격 합. */
					String price = priceFormat.format(product.getUnitPrice()), qnt = numberFormat.format(product.getQuantity()),
					totalDf = priceFormat.format(total);
					String qty = String.valueOf(product.getQuantity());
				%>
				<tr>
					<td>
						<input type="text" value="<%=id%> - <%=product.getPname()%>" id="id" readonly />
					</td>
					<td><%=price%></td>
					<td>
						<input type="number" id="<%=id%>" name="<%=product.getPname()%>" value="<%=product.getQuantity()%>" onchange="changeNumber(<%=i%>)" />
						<input type="button" id="<%=i%>" class="btn btn-primary" onclick="change('<%=id%>')" value="수정" disabled="disabled" />
					</td>
					<td><%=totalDf%></td>
					<td>
						<a href="./removeCart.jsp?id=<%=id%>" class="badge badge-danger">삭제</a>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>