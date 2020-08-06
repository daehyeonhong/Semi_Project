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
#container1{position:center; width: 600px; height: 100%;}
#container2{position:relative; left:30px;}
	#con{position:relative;	width:600px; top:300px;}
	.input-group{ width: 300px;}
.content{position:relative;left: 100px;width: 400px;}
</style>
<script>
$(document).ready(function(){
	$('#Find_password').click(function(){
	$.ajax({
		type:'GET',//요청메소드 방식
		url:'pwdFindAjax2.jsp?id='+$('#id').val()+'&name='+$('#name').val()+'&mail='+$('#mail').val(),
		dataType:"text",//요청 결과 값의 타입
		success:function(data){//콜백함수
			alert(data);
			if($.trim(data)=="fail"){//비밀번호 변경 실패시
				$('#result').removeClass();//동적으로 class제거
				$('#result').addClass("badge badge-danger")
				$('#result').html('비밀번호 변경 불가.');
				$('#id').val('');
				$('#name').val('');
				$('#mail').val('');
				$('#id').focus();
				$('#id').attr('readonly',false);
							
			}else{//인증 성공
				$('#result').removeClass();//동적으로 class제거
				$('#result').addClass("badge badge-success")
				$('#result').html('인증 완료');
				/* $('#password_confirm').focus(); */
				$('#id').attr('readonly',true);//수정불가 처리  */
				$('#name').attr('readonly',true);//수정불가 처리  */
				$('#mail').attr('readonly',true);//수정불가 처리  */
				$('#idChecked').val('true');
				}
			}
				});/* ajax */
	});
	
	$('#changePwd').click(function(){
		if($('#idChecked').val()=='false'){
			alert('인증이 필요합니다.');
		$('#id').focus();
		return;
		}
		let no=document.getElementById("id").value;
		alert(no);
	var r= confirm("비밀번호를 변경하시겠습니까?");
	if(r==true) {
		location.href="changePassword.jsp?id="+no;
		/* self.close(); */ 
		}
	else
		location.href="../welcome.jsp";
	});
	
	 
});
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
   
   
    <label id="result" class="badge badge-success"></label>
    </div> 

    <br>
    <div class="container" id="container2" style="width:400px;">

				<input type="button" class="btn btn-success btn-lg" value="인증" id='Find_password' required/>
				<input type="button" class="btn btn-secondary btn-lg" id="btn_cancel" value="취소" onclick='location.href="loginMember.jsp"'/>
				<input type="button" class="btn btn-danger btn-lg" value="비밀번호 변경" id='changePwd'/>
				<input type="hidden" id="idChecked" name="idChecked" value='false'>
			</div>
</div>
</form>
	</div>
  </div>
    <jsp:include page="/footer.jsp"/>
</body>
</html>