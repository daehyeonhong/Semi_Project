<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="../dbconn.jsp"%>
<%@include file="../numberFormat.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>배송 관리</title>
</head>
<body>
	<script type="text/javascript">
		function changeStatusConfirm(id, productId, status) {
			let statusStr;
			switch (status) {
			case '1':
				statusStr = "결제완료";
				break;
			case '2':
				statusStr = "배송 접수";
				break;
			case '3':
				statusStr = "배송 중";
				break;
			case '4':
				statusStr = "배송 완료";
				break;
			case '5':
				statusStr = "수령 완료";
				break;
			case '6':
				statusStr = "구매 확정";
				break;
			}
			let yesNo = confirm("정말 [" + statusStr + "] 상태로 변경하시겠습니까?");
			if (yesNo) {
				location.href = "processChangeDeliveryStatus.jsp?id=" + id
						+ "&productId=" + productId + "&status=" + status;
			} else {
				alert("요청이 취소되었습니다");
				location.href = "deliveryList.jsp";
			}
		}
	</script>
	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/WebMarketDB?UseSSL=false" user="root"
		password="1234" />
	<sql:query var="resultSet" dataSource="${dataSource}">
			SELECT DISTINCT S.DELIVERYSEQ,S.SALEDATE,S.PRODUCTID,S.SALEQTY,D.NAME,D.DELIVERYDATE,D.NATION,D.ZIPCODE,D.ADDRESS,S.STATUS,S.SESSIONID,S.SEQ FROM TTSALE S, TTDELIVERY D WHERE S.deliverySeq=D.SEQ AND S.STATUS NOT IN(6) GROUP BY S.SEQ ORDER BY S.SEQ,S.PRODUCTID
		</sql:query>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 관리</h1>
		</div>
	</div>
	<!-- <div class="container col-10">
		<table class="table table-hover table-bordered"> -->
			<caption>배송 관리</caption>
			<thead class="thead-dark">
				<tr>
					<th><small>주문 코드</small></th>
					<th><small>주문일</small></th>
					<th><small>제품 코드</small></th>
					<th><small>수량</small></th>
					<th><small>고객ID</small></th>
					<th><small>고객명</small></th>
					<th><small>배송일</small></th>
					<th><small>배송 주소(국가) -- (주소) -- (우편번호)</small></th>
					<th><small>배송 상태</small></th>
				</tr>
			</thead>
			<c:forEach var="row" items="${resultSet.rowsByIndex}">
				<c:forEach var="column" items="${row}">
				${column}
					<%-- <c:set var="deliverySeq" value="${column.getInt('S.DELIVERSEQ')}" />
					${deliverSeq} --%>
				</c:forEach>
			</c:forEach>
			
			<%-- 
			<%
				while (searchResultSet.next()) {
				int deliverySeq = searchResultSet.getInt("S.deliverySeq"), saleqty = searchResultSet.getInt("S.SALEQTY"),
				saleSeq = searchResultSet.getInt("S.SEQ");
				String saleDate = searchResultSet.getString("S.SALEDATE"), productId = searchResultSet.getString("S.PRODUCTID"),
				name = searchResultSet.getString("D.NAME"), deliveryDate = searchResultSet.getString("D.DELIVERYDATE"),
				nation = searchResultSet.getString("D.NATION"), zipcode = searchResultSet.getString("D.ZIPCODE"),
				address = searchResultSet.getString("D.ADDRESS"), sessionId = searchResultSet.getString("S.SESSIONID");
				address = "(" + nation + ") -" + "- (" + address + ") -" + "- (" + zipcode + ")";
				int statusNumber = searchResultSet.getInt("S.STATUS");
				String status;
			%>
			<tr>
				<td><%=deliverySeq%></td>
				<td><%=saleDate%></td>
				<td style="min-width: 100px"><%=productId%></td>
				<td style="min-width: 70px"><%=saleqty%></td>
				<td style="min-width: 50px"><%=sessionId%></td>
				<td style="min-width: 50px"><%=name%></td>
				<td><%=deliveryDate%></td>
				<td><%=address%></td>
				<td><select
					onchange="changeStatusConfirm('<%=saleSeq%>','<%=productId%>',this.value)">
				</select></td>
			</tr>
			<%
				}
			%>
		</table>
		<hr />
	</div>
	<div class="container col-10">
		<table>
			<tr>
				<td align="left"><a
					href="${pageContext.request.contextPath}/products.jsp"
					class="btn btn-secondary">&laquo;상품 목록</a></td>
			</tr>
		</table>
	</div> --%>
	<jsp:include page="../footer.jsp" />
</body>
</html>