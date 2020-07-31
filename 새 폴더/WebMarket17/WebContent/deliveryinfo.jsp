<%@page import="java.text.DecimalFormat"%>

<%@page import="dto.Product"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>

<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="dbconn.jsp" %>



<html>

<head>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>

</head>

<body>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">

	<div class="container">

	<h1 class="display-3">구매 내역</h1>

	</div>

</div>

<div class="container col-11 alert alert-info" >

  <div class="text-center">
<%  String customerId= (String)session.getAttribute("sessionId");%>
    <h1>고객 ID:<%=customerId %></h1>

  </div>

  <div class="row justify-content-between" >





  <%
  
 /*  int seq=0; */
  String sql="select * from sale where sessionId=?";
  PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,customerId);
ResultSet rs= pstmt.executeQuery();

  %>

  </div>

  <div>

    <table  class="table table-hover" >

       <tr>

         <th class="text-center">구매일자</th>

         <th class="text-center">상품명</th>

         <th class="text-center">상품수량</th>

         <th class="text-center">가격</th>

         <th class="text-center">합계</th>
        
        <th class="text-center">배송상태</th>

       </tr>

       <%

       int sum=0;//총합계

       //상품리스트 하나씩 출력

       while(rs.next()){

       	int total

       	   =rs.getInt("unitPrice")*rs.getInt("saleqty");

       	sum+=total;	
       	
       	int unitprices=rs.getInt("saleqty")*rs.getInt("unitprice");
       	
       	String statuse="";
       	switch(rs.getInt("status")){
       	case 1: statuse="결제완료"; break;
       	case 2: statuse="배송접수"; break;
       	case 3: statuse="배송중"; break;
       	case 4: statuse="배송완료"; break;
       	case 5: statuse="수령완료"; break;
       	}

       %>

   <tr>

   <td class="text-center"><%=rs.getString("saledate")%>

    

    <td class="text-center"><%=rs.getString("productId")%></td>

    <td class="text-center"><%=rs.getInt("saleqty")%></td>

    <td class="text-center"><%=rs.getInt("unitprice")%></td>

    <td class="text-center"><%=unitprices%></td>

    <td class="text-center"><%=statuse%></td>



   </tr>

      <%}%>

   <tr>
   
<td></td>

    <td></td>

    <td class="text-right"><strong>총액:</strong></td>   

    <td class="text-center text-danger">

      <strong><%=new DecimalFormat("#,###").format(sum)%></strong></td>   

   </tr> 

    </table>




  </div>
</div>




<jsp:include page="footer.jsp"/>

</body>

</html>