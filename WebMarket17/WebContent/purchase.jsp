<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="EUC-KR" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <script
      src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
      type="text/javascript"
    ></script>
  </head>
  <body>
    <%@include file="menu.jsp"%>
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-3">결제</h1>
      </div>
    </div>

    <div class="container col-8 alert alert-info">
      <div class="row justify-content-between">
        <div class="col-4" align="left">
          <label>하이요</label>
        </div>
	  </div>
	  <div>
		  <table class="table talbe-hov">
			  <th class="text-center">결제금액:</th>
			  <th class="text-center"></th>
			  <th class="text-center"></th>
			  <th class="text-center"></th>
		  </table>
	  </div>
    </div>
    <%@include file="footer.jsp"%>
  </body>
</html>
