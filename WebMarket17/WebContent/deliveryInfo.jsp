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
<script type="text/javascript">
function detailClick(asd) {
	var id=document.getElementById("name"+asd).value;
	var address=document.getElementById("add"+asd).value;
	var zipcode= document.getElementById("zip"+asd).value; 
	alert("아이디: "+id+"\n"+"주소: "+address+"\n" +"우편번호 : "+zipcode +"\n");
	
}
</script>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">

	<div class="container">

	<h1 class="display-3">구매 내역</h1>

	</div>

</div>

<div class="container col-11 alert alert-info" >

  <div class="text-center">
<%  String customerId= (String)session.getAttribute("sessionId");%>
    <h1>고객 Id:<%=customerId %></h1>

  </div>

  <div class="row justify-content-between" >
  
  <%
  
  
  String sql="select s.saleDate,s.sessionId,s.productId,s.unitPrice,s.saleQty,s.status,d.name ,d.zipCode,d.address from sale s, delivery d where s.sessionId=? and s.seq=d.seq";
  PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,customerId);
ResultSet rs= pstmt.executeQuery();

  
  %>

  </div>

  <div>

    <table class="table table-hover">

       <tr>

         <th class="text-center">구매일자</th>

         <th class="text-center">상품명</th>

         <th class="text-center">상품수량</th>

         <th class="text-center">가격</th>

         <th class="text-center">합계</th>
        
        <th class="text-center">배송상태</th>
        
       <!--  <th class="text-center">이름</th>
        
        <th class="text-center">주소</th>
        
        <th class="text-center">우편번호</th> -->
        

       </tr>

       <%

       int sum=0,cnt=0;//총합계

       //상품리스트 하나씩 출력

       while(rs.next()){
		cnt++;
       	int total

       	   =rs.getInt("unitprice")*rs.getInt("saleqty");

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

   <td class="text-center"><%=rs.getString("saledate")%> </td>

    <td class="text-center"><%=rs.getString("productId")%></td>

    <td class="text-center"><%=rs.getInt("saleqty")%></td>

    <td class="text-center"><%=rs.getInt("unitprice")%></td>

    <td class="text-center"><%=unitprices%></td>
    
     <td class="text-center"><%=statuse%></td>
    
 <td class="text-center">
 <input type="hidden" id="name<%=cnt%>" value="<%=rs.getString("name")%>"></td>
 <td class="text-center">
 <input type="hidden" id="add<%=cnt%>" value="<%=rs.getString("address")%>"></td>
 <td class="text-center">
 <input type="hidden" id="zip<%=cnt%>" value="<%=rs.getString("zipcode")%>"></td>
 <td class="text-center">
 <input type="button" value="상세보기" onclick="detailClick(<%=cnt%>)"/></td>
 

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

    <!-- 확정메뉴 -->

    <a href="./thankCustomer.jsp" 

      class="btn btn-success" role="button">주문 완료</a>

    <a href="./checkOutCancelled.jsp"

      class="btn btn-secondary" role="button">취소</a>
   

  </div>
</div>
<jsp:include page="footer.jsp"/>

</body>

</html>