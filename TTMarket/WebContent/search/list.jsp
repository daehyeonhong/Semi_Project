<%@page import="mvc.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../numberFormat.jsp"%>
<%
	List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
	String items = (String) request.getAttribute("items"),
			text = (String) request.getAttribute("text");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="items" value="<%=items%>"/>
<c:choose>
	<c:when test="${items=='p_name'}">
		<title>상품명 검색</title>
	</c:when>
	<c:when test="${items=='p_id'}">
		<title>상품코드 검색</title>
	</c:when>
	<c:when test="${items=='p_category'}">
		<title>카테고리 검색</title>
	</c:when>
	<c:when test="${items=='p_condition'}">
		<title>상품 상태 검색</title>
	</c:when>
	<c:when test="${items=='p_description'}">
		<title>상품 설명 검색</title>
	</c:when>
	<c:otherwise>
		<title>제조사 검색</title>
	</c:otherwise>
</c:choose>
</head>
<body>
<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">검색 결과</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%
			if (productList.size() > 0) {
			for (int i = 0; i < productList.size(); i++) {
				ProductDTO notice = productList.get(i);
			%>
			<div class="col-md-4">
				<img alt="" src="./resources/images/<%=notice.getFileName()%>"
					style="width: 100%">
				<h3><%=notice.getName()%></h3>
				<p><%=notice.getDescription()%></p>
				<p><%=priceFormat.format(notice.getUnitPrice())%></p>
				<p>
					<a href="product.jsp?id=<%=notice.getProductId()%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>
			</div>
			<%
				}
			} else {
				%>
				<h3 class="alert alert-danger">검색 결과가 없습니다.</h3>
				<%
			}
			%>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>