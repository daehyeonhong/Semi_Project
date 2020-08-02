<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="dbconn.jsp"%>
<%
	String sql = "select *  from ttsale s,ttdelivery d,ttproduct p ";
sql += " where s.productId=p.p_id and s.sessionId=d.sessionId order by s.seq";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
int seq = 0;
if (rs.next()) {
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">구매 내역</h1>
		</div>
	</div>
	<div class="container col-11 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br> 성명 :<%=rs.getString("name")%><br>
				우편번호:<%=rs.getString("zipcode")%><br> 주소:<%=rs.getString("address")%><br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>배송일:<%=rs.getString("deliverydate")%></em>
			</div>
			<%
				}
			%>
			<%
				sql = "select *  from ttsale s,ttdelivery d,ttproduct p ";
			sql += " where s.productId=p.p_id ";
			sql += " and s.sessionId=d.sessionId order by s.seq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			%>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품코드</th>
					<th class="text-center">상품명</th>
					<th class="text-center">상품수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;//총합계
				//상품리스트 하나씩 출력
				while (rs.next()) {
					int total
					= rs.getInt("unitPrice") * rs.getInt("saleqty");
					sum += total;
				%>
				<tr>
					<td class="text-center"><%=rs.getString("p_id")%>
						<input type="hidden" id="pid<%=seq%>" value="<%=rs.getString("p_id")%>" />
						<input type="hidden" id="seq<%=seq%>" value="<%=rs.getString("seq")%>" />
					</td>
					<td class="text-center"><em><%=rs.getString("p_name")%></em></td>
					<td class="text-center"><%=rs.getInt("saleqty")%></td>
					<td class="text-center"><%=rs.getInt("unitPrice")%></td>
					<td class="text-center"><%=total%></td>
					<td class="text-center">
						<select name="status" id="status<%=seq%>">
							<option value="1" <%=rs.getInt("status") == 1 ? "selected" : ""%>>결재완료</option>
							<option value="2" <%=rs.getInt("status") == 2 ? "selected" : ""%>>배송접수</option>
							<option value="3" <%=rs.getInt("status") == 3 ? "selected" : ""%>>배송중</option>
							<option value="4" <%=rs.getInt("status") == 4 ? "selected" : ""%>>배송완료</option>
							<option value="5" <%=rs.getInt("status") == 5 ? "selected" : ""%>>수령완료</option>
						</select>
						<input type="button" onclick="updateStatus(<%=seq++%>)" value="수정" />
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액:</strong></td>
					<td class="text-center text-danger"><strong><%=new DecimalFormat("#,###").format(sum)%></strong></td>
				</tr>
			</table>
			<!-- 확정메뉴 -->
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
<script>
function updateStatus(seq){
	let no=document.getElementById("seq"+seq).value;
	let status=document.getElementById("status"+seq).value;
	let p_id=document.getElementById("pid"+seq).value;
	alert('구매순번:' + seq + ',상품코드:' + p_id + ",상태:" + status);
	location.href = "updateSaleStatus.jsp?seq="+no+"&id="+p_id+"&status="+status;
}
</script>