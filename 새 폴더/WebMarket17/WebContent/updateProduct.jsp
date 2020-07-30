<%@page import="java.sql.ResultSet"%><%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    String p_id=request.getParameter("id");
    String sql="select * from product where p_id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1,p_id);
	ResultSet rs=pstmt.executeQuery();
	rs.next();
	//category 값 저장
	String category=rs.getString("p_category");
	//상품상태 값 저장
	String condition=rs.getString("p_condition");
%>

<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
<div class="container">
	<h1 class="display-3"><fmt:message key="title"/></h1>
</div>
</div>
<div class="container">
<div class="text-right">
<!-- 자신에게 되돌아 올때 파라미터를 queryString으로 전달받기
     href="?변수명=값" -->
  <a href="?language=ko&id=<%=p_id%>">Korean</a>|
  <a href="?language=en&id=<%=p_id%>">English</a>
  <a href="logout.jsp" 
     class="btn btn-sm btn-success pull-right">logout</a>
</div>

<form name="newProduct" action="./processUpdateProduct.jsp"
  	 class="form-horizontal" method="post" enctype="multipart/form-data">
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="productId"/></label>
   <div class="col-sm-3">
   		<input type="text" name="productId" id="productId" class="form-control"
   		  value="<%=rs.getString("p_id")%>" readonly>
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="pname"/></label>
   <div class="col-sm-3">
   		<input type="text" name="pname" id="pname" class="form-control" value="<%=rs.getString("p_name")%>">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="unitPrice"/></label>
   <div class="col-sm-3">
   		<input type="text" name="unitPrice" id="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice")%>">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="description"/></label>
   <div class="col-sm-5">
   		<textarea rows="2" cols="50" name="description"
   		  id="description" class="form-control" required><%=rs.getString("p_description")%></textarea>
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="manufacturer"/></label>
   <div class="col-sm-3">
   		<input type="text" name="manufacturer" 
   		  id="manufacturer" class="form-control" required value="<%=rs.getString("p_manufacturer")%>">
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="category"/></label>
   <div class="col-sm-3">
   <select name="category" class="form-control" id="category">
   <%
       String sql2="select categoryName from category order by seq";
       PreparedStatement pstmt2=con.prepareStatement(sql2);
       ResultSet rs2=pstmt2.executeQuery();
   %>
   <%
    while(rs2.next()){
    out.print("<option value='"+rs2.getString(1)+"' "+
              (rs2.getString(1).equals(category)?"selected":"") 
    		
    		+" >"
              +rs2.getString(1)+"</option>");
    }
    %>
   </select>
   </div>
</div>
<%
    if(rs2!=null)rs2.close();
	if(pstmt2!=null) pstmt2.close();
   // if(con2!=null) con2.close();
%>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
   <div class="col-sm-3">
   		<input type="text" name="unitsInStock" id="unitsInStock" class="form-control"
   		 value="<%=rs.getLong("p_unitsInStock") %>"
   		>
   </div>
</div>

<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="condition"/></label>
   <div class="col-sm-5">
   	<input type="radio" name="condition" 
   	     value="New" <%=condition.equals("New")?"checked":""%>><fmt:message key="condition_New"/>
   	<input type="radio" name="condition" 
   	     value="Old" <%=condition.equals("Old")?"checked":""%>><fmt:message key="condition_Old"/>
   	<input type="radio" name="condition" 
  value="Refurbished" <%=condition.equals("Refurbished")?"checked":""%>><fmt:message key="condition_Refurbished"/>
   </div>
</div>
<div class="form-group row">
   <label class="col-sm-2"><fmt:message key="productImage"/></label>
   <div class="col-sm-5">
   	<input type="file" name="productIamge" class="form-control">
   </div>
</div>
<div class="form-group row">
   <div class="col-sm-offset-2 col-sm-10">
   		<input type="submit" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="return CheckAddProduct()">
   </div>
</div>
</form>
</div>
<%
    if(rs!=null)rs.close();
	if(pstmt!=null) pstmt.close();
    if(con!=null) con.close();
%>
<jsp:include page="footer.jsp"/>
</fmt:bundle>