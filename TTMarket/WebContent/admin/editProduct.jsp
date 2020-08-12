<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<%
	String edit = request.getParameter("edit");
%>
<c:set var="edit" value="<%=edit%>"/>
<c:if test="${edit=='update'}">
<title>상품 편집</title>
</c:if>
<c:if test="${edit=='delete'}">
<title>상품 삭제</title>
</c:if>
</head>
<body>
<script>
	function deleteConfirm(id) {
		if (confirm("해당 상품 " + id + "을 삭제합니다.!!") == true) {
			location.href = 'deleteProduct.jsp?id=' + id;
		} else {
			return;
		}
	}
</script>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<c:if test="${edit=='update'}">
				<h1 class="display-3">상품 편집</h1>
			</c:if>
			<c:if test="${edit=='delete'}">
				<h1 class="display-3">상품 삭제</h1>
			</c:if>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@include file="../dbconn.jsp"%>
			<%
				String sql = "SELECT*FROM TTProduct";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%" />
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%></p>
				<p><%=rs.getString("p_unitPrice")%>원</p>
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button">
						수정 &raquo;>
					</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">
						삭제 &raquo;>
					</a>
					<%
						}
					%>
				</p>
			</div>
			<%
				}
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (con != null)
			con.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>