<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav mr-auto">
		<li>
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/welcome.jsp">Home</a>
			</div>
		</li>
			<%
				if (request.isUserInRole("admin")) {
			%>
			<li class="nav-item">
				<span class="nav-link">[관리자님]</span>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/admin/logout.jsp">로그아웃</a>
			</li>
			<li class="nav-item">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/products.jsp">상품목록</a>
			</li>
			<li class="nav-item">
				<div class="btn-group">
					<label class="navbar-brand dropdown-toggle" data-toggle="dropdown">
						<span>관리자 메뉴</span>
		      </label>
		      <ul class="dropdown-menu">
		      	<li class="dropdown-header">상품 관리</li>
		      	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/addProduct.jsp">상품등록</a></li>
		      	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/editProduct.jsp?edit=update">수정</a></li>
		      	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/editProduct.jsp?edit=delete">삭제</a></li>
		      	<li class="divider"></li>
		      	<li class="dropdown-header">??? 관리</li>
      			<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/addCategory.jsp">카테고리 관리</a></li>
      			<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/deliveryList.jsp">배송 관리</a></li>
		      </ul>
	      </div>
			</li>
			<%
				} else {
			%>
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/member/loginMember.jsp">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/member/addMember.jsp">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/products.jsp">상품목록</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/deliveryInfo.jsp" style="color: #0FC; font-weight: bold;">[<%=sessionId%>님]</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/member/logoutMember.jsp">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a>
					</li>
					<li class="nav-item">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/products.jsp">상품목록</a>
						<a class="navbar-brand" href="${pageContext.request.contextPath}/cart.jsp">장바구니</a>
					</li>
				</c:otherwise>
			</c:choose>
			<%
				}
			%>
		</ul>
	 	<form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/SearchListAction.search" method="post">
		 	<select class="form-control mr-sm-2" name="items">
		 		<!-- <option value="unified">통합검색</option> -->
		 		<option value="p_name">상품명</option>
		 		<option value="p_id">상품코드</option>
		 		<option value="p_category">카테고리</option>
		 		<option value="p_condition">상태</option>
		 		<option value="p_manufacturer">제조사</option>
		 	</select>
	    <input class="form-control mr-sm-2" type="text" name="text" placeholder="Search" />
	    <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
  	</form>
	</div>
</nav>