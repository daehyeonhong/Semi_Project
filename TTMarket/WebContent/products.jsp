<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="numberFormat.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<style>/*탑 버튼 스타일  */
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="dbconn.jsp"%>
	<%
		String sql = "SELECT*FROM TTProduct ORDER BY p_id";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	%>

	<div class="container">
		<div class="jumbotron">
			<h3 class="display-3">상품 목록</h3>
		</div>
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<%
					int count = 0;
				while (rs.next()) {
					if (count++ == 0) {
				%>
				<div class="carousel-item active">
					<img src="./resources/images/<%=rs.getString("p_filename")%>"
						alt="<%=rs.getString("p_id")%>"
						style="width: 100%; height: 400px;"
						onclick="location.href='product.jsp?id=<%=rs.getString("p_id")%>'">
				</div>
				<%
					} else {
				%>
				<div class="carousel-item">
					<img src="./resources/images/<%=rs.getString("p_filename")%>"
						alt="<%=rs.getString("p_id")%>"
						style="width: 100%; height: 400px;"
						onclick="location.href='product.jsp?id=<%=rs.getString("p_id")%>'">
				</div>
				<%
					}
				}
				%>


			</div>
			<!-- 이미지 슬라이드 좌우 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<!-- 상품 목록 -> 장바구니 갯수, 클릭시 바로 이동 -->
	<div style="width: 50px; height: 50px; position: fixed; top: 200px; right: 30px;">
		<!--카트 리스트  -->
		<%
			List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
		if (cartList == null)
			cartList = new ArrayList<Product>();
		%>
		<a href="cart.jsp"><svg width="4em" height="4em"
				viewBox="0 0 16 16" class="bi bi-cart4" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
					d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 
					.485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a
					.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3
					.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l
					.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l
					.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 
					1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
</svg><%=cartList.size()%></a>
	</div>
	<%
		sql = "SELECT*FROM TTProduct ORDER BY p_id";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("p_fileName")%>"
					style="width: 100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%></p>
				<p><%=priceFormat.format(rs.getInt("p_unitPrice"))%></p>
				<p>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>
			</div>
			<%
				}
			%>
		</div>
		<hr>
		<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	</div>
	<jsp:include page="footer.jsp" />
	<!-- 탑 버튼 스크립트 -->
	<script>
		//Get the button
		var mybutton = document.getElementById("myBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>
</body>
</html>