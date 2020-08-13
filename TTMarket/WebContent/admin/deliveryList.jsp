<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="../dbconn.jsp"%>
<%@ include file="../numberFormat.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<meta charset="UTF-8" />
<title>배송 관리</title>
</head>
<body>
	<script type="text/javascript">
		function changeStatusConfirm(id, productId, status) {
			let statusStr;
			switch (status) {
			case '1':
				statusStr = "결제 완료";
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
				location.href = "processUpdateDeliveryStatus.jsp?id=" + id
						+ "&productId=" + productId + "&status=" + status;
			} else {
				alert("요청이 취소되었습니다");
				location.href = "deliveryList.jsp";
			}
		}
	</script>
	<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@15.165.66.140:1521:xe" user="ttestt"
		password="ttestt11" />
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT DISTINCT S.deliverySeq,S.seq,S.sessionId,D.name,S.productId,S.saleQty,S.saleDate,D.deliveryDate,CONCAT_WS(D.nation,D.zipCode,D.address),S.STATUS FROM TTSale S, TTDelivery D WHERE S.deliverySeq=D.seq AND S.status NOT IN(6) GROUP BY S.seq ORDER BY S.seq,S.ProductId
	</sql:query>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 관리</h1>
		</div>
	</div>
	<div class="container col-10">
		<table class="table table-hover table-bordered">
			<caption>배송 관리</caption>
			<thead class="thead-dark">
				<tr>
					<th><small>배송 코드</small></th>
					<th><small>주문 코드</small></th>
					<th><small>주문 계정</small></th>
					<th><small>배송자 성함</small></th>
					<th><small>제품 명</small></th>
					<th><small>제품 수량</small></th>
					<th><small>주문 일</small></th>
					<th><small>배송 일</small></th>
					<th><small>배송지(배송국가, 우편번호, 주소)</small></th>
					<th><small>배송 상태</small></th>
				</tr>
			</thead>
			<c:forEach var="row" items="${resultSet.rowsByIndex}">
				<tr>
					<c:forEach var="columnValue" items="${row}" varStatus="i">
						<c:if test="${i.index == 1}">
							<c:set var="saleSeq" value="${columnValue}" />
						</c:if>
						<c:if test="${i.index == 4}">
							<c:set var="productId" value="${columnValue}" />
						</c:if>
						<c:choose>
							<c:when test="${i.last}">
								<c:set var="statusName" value="${columValue}" />
								<td>
									<select onchange="changeStatusConfirm('${saleSeq}','${productId}',this.value)">
										<c:forEach var="status" begin="1" end="6" varStatus="j">
											<c:set var="statusValue" value="${status}" />
											<option <c:if test="${status == columnValue}">selected="selected"</c:if> value="${statusValue}">
												<c:choose>
													<c:when test="${statusValue == 1}">결제 완료</c:when>
													<c:when test="${statusValue == 2}">배송 준비</c:when>
													<c:when test="${statusValue == 3}">배송 중</c:when>
													<c:when test="${statusValue == 4}">배송 완료</c:when>
													<c:when test="${statusValue == 5}">수령 완료</c:when>
													<c:when test="${statusValue == 6}">구매 확정</c:when>
												</c:choose>
											</option>
										</c:forEach>
									</select>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<c:out value="${columnValue}" />
								</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container col-10">
		<table>
			<tr>
				<td align="left">
					<a href="${pageContext.request.contextPath}/products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>