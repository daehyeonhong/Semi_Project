<%@page import="dto.Product"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>    
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">

<title>배송 상세 정보</title>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
   	<h1 class="display-3">상품 정보</h1>
   </div>
</div>

<div class="container">

 <div class="row" align="center">


 
<%
	String name=request.getParameter("name");
    System.out.println("넘어온 id:"+name);
    String sql="select * from sale s, delivery d where s.sessionId=d.sessionId and d.name=?";
    PreparedStatement pstmt=con.prepareStatement(sql);
 	pstmt.setString(1,name);
   	ResultSet rs=pstmt.executeQuery();
    int seq=0;
    if(rs.next()){
 
%>
<div>
<table class="table table-hover">
 <tr>

    <td class="text-center"><%=rs.getString("name")%>

    <input type="hidden" id="pid<%=seq%>" value="<%=rs.getString("name")%>" >

    <input type="hidden" id="seq<%=seq%>" value="<%=rs.getString("seq")%>" >

    </td>

    <td class="text-center"><em><%=rs.getString("productId")%></em></td>

    <td class="text-center"><%=rs.getInt("saleqty")%></td>

    <td class="text-center"><%=rs.getInt("sessionId")%></td>

    <td class="text-center"><%=rs.getInt("status")%></td>

    <td class="text-center"><!-- <input type="button" value="구매 확정">
 -->
   

   </tr>

</table>
</div>

<%}      if(rs!=null) rs.close();

     if(pstmt!=null)pstmt.close();

     if(con!=null)con.close();
%>


</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>