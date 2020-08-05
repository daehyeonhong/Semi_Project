<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<html>
<body>
	<input type='hidden' value='ㅁㅁ' id='myInput'>
	<a onclick='myFunction()'>ㅁㅁ</a>
	<script>
		function myFunction() {
			var copyText = document.getElementById('myInput');
			copyText.select();
			document.execCommand('copy');
			alert(copyText.value + '가 복사되었습니다');
		}
	</script>
</body>
</html>