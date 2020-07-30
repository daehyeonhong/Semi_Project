<%@page import="java.text.DecimalFormat"%>

<%@page import="dto.Product"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>

<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="dbconn.jsp" %>


  <%
  
  String sessionId = request.getParameter("id");
  int seq=0;
  String sql="select * from sale where sessionId=?";
  PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,sessionId);
ResultSet rs= pstmt.executeQuery();
  %>



  <div>

    <table class="table table-hover">

       <tr>
       
		<th class="text-center">고객 아이디</th>

         <th class="text-center">상품명</th>

         <th class="text-center">상품수량</th>

         <th class="text-center">가격</th>

         <th class="text-center">합계</th>
        

       </tr>

       <%

            int sum=0;//총합계

            //상품리스트 하나씩 출력

            while(rs.next()){

            	int total

            	   =rs.getInt("unitPrice")*rs.getInt("saleqty");

            	sum+=total;	
            	
            	int unitprices=rs.getInt("saleqty")*rs.getInt("unitprice");

       %>

   <tr>

    <td class="text-center"><%=rs.getString("sessionId")%>

    <input type="hidden" id="pid<%=seq%>" value="<%=rs.getString("sessionId")%>" >

    <input type="hidden" id="seq<%=seq%>" value="<%=rs.getInt("seq")%>" > </td>

    <td class="text-center"><%=rs.getString("productId")%></td>

    <td class="text-center"><%=rs.getInt("saleqty")%></td>

    <td class="text-center"><%=rs.getInt("unitprice")%></td>

    <td class="text-center"><%=unitprices%></td>

    <td class="text-center">

   <p><a href="./delivery.jsp?name=<%=rs.getString("sessionId")%>"

    	  class="btn btn-secondary" role="button">배송조회 &raquo;</a>
    	  </p>

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

<jsp:include page="footer.jsp"/>

</body>

</html>



<script>

function updateStatus(seq){

	var no=document.getElementById("seq"+seq).value;

	var status=document.getElementById("status"+seq).value;

	var p_id=document.getElementById("pid"+seq).value;

	alert('구매순번:'+seq+',상품코드:'+p_id+",상태:"+status);

	location.href

     ="updateSaleStatus.jsp?seq="+no+"&id="+p_id+"&status="+status;

}

</script>