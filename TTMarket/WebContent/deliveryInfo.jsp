<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../dbconn.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<script type="text/javascript">
		function detailClick(asd) {
			var id=document.getElementById("name"+asd).value;
			var address=document.getElementById("add"+asd).value;
			var zipcode= document.getElementById("zip"+asd).value; 
			alert("아이디: "+id+"\n"+"주소: "+address+"\n" +"우편번호 : "+zipcode +"\n");
		}
	</script>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">구매 내역</h1>
		</div>
	</div>
	<div class="container col-11 alert alert-info">
		<div class="text-center">
			<%
				String customerId = (String) session.getAttribute("sessionId");
			%>
			<h1>
				고객 Id:<%=customerId%></h1>
		</div>
		<div class="row justify-content-between">
			<%
				String sql = "SELECT DISTINCT s.deliverySeq,s.saleDate,s.productId,s.saleQty,s.unitPrice,s.status,d.name,d.address,d.zipCode"
					+ " from TTSale s,TTDelivery d where s.sessionId=d.sessionId and"
					+ " s.deliverySeq=d.seq and s.status not in (6) and s.sessionId=? GROUP BY s.seq";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customerId);
			ResultSet rs = pstmt.executeQuery();
			%>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">구매 번호</th>
					<th class="text-center">구매일자</th>
					<th class="text-center">상품명</th>
					<th class="text-center">상품수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">배송상태</th>
					<th class="text-center">고객명</th>
				</tr>
				<%
					int sum = 0, cnt = 0;//총합계
				//상품리스트 하나씩 출력
				while (rs.next()) {
					cnt++;
					/* int total = rs.getInt("unitprice") * rs.getInt("saleqty");
					sum += total;
					int unitprices = rs.getInt("saleqty") * rs.getInt("unitprice"); */
					String status = "";
					switch (rs.getInt("status")) {
					case 1:
						status = "결제완료";
						break;
					case 2:
						status = "배송접수";
						break;
					case 3:
						status = "배송중";
						break;
					case 4:
						status = "배송완료";
						break;
					case 5:
						status = "수령완료";
						break;
					}
				%>
				<tr>
					<td class="text-center"><%=rs.getString("s.deliveryseq")%></td>
					<td class="text-center"><%=rs.getString("s.saleDate")%></td>
					<td class="text-center"><%=rs.getString("s.productId")%></td>
					<td class="text-center"><%=rs.getInt("s.saleQty")%></td>
					<td class="text-center"><%=rs.getInt("s.unitprice")%></td>
					<td class="text-center"><%=status%></td>
					<td class="text-center"><%=rs.getString("d.name")%></td>
					<td class="text-center"><input type="hidden" id="name<%=cnt%>"
						value="<%=rs.getString("d.name")%>"></td>
					<td class="text-center"><input type="hidden" id="add<%=cnt%>"
						value="<%=rs.getString("d.address")%>"></td>
					<td class="text-center"><input type="hidden" id="zip<%=cnt%>"
						value="<%=rs.getString("d.zipcode")%>"></td>
					<td class="text-center"><input type="button" value="상세보기"
						onclick="detailClick(<%=cnt%>)" /></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="container col-11">
	<a class="btn btn-secondary" href="./products.jsp">상품목록&raquo;</a>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>