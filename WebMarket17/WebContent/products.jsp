<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
   	<h1 class="display-3">상품 목록</h1>
   </div>
</div>
<%@include file="dbconn.jsp" %>
<%
   String sql="select * from product order by p_id";
   PreparedStatement pstmt=con.prepareStatement(sql);
   ResultSet rs=pstmt.executeQuery();
%>
<div class="container">
 <div class="row" align="center">
    <%
    	while(rs.next()){
     %>		 
    	<div class="col-md-4">
    	  <img src="./resources/images/<%=rs.getString("p_fileName")%>"
    	       style="width:100%">
    	  <h3><%=rs.getString("p_name")%></h3>
    	  <p><%=rs.getString("p_description") %></p>
    	  <p><%=rs.getInt("p_unitPrice")%></p>
    	  <p><a href="./product.jsp?id=<%=rs.getString("p_id")%>"
    	    class="btn btn-secondary" role="button">상세정보 &raquo;</a>
    	  </p>
    	</div>
    <%		 
       }
    %>
 </div>
<hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>