<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<script>
function idcheck(){//과제
	var id=document.getElementById("id").value;
	alert('아이디:'+id);
	if(id==''){
		alert('아이디를 입력하세요');
		document.getElementById("id").focus();
		return;
	}
	window.open("idcheck.jsp?id="+id,"_blank"
,"toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=500,height=400");
}
</script>
<title>회원가입</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<div class="jumbtron">
  <div class="container">
     <h1 class="display-3">회원 가입</h1>
  </div>
</div>
<div class="container">
<form name="newMember" class="form-horizontal" 
      action="processAddMember.jsp" method="post" 
      onsubmit="return checkForm()">
	<div class="form-group row">
	    <label class="col-sm-2">아이디</label>
	    <div class="col-sm-3">
	    	<input name="id" id="id" class="form-control" placeholder="id">
	    	<input type="button" value="중복확인" class="btn btn-primary" onclick="idcheck()">
	    </div>
	</div>
	<div class="form-group row">
	    <label class="col-sm-2">비밀번호</label>
	    <div class="col-sm-3">
	    	<input type="password" name="password" id="password" class="form-control" placeholder="password">
	    </div>
	</div>
	<div class="form-group row">
	    <label class="col-sm-2">비밀번호확인</label>
	    <div class="col-sm-3">
	    	<input type="password" name="password_confirm" class="form-control" placeholder="password_confirm">
	    </div>
	</div>
	<div class="form-group row">
	    <label class="col-sm-2">성명</label>
	    <div class="col-sm-3">
	    	<input name="name" class="form-control" placeholder="name">
	    </div>
	</div>

	<div class="form-group row">
	    <label class="col-sm-2">성별</label>
	    <div class="col-sm-10">
	    	<input name="gender" type="radio" value="남" checked="checked">남
	    	<input name="gender" type="radio" value="여">여
	    </div>
	</div>
	
	<div class="form-group row">
	    <label class="col-sm-2">생일</label>
	    <div class="col-sm-4">
	    	<input name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
	    	<select name="birthmm">
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
	    	</select>
	    	<input name="birthdd" maxlength="2" placeholder="일" size="4">
	    </div>
	</div>
	
	<div class="form-group row">
	    <label class="col-sm-2">이메일</label>
	    <div class="col-sm-10">
	    	<input name="mail1" maxlength="50">@
	    	<select name="mail2">
	    	 <option value="naver.com">naver.com</option>
	    	 <option value="daum.net">daum.net</option>
	    	 <option value="gmail.com">gmail.com</option>
	    	</select>
	    </div>
	</div>
	<div class="form-group row">
	    <label class="col-sm-2">전화번호</label>
	    <div class="col-sm-10">
	    	<input name="phone" maxlength="20" class="form-control" placeholder="phone">
	    </div>
	</div>
	<div class="form-group row">
	    <label class="col-sm-2">우편번호</label>
	    <div class="col-sm-10">
	    	<input type="text" id="postcode" placeholder="우편번호" name="postcode">
             <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	    </div>
	</div>
	
	<div class="form-group row">
	    <label class="col-sm-2">주소</label>
	    <div class="col-sm-10">
	    	<input name="address" id="address" class="form-control" placeholder="address">
	    </div>
	</div>
	
	
	<div class="form-group row">
	    <label class="col-sm-2">상세주소</label>
	    <div class="col-sm-10">
	    	<input id="detailAddress" name="detailAddress" class="form-control" placeholder="상세주소">
	    </div>
	</div>
	
	<div class="form-group row">
	    <label class="col-sm-2">참고</label>
	    <div class="col-sm-10">
	    	<input id="extraAddress" name="extraAddress" class="form-control" placeholder="참고항목">
	    </div>
	</div>
	
	<div class="form-group row">
	    <div class="col-sm-offset-2 col-sm-10">
	      <input type="submit" value="등록" class="btn btn-primary">
	      <input type="reset" value="취소" class="btn btn-primary">
	    </div>
	</div>
</form>
</div>
<jsp:include page="/footer.jsp"/>
</body>
</html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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