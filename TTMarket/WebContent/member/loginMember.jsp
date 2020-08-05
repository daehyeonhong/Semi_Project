<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<style>
  #home_icon {
	width: 70px;
	height: 60px;
	margin: 10px;
}
#adm{width: 70px;}
</style>
<script>
	$(document).ready(function(){
		$("#logo").on({
			mouseover: function(){$(this).css("cursor","pointer");},
			click: function(){location.href='../welcome.jsp';}
		});
	});
	$(document).ready(function(){
			 $('#home_icon').mouseover(function(){
						$(this).css("cursor","pointer");
			 });  
			$('#home_icon').click(function(){
					 location.href='../welcome.jsp';
			}); 
		});
</script>

<title>LoginPage</title>
</head>
<body>
<div class="jumbotron">
<img src="../resources/images/home_icon_sil.png" id="home_icon"/>

<div class="container" align="center" >
      <div class="navbar-brand" id="logo">
      <h1 class="display-2">TTMarket</h1>
      </div>
  </div>
</div>
<div class="container" align="center">
	<div class="col-md-4 col-md-offset-2">

<fieldset>
			<%
				String error = request.getParameter("error");
			if (error != null) {
				out.print("<div class='alert alert-danger'>");
				out.print("아이디와 비밀번호를 확인해 주세요");
				out.print("</div>");
			}
			%>
<legend align="left" style="border:1px silver">Log In</legend>
			<!-- <input type="text"  class="btn btn-outline-light text-dark btn-block" name="id" id="id" placeholder="ID"><br>
			<input type="password" class="btn btn-outline-light text-dark btn-block" name="password" id="password"  placeholder="Password"><br><br>
			 -->	
<form    action="processLoginMember.jsp" method="post">			
<div class="input-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
     	 <input id="id" type="text" class="form-control" name="id" placeholder="ID" required autofocus="autofocus">
    </div>
   
    <div class="input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-lock" ></i></span>
     	 <input id="password" type="password" class="form-control" name="password" placeholder="Password" required>
    </div> 
    <br>
         <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
 </form> 
	
<hr>
<div class="input-group">
	<div class=col-md>
		<button class="btn btn btn-sm btn-light btn-block " type="submit" 
		  						onclick= 'location.href="./findId.jsp"'>ID찾기</button>
		<button class="btn btn btn-sm btn-light btn-block " type="submit" 
								onclick= 'location.href="./findPassward.jsp"'>비밀번호 찾기</button>
		<button class="btn btn btn-sm btn-light btn-block " type="submit" 
								onclick= 'location.href="./agreement.jsp"'>회원가입</button>
		<table>
			<tr>
				<td width="100%"align="right" id="adm"><br><br>
					<a href="${pageContext.request.contextPath}/admin/loginAdmin.jsp" class="btn btn-primary">&laquo;관리자 로그인</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</fieldset>

</div>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>