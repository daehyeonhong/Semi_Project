<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
	<div class="container">
		<form action="processAddMember.jsp" name="newMember" id="newMember" class="form-horizontal" method="post" onsubmit="return checkForm()">

			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input name="id" id="id" class="form-control" placeholder="ID" required="required" />
					<div class="container">
						<div class="row">
							<table width="100%">
								<tr>
									<td align="left">
										<input type="button" value="중복확인" class="btn btn-secondary col-sm-4" id="dupCheck" />
										<input type="hidden" value="ID변경" id="updId" class="btn btn-warning col-sm-4" />
										<input type="hidden" id="idChecked" value="">
										<label id="result" class="badge badge-success"></label>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="password" id="password" class="form-control" placeholder="password" required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="password_confirm" id="password_confirm" class="form-control" placeholder="password_confirm" required="required" />
				</div>
				<div class="col-sm-3">
				<label id="checkPasswordResult"></label>
				</div>
				<input type="text" id="passwordConfirm" value="false" />
			</div>

			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control" placeholder="name" required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
				<div class="form-check-inline">
		      <label class="form-check-label" for="radio2">
		        <input type="radio" class="form-check-input" name="gender" value="남" checked="checked" />남
		      </label>
		    </div>
				<div class="form-check-inline">
		      <label class="form-check-label" for="radio2">
		        <input type="radio" class="form-check-input" name="gender" value="여" />여
		      </label>
		    </div>
				</div>
			</div>
				
				

			<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-4">
						<input class="form-control col-sm-3"
							style="display: inline-block;" name="birthyy" maxlength="4"
							placeholder="년(4자)" size="6" />
						<select class="form-control col-sm-3"
							style="display: inline-block;" name="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <input class="form-control col-sm-3"
							style="display: inline-block;" name="birthdd" maxlength="2"
							placeholder="일" size="4" />
					</div>
				</div>
				
			
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input name="phone" maxlength="20" class="form-control"
							placeholder="phone" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
				</div>
				<div class="input-group row mb-3 mt-3 col-sm-8">
					<input class="form-control col-sm-2" type="text" id="postcode"
						placeholder="우편번호" name="postcode" />
					<div class="input-group-append">
						<button class="btn btn-secondary" onclick="execDaumPostcode()"
							type="button">우편번호 찾기</button>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input name="address" id="address" class="form-control" placeholder="주소" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">상세주소</label>
					<div class="col-sm-10">
						<input id="detailAddress" name="detailAddress"
							class="form-control col-sm-3" placeholder="상세주소" />
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">참고</label>
					<div class="col-sm-10">
						<input id="extraAddress" name="extraAddress" class="form-control col-sm-3"
							placeholder="참고항목" />
					</div>
				</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-4">
					<input type="button" id="submitBtn" name="submitBtn" value="등록"	disabled="disabled" class="btn btn-primary" />
					<input type="reset" id="reset" value="취소" class="btn btn-warning" />
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$().ready(function(){
				    
			$('#submitBtn').click(function() {
				
				if ($('#passwordConfirm').val() == 'true') {
					let confirmSignIn = confirm("정말 가입하시겠습니까?");
					
						if (confirmSignIn){
							$('#newMember').submit();
						} else {
							alert('요청이 취소되었습니다.');
						}
				} else {
					alert('비밀번호 오류!');
					$("#password").val('');
					$("#password").focus();
					$("#password_confirm").val('');
				}
			});
			
			
			$("#password_confirm").change(function() {
				let password1 = $("#password").val();
				let password2 = $("#password_confirm").val();
				
				if ((password1 != '') && (password2 != '')) {
					
					if ((password1 == password2)){
						$("#passwordConfirm").val('true');
						$("p").toggle(1000, function(){
						      alert("The toggle() method is finished!");
						    });
						$("#checkPasswordResult").attr("class", "form-control badge badge-success");
						$("#checkPasswordResult").html('비밀번호 확인');
					} else {
						$("#passwordConfirm").val('false');
						$("#checkPasswordResult").attr('class', 'form-control badge badge-danger');
						$("#checkPasswordResult").html('비밀번호가 다릅니다.');
					}
				} else {
					$("#checkPasswordResult").attr('class', '');
					$("#checkPasswordResult").html('');
				}
			});
			
			$("#password").change(function() {
				let password1 = $("#password").val();
				let password2 = $("#password_confirm").val();
				
				if ((password2 != '') && (password1 != '')) {
					
					if (password1 == password2) {
						$("#passwordConfirm").val('true');
						$("#checkPasswordResult").attr("class", "form-control badge badge-success");
						$("#checkPasswordResult").html('비밀번호 확인');
					} else {
						$("#passwordConfirm").val('false');
						$("#checkPasswordResult").attr('class', 'form-control badge badge-danger');
						$("#checkPasswordResult").html('비밀번호가 다릅니다.');
					}
				} else {
					$("#checkPasswordResult").attr('class', '');
					$("#checkPasswordResult").html('');
				}
			});
			
			$("#updId").click(function() {
				$("#submitBtn").attr("disabled", "disabled");
				$("#id").removeAttr("readonly");
				$("#id").val('');
				$("#id").focus();
				$("#dupCheck").attr("type", "button");
				$("#updId").attr("type", "hidden");
				$("#result").html('');
				});
			
		$("#dupCheck").click(function() {
			
			if ($('#id').val().trim() != '') {
				$.ajax({
					type : 'GET',/* 요청 메소드 */
					url : 'idCheck.jsp?id='+ $('#id').val(),dataType : 'text',/* 요청한 결과 값의 타입 */
					success : function(data) { /* 콜백 함수 */
						
						if ($.trim(data) == "fail") {/* 이미 존재하면 fail */
								$("#result").attr("class","badge badge-warning");
								$('#result').html('이미 사용중인 ID입니다.');
								$("#id").val('');
								$("#id").focus();
							} else {/* 사용 가능하면 success */
								$("#result").attr("class","badge badge-success");
								$('#result').html('사용 가능한 ID입니다.');
								$("#id").attr("readonly",true);
								$("#dupCheck").attr("type","hidden");
								$("#updId").attr("type","button");
								$("#idChecked").val('true');
								$("#submitBtn").removeAttr("disabled");
								$("#password").focus();
								}
					}
				});
					} else {
						alert('아이디를 입력하세요!');
						$("#id").focus();
					}
			});
			
			$("#reset").click(function() {
				$("#checkPasswordResult").attr('class', '');
				$("#checkPasswordResult").html('');
				$("#id").removeAttr("readonly");
				$("#updId").attr("type", "hidden");
				$("#submitBtn").attr("disabled", "disabled");
				$("#dupCheck").attr("type", "button");
				$("#idChecked").val('false');
				$('#result').html('');
				$("#id").focus();
			});
		});
		
		function checkForm() {
			let checked = $('#idChecked').val();
			
			if(checked=='false'){
				alert('아이디 체크를 해주세요.');
				$('#id').focus();
				return false;
			} else if(checked=='true'){
				return true;
			}
		}

		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
			}).open();
		}
	</script>
</body>
</html>