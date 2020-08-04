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
#container2{position:relative; width: 600px; height: 100%;}
#container222{position:relative; left:100px;}
	#con2{position:relative;	width:600px; top:300px;}
	.input-group{ width: 300px;}
.content{position:relative;left: 100px;width: 400px;}
</style>
<script>

function Find_id() {
	let name =document.getElementById('name').value;
	let mail = document.getElementById('mail').value;
	let phone = document.getElementById('phone').value;
	window.open("./processFindId.jsp?name="+name+"&mail="+mail+"&phone="+phone,'','width=500,height=300');
}
</script>
<title>아이디 찾기(1)</title>
</head>
<body>
<div class="container" id="container2">
<div  id="con2" style="border:1px silver solid">

<h2 style="text-align:center">Find ID</h2>
				
<form action='' method="post">
<div class="content" id="con_input" >
	<div class="input-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
     	 <input id="name" type="text" class="form-control" name="name" placeholder="name" required autofocus="autofocus">
    </div>
 
    <div class="input-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
     	 <input id="mail" type="email" class="form-control" name="mail" placeholder="mail" required>
    </div>
   
    <div class="input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-lock" ></i></span>
     	 <input id="phone" type="text" class="form-control" name="phone" placeholder="phone" required>
    </div> 
    <br>
    <div class="container" id="container222" style="width: 500px;">
				<input type="button" class="btn btn-success btn-lg" id="btn_ok" value="확인" onclick='Find_id()'	/>
				<input type="button" class="btn btn-secondary btn-lg" id="btn_cancel" value="취소" onclick='location.href="../welcome.jsp"'/>
			</div>
</div>
</form>
	</div>
  </div>
  <jsp:include page="/footer.jsp"/>
</body>
</html>
