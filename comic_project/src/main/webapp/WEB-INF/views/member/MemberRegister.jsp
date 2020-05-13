<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Majestic Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/resources/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/resources/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="col-lg-4 mx-auto">
      <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="background-color: RGB(215,215,216,.7); margin-top: 50px;">
	    	
	    	<div class="brand-logo">
              <a href="javascript:home()" ><img src="/resources/images/comic_image.png" alt="" style="width: 200px; height: 100px;"/></a>
            </div>
            
            <form class="pt-3" id="register" onsubmit="return validate();" action="/member/MemberRegister" method="post" autocomplete="off">
              
              
              <div class="form-group">
              	<label>
					<font style="vertical-align: inherit;">아이디</font>
				</label>
                <input type="text" class="form-control form-control-lg"
                		id="MEMBER_ID" name="MEMBER_ID" placeholder="아이디"  oninput="checkId();" maxlength="10">
                <h5 id="idCheckMessage" style="color: red;"></h5>
              </div>
              
              <div class="form-group">
              	<label>
					<font style="vertical-align: inherit;">비밀번호</font>
				</label>
                <input type="password" class="form-control form-control-lg" 
                		id="MEMBER_PWD" name="MEMBER_PWD" placeholder="비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력해주세요." style='ime-mode:disabled' maxlength="12">
              </div>
              <div class="form-group">
             	<label>
					<font style="vertical-align: inherit;">비밀번호확인</font>
				</label>
                <input type="password" class="form-control form-control-lg" 
                		id="MEMBER_PWD_Check" name="MEMBER_PWD_Check" placeholder="비밀번호 확인" oninput="pwdCheck()" style='ime-mode:disabled' maxlength="12">
              </div>
              <h5 id="pwdCheckMessage" style="color: red;"></h5>
              <div class="form-group">
              	<label>
					<font style="vertical-align: inherit;">이름</font>
				</label>
                <input type="text" class="form-control form-control-lg" id="MEMBER_NAME" 
                		name="MEMBER_NAME" placeholder="이름" maxlength="10">
              </div>
              
              <div class="form-group">
              	<label>
					<font style="vertical-align: inherit;">이메일</font>
				</label>
                <input type="email" class="form-control form-control-lg" id="MEMBER_EMAIL"
                		name="MEMBER_EMAIL" placeholder="이메일" maxlength="50">
              </div>
              
              <div class="form-group">
              	<label>
					<font style="vertical-align: inherit;">핸드폰번호</font>
				</label>
              	<div>
                <input type="text" class="form-control form-control-lg" id="MEMBER_PHONE_NUMBER1"
                		name="MEMBER_PHONE_NUMBER1" style="display:inline;float:left; width: 30%" maxlength="3">
                <h3 style="display:inline;float:left; width: 5%; height: 3.5rem; margin: 15px 0px; text-align: center;">-</h3>
                <input type="text" class="form-control form-control-lg" id="MEMBER_PHONE_NUMBER2" 
                		name="MEMBER_PHONE_NUMBER2" style="display:inline;float:left; width: 30%" maxlength="4">
                <h3 style="display:inline;float:left; width: 5%; height: 3.5rem; margin: 15px 0px; text-align: center;">-</h3>
                <input type="text" class="form-control form-control-lg" id="MEMBER_PHONE_NUMBER3" 
                		name="MEMBER_PHONE_NUMBER3" style="display:inline;float:left; width: 30%" maxlength="4">
                </div>
                <input type="hidden" name="MEMBER_PHONE_NUMBER" id="MEMBER_PHONE_NUMBER4" value="">
              </div>
              
              <div class="mt-3">
                <button class="btn btn-block btn-warning btn-lg font-weight-medium auth-form-btn" id="memberregister"
                		style="color: white;" type="submit">회원가입</button>
              </div>
              
              <div class="text-center mt-4 font-weight-light">
                 <a href="/member/MemberLogin" class="text-primary">로그인하러가기</a>
              </div>
            
            </form>
          
      </div>
    <!-- content-wrapper ends -->
  </div>
  <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/resources/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/resources/js/off-canvas.js"></script>
  <script src="/resources/js/hoverable-collapse.js"></script>
  <script src="/resources/js/template.js"></script>
  <!-- endinject -->
  <!-- 멤버 js -->
  <script src="/resources/js/member.js?ver=10"></script>
  
  <script type="text/javascript">
  </script>
</body>

</html>
