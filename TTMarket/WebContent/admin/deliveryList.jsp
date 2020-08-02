<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../dbconn.jsp"%>
<%@include file="../numberFormat.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>배송 관리</title>
</head>
<body>
	<%
		String searchSql = "select d.sessionId,s.saleDate,s.productId,s.saleQty,d.name,d.deliveryDate,d.nation,d.zipCode,d.address, s.status from ttsale s,ttdelivery d where s.sessionId=d.sessionId and s.status not in (5) order by s.seq";
	PreparedStatement searchPreparedStatement = con.prepareStatement(searchSql);
	ResultSet searchResultSet = searchPreparedStatement.executeQuery();
	String satusSql = "select status from ttstatus";
	PreparedStatement statusPreparedStatement = con.prepareStatement(satusSql);
	ResultSet statusResultSet = null;
	%>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 관리</h1>
		</div>
	</div>
	<div class="container col-10">
		<table class="table table-hover table-bordered">
			<caption>배송 관리</caption>
			<thead class="thead-dark ">
				<tr>
					<th><small>주문 코드</small></th>
					<th><small>주문일</small></th>
					<th><small>제품 코드</small></th>
					<th><small>수량</small></th>
					<th><small>고객명</small></th>
					<th><small>구매일</small></th>
					<th><small>배송 국가</small></th>
					<th><small>우편번호</small></th>
					<th><small>배송 주소</small></th>
					<th><small>배송 상태</small></th>
				</tr>
			</thead>
			<%
				while (searchResultSet.next()) {
				statusResultSet = statusPreparedStatement.executeQuery();
			%>
			<tr>
				<td><%=searchResultSet.getString(1)%></td>
				<td><%=searchResultSet.getString(2)%></td>
				<td style="min-width: 100px"><%=searchResultSet.getString(3)%></td>
				<td style="min-width: 70px"><%=searchResultSet.getString(4)%></td>
				<td style="min-width: 50px"><%=searchResultSet.getString(5)%></td>
				<td><%=searchResultSet.getString(6)%></td>
				<td><%=searchResultSet.getString(7)%></td>
				<td><%=searchResultSet.getString(8)%></td>
				<td><%=searchResultSet.getString(9)%></td>
				<td><select
					onchange="changeStatusConfirm('<%=searchResultSet.getString(1)%>','<%=searchResultSet.getString(3)%>',this.value)">
						<%
							while (statusResultSet.next()) {
							String selected = (statusResultSet.getString(1).equals(searchResultSet.getString(10)))
							? "selected=\"selected\""
							: "";
						%>
						<option value="<%=statusResultSet.getString(1)%>" <%=selected%>><%=statusResultSet.getString(1)%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<%
				}
			%>
		</table>
		<hr />
	</div>
	<div class="container">
		<div class="row">
			<table>
				<tr>
					<td align="left">
						<a href="${pageContext.request.contextPath}/products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		function changeStatusConfirm(id, productId, status) {
			let yesNo = confirm("정말 [" + status + "] 상태로 변경하시겠습니까?");
			if (yesNo) {
				location.href = "processChangeDeliveryStatus.jsp?id=" + id
						+ "&productId=" + productId + "&status=" + status;
			} else {
				alert("요청이 취소되었습니다");
				location.href = "deliveryList.jsp";
			}
		}
	</script>
</body>
</html>
