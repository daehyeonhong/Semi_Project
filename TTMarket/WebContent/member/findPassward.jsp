<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<style>
body{height: 1500px; /* width: 100px;  */margin: 0px; padding: 0px;}
#container1{position:relative; width: 600px; height: 100%;}
#container2{position:relative; left:100px;}
	#con{position:relative;	width:600px; top:300px;}
	.input-group{ width: 300px;}
.content{position:relative;left: 100px;width: 400px;}
</style>
<script>

function Find_password() {
	let id =document.getElementById('id').value;
	let name = document.getElementById('name').value;
	let mail = document.getElementById('mail').value;
	window.open("./processFindPassword.jsp?id="+id+"&name="+name+"&mail="+mail,'','width=500,height=300');
}
</script>
<title>비밀번호 찾기(1)</title>
</head>
<body>
<div class="container" id="container1">
<div id="con" style="border:1px silver solid">

<h2 style="text-align:center">Find Password</h2>
				
<form action='' method="post">
<div class="content" id="con_input" >
	<div class="input-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
     	 <input id="id" type="text" class="form-control" name="id" placeholder="id" required autofocus="autofocus" >
    </div>
 
    <div class="input-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
     	 <input id="name" type="text" class="form-control" name="name" placeholder="name" required>
    </div>
   
    <div class="input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-lock" ></i></span>
     	 <input id="mail" type="email" class="form-control" name="mail" placeholder="mail" required>
    </div> 
    <br>
    <div class="container" id="container2" style="width: 500px; ">
				<input type="button" class="btn btn-success btn-lg" id="btn_ok" value="확인" onclick='Find_password()'/>
				<input type="button" class="btn btn-secondary btn-lg" id="btn_cancel" value="취소" onclick='history.back()'/>
			</div>
</div>
</form>
	</div>
  </div>
    <jsp:include page="/footer.jsp"/>
</body>
</html>