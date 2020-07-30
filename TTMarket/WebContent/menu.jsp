<%-- <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   /* 로그인 여부확인  */
	String sessionId=(String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
  <div class="container">
     <div class="navbar-header">
       <a class="navbar-brand" href="${pageContext.request.contextPath}/welcome.jsp">Home</a>
     </div>
    <ul class="navbar-nav mr-auto">
     <c:choose>  
       <c:when test="${empty sessionId}">
       	<li class="nav-item"><a class="nav-link" href='${pageContext.request.contextPath}/member/loginMember.jsp'>로그인</a></li>
       	<li class="nav-item"><a class="nav-link" href='${pageContext.request.contextPath}/member/addMember.jsp'>회원가입</a></li>
       </c:when>
       <c:otherwise>
       	<li style="padding-top:7px;color:white">[<%=sessionId%>님]</li>
       	<li class="nav-item"><a class="nav-link" href='${pageContext.request.contextPath}/member/logoutMember.jsp'>로그아웃</a></li>
       	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a></li>
       </c:otherwise>
     </c:choose>  
       <li class="nav-item"><a class="navbar-brand" href="${pageContext.request.contextPath}/products.jsp">상품목록</a></li>
       <li class="nav-item"><a class="navbar-brand" href="${pageContext.request.contextPath}/addProduct.jsp">상품등록</a></li>
       <li class="nav-item"><a class="navbar-brand" href="${pageContext.request.contextPath}/editProduct.jsp?edit=update">수정</a></li>
       <li class="nav-item"><a class="navbar-brand" href="${pageContext.request.contextPath}/editProduct.jsp?edit=delete">삭제</a></li>
       <li class="nav-item"><a class="navbar-brand" href="${pageContext.request.contextPath}/addCategory.jsp">카테고리등록</a></li>
    </ul>
 </div>
</nav> --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"href="${pageContext.request.contextPath}/welcome.jsp">Home</a>
		</div>
		<ul class="navbar-nav mr-auto">
			<% if(request.isUserInRole("admin")){%>
				<li style="padding-top:7px;color:white">[관리자님]</li>
				<li class="nav-item"><a class="nav-link"href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a></li>
				<li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/products.jsp">상품목록</a></li>
				<li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/addProduct.jsp">상품등록</a></li>
				<li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/editProduct.jsp?edit=update">수정</a></li>
				<li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/editProduct.jsp?edit=delete">삭제</a></li>
				<li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/addCategory.jsp">카테고리 등록</a></li>
				<%-- <li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1">게시판</a></li> --%>
			<%}else{
			%>	
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link"href="${pageContext.request.contextPath}/member/loginMember.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link"href="${pageContext.request.contextPath}/member/addMember.jsp">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li style="padding-top:7px;color:white">[<%=sessionId%>님]</li>
					<li class="nav-item"><a class="nav-link"href="${pageContext.request.contextPath}/member/logoutMember.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link"href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a></li>
				</c:otherwise>
			</c:choose>
			<li class="nav-item"><a class="navbar-brand"href="${pageContext.request.contextPath}/products.jsp">상품목록</a></li>
			<li class="nav-item"><a class="navbar-brand" href="${pageContext.request.contextPath}/deliveryInfo.jsp">배송조회</a></li>
			<%} 
			%>
		</ul>
	</div>
</nav>