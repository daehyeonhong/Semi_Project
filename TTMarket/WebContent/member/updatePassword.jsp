<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$('#password_Confirm').click(function(){
		$.ajax({
			type:'GET',//요청메소드 방식
			//기존 비밀번호 인증
			url:'pwdConfirmAjax.jsp?oldpwd='+$('#password').val(),//val('success');
			dataType:"text",//요청 결과 값의 타입
			success:function(data){//콜백함수
				alert(data);
				if($.trim(data)=="fail"){//이미 존재하면 fail값
					$('#comfirm_result').removeClass();//동적으로 class제거
					$('#comfirm_result').addClass("badge badge-danger")
					$('#comfirm_result').html('비밀번호 인증 불가.');
					$('#password').val('');
					$('#password').focus();
					$('#password').attr('readonly',false);
								
				}else{//사용가능하면 success값
					$('#comfirm_result').removeClass();//동적으로 class제거
					$('#comfirm_result').addClass("badge badge-success")
					$('#comfirm_result').html('비밀번호 인증 완료');
					$('#newpassword1').focus();
					$('#password').attr('readonly',true);//수정불가 처리  */
					$('#passwdcheck').val('true');
				}}
					});/* ajax */
				});/* password_Confirm */
				
//비밀번호 변경
$('#changePassword').click(function(){
	if($('#passwdcheck').val()=='false'){
			alert('비밀번호 인증을 하세요.');
			$('#password').focus();
			return;
		}
	if($('#newpassword1').val()!=$('#newpassword2').val()){
		alert('두개의 비밀번호가 일치하지 않습니다.');
		$('#newpassword1').focus();
	return;}
	$.ajax({
		type:'GET',//요청메소드 방식
		url:'pwdCheckAjax.jsp?pwd='+$('#newpassword1').val(),//val('success');
		dataType:"text",//요청 결과 값의 타입
		success:function(data){//콜백함수
			alert(data);
			if($.trim(data)=="fail"){//이미 존재하면 fail값
				$('#result').removeClass();//동적으로 class제거
				$('#result').addClass("badge badge-danger")
				$('#result').html('비밀번호 변경 불가.');
				$('#newpassword1').val('');
				$('#newpassword1').focus();
				$('#newpassword1').attr('readonly',false);
							
			}else{//사용가능하면 success값
				$('#result').removeClass();//동적으로 class제거
				$('#result').addClass("badge badge-success")
				$('#result').html('비밀번호 변경 완료');
				/* $('#password_confirm').focus(); */
				$('#newpassword1').attr('readonly',true);//수정불가 처리  */
				}}
				});/* ajax */
			});/* changePassword */
			

});

</script>

<title>Insert title here</title>
</head>
<body>
<div class="form-group row">
		<label class="col-sm-2">기존 비밀번호</label>
		<div class="col-sm-3">
			<input type="password" id="password" name="password" class="form-control"
				placeholder="password" />
			<label id="comfirm_result" class="badge badge-success"></label>	
			</div>
			<input type="hidden" id="passwdcheck" name="passwdcheck" value='false'>
			 <input type="button" class="btn btn-primary" value="비밀번호" id="password_Confirm"
				name="password_Confirm" />	
				
		
	</div>
	<div class="form-group row">
		<label class="col-sm-2">새 비밀번호</label>
		<div class="col-sm-3">
			<input type="password" id="newpassword1" name="password" class="form-control"
				placeholder="password" />
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">새 비밀번호 확인</label>
		<div class="col-sm-3">
			<input type="password" id="newpassword2" name="password_confirm" class="form-control"
				placeholder="password_confirm" />
				
		<label id="result" class="badge badge-success"></label>
			</div>
		<input type="button" class="btn btn-primary" value="비밀번호" id="changePassword"
				name="changePassword" />		
	</div>
	<button type="button" class="btn btn-info" onclick='location.href="../welcome.jsp"'>홈으로</button>
	
</body>
</html>