<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <meta charset="UTF-8" />
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>회원 탈퇴</title>
  </head>
  <body>
    <%@include file="../menu.jsp"%>
    <script type="text/javascript">
      $().ready(function () {
        $('#deleteAgreement').change(function () {
          alert($('#checkValue').val());
          $('#checkValue').val(($('#checkValue').val() == 'true') ? 'false' : 'true');
        });

        $('#deleteBtn').click(function () {
          if ($('#checkValue').val() == 'true') {
          let yesNo = confirm('정말 탈퇴하시겠습니까?');
            if (yesNo) {
              location.href = 'processDeleteMember.jsp';
            }
          } else {
						alert('동의 후 진행');
					}
        });
      });
    </script>
    <div class="container">
      <div class="jumbotron">
        <h3 class="display-3">회원 탈퇴 신청</h3>
      </div>
      <div class="container col-12 alert alert-danger">
      <div class="form-group">
	      <label for="comment">Comment:</label>
	      <textarea class="form-control" rows="5" id="comment" name="text">
	      		Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum unde, aperiam tenetur nulla quas soluta optio beatae tempore ad numquam omnis hic deleniti totam ex ea, vitae deserunt. Quaerat, laudantium.
						Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere voluptates corrupti aspernatur qui quaerat? Rem ipsam, eum voluptas illo quidem explicabo adipisci consequuntur incidunt quas quam cupiditate ullam excepturi dolores!
						Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error facilis sapiente consequuntur ea tenetur consequatur hic repellendus ab, reiciendis necessitatibus veniam dicta dolorum ipsum dolores molestias rerum quibusdam officiis maxime.
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum unde, aperiam tenetur nulla quas soluta optio beatae tempore ad numquam omnis hic deleniti totam ex ea, vitae deserunt. Quaerat, laudantium.
						Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere voluptates corrupti aspernatur qui quaerat? Rem ipsam, eum voluptas illo quidem explicabo adipisci consequuntur incidunt quas quam cupiditate ullam excepturi dolores!
						Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error facilis sapiente consequuntur ea tenetur consequatur hic repellendus ab, reiciendis necessitatibus veniam dicta dolorum ipsum dolores molestias rerum quibusdam officiis maxime.
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum unde, aperiam tenetur nulla quas soluta optio beatae tempore ad numquam omnis hic deleniti totam ex ea, vitae deserunt. Quaerat, laudantium.
						Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere voluptates corrupti aspernatur qui quaerat? Rem ipsam, eum voluptas illo quidem explicabo adipisci consequuntur incidunt quas quam cupiditate ullam excepturi dolores!
						Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error facilis sapiente consequuntur ea tenetur consequatur hic repellendus ab, reiciendis necessitatibus veniam dicta dolorum ipsum dolores molestias rerum quibusdam officiis maxime.
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum unde, aperiam tenetur nulla quas soluta optio beatae tempore ad numquam omnis hic deleniti totam ex ea, vitae deserunt. Quaerat, laudantium.
						Lorem, ipsum dolor sit amet consectetur adipisicing elit. Facere voluptates corrupti aspernatur qui quaerat? Rem ipsam, eum voluptas illo quidem explicabo adipisci consequuntur incidunt quas quam cupiditate ullam excepturi dolores!
						Lorem ipsum dolor sit, amet consectetur adipisicing elit. Error facilis sapiente consequuntur ea tenetur consequatur hic repellendus ab, reiciendis necessitatibus veniam dicta dolorum ipsum dolores molestias rerum quibusdam officiis maxime.
				</textarea>
		   </div>
        <label><input type="checkbox" id="deleteAgreement" />모든 읽 확인 및 동의</label>
        <input type="hidden" value="false" id="checkValue" /> <br />
        <input
          type="button"
          class="btn btn-danger"
          id="deleteBtn"
          value="회원탈퇴"
        />
      </div>
    </div>
    <%@include file="../footer.jsp"%>
  </body>
</html>
