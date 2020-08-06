<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String id=request.getParameter("id"); %>

<!DOCTYPE html>
<html>
<head>
<style>
body{height: 1500px; /* width: 100px;  */margin: 0px; padding: 0px;}
#container1{position:center; width: 600px; height: 100%;}
#container2{position:absolute; position:center; left:200px;}
	#con{position:absolute;	width:600px; top:300px;}
	.input-group{ width: 300px;}
.content{position:relative;left: 100px;width: 400px;}
#password,#newpassword1,#newpassword2{size:"50";}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
//비밀번호 변경
$('#changePassword').click(function(){
if($('#newpassword1').val()!=$('#newpassword2').val()){
		alert('두개의 비밀번호가 일치하지 않습니다.');
		$('#newpassword1').focus();
	return;
	}
	$.ajax({
		type:'GET',//요청메소드 방식
		url:'pwdFindAjax.jsp?id='+$('#id').val()+'&pwd='+$('#newpassword1').val(),//val('success');
		dataType:"text",//요청 결과 값의 타입
		success:function(data){//콜백함수
			alert(data);
			if($.trim(data)=="fail"){//비밀번호 변경 실패시
				$('#result').removeClass();//동적으로 class제거
				$('#result').addClass("badge badge-danger")
				$('#result').html('비밀번호 변경 불가.');
				$('#newpassword1').val('');
				$('#newpassword1').focus();
				$('#newpassword1').attr('readonly',false);
							
			}else{//비밀번호 변경 성공
				$('#result').removeClass();//동적으로 class제거
				$('#result').addClass("badge badge-success")
				$('#result').html('비밀번호 변경 완료');
				/* $('#password_confirm').focus(); */
				$('#newpassword1').attr('readonly',true);//수정불가 처리  */
				}
			}
				});/* ajax */
			});/* changePassword */
});

</script>

<title>비밀번호 변경</title>
</head>
<body>
<div class="container" id="container1">
<div id="con" style="border:1px silver solid">
<h2 style="text-align:center"><%=id %> 고객의 Change Password</h2>
	<div class="form-group row">
		<label style="text-align:center" class="col-sm-3">새 비밀번호</label>
		<div class="col-sm-5">
			<input size="200" type="password" id="newpassword1" name="newpassword1" class="form-control"
				placeholder="new password" />
		</div>
	</div>
	
	<div class="form-group row">
		<label style="text-align:center" class="col-sm-3">새 비밀번호 확인</label>
		<div class="col-sm-5">
			<input type="password" id="newpassword2" name="password_confirm" class="form-control"
				placeholder="password_confirm" />
				
		<label id="result" class="badge badge-success"></label>
			</div>
			<input type="hidden" id="id" value="<%=id%>" />
		<input type="button" class="btn btn-primary" value="비밀번호 변경" id="changePassword"
				name="changePassword" />		
	</div>
	
	 	 <div class="container" id="container2" style="width: 500px; ">
	 	 
	<button type="button" class="btn btn-info" onclick='location.href="../welcome.jsp"'>홈으로</button>
	</div>
	</div>

</div>
</body>
</html>