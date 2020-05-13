<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Majestic Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/resources/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/resources/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/resources/images/favicon.png" />
</head>
<body>

	<div class="main-panel">
		<div class="content-wrapper" style="background-color: #d7d7d8;">
			<div class="row" >
				<div class="col-md-12" > 
					<div class="content-wrapper d-flex align-items-center auth px-0" style="background-color: #d7d7d8;">
						
							<div class="col-lg-4 mx-auto" >
								<div class="auth-form-light text-left py-5 px-4 px-sm-5" >
									<div class="brand-logo">
										<img src="/resources/images/comic_icon.png" width="280px"
											height="100px" alt="logo"
											onclick="javascript:location.href='/managerpos/managerpos'">
									</div>
									<h4>직원 로그인</h4>
									<form class="pt-3" action="/managerpos/workonoff"
										id="workonoff" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-lg"  style="border:1px solid #d7d7d8;"
												id="exampleInputEmail1" name="employeenum"
												placeholder="사원번호" required>
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-lg" style="border:1px solid #d7d7d8;"
												id="exampleInputPassword1" name="employeepwd"
												placeholder="비밀번호" required>
										</div>
										<div class="mt-3">
											<!-- <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										href="/index">사인 히어</a> -->

											<button type="button"
												class="btn btn-block btn-warning btn-lg" style="color:white;"
												onclick="document.getElementById('workonoff').submit()">로그인</button>
										</div>
										<!-- <div
											class="my-2 d-flex justify-content-between align-items-center">

											<a href="#" onclick="forgotpwd()"
												class="auth-link text-black">Forgot password?</a>
										</div> -->

									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- content-wrapper ends -->
				</div>
				<!-- <div class="col-md-0"> -->
			</div>
		</div>



	<!-- main-panel ends -->

	<script src="/resources/vendors/base/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="/resources/js/off-canvas.js"></script>
	<script src="/resources/js/hoverable-collapse.js"></script>
	<script src="/resources/js/template.js"></script>
	<!-- endinject -->
	<script>
		/* var test = "${sessionScope.EMPID}";
		alert("현재 세션은"+test); */

		//var test  = location.pathname;//프로젝트 뒤의 값을 가져온다 //project:"managerpos/login"
		//alert('${request.getRequestURI()}');
		//alert(test);
		function forgotpwd() {
			alert("ㅋㅋ답이없네");
		}

		var tmp = '${errormsg}';
		console.log(tmp);
		if (tmp != "") {
			alert(tmp);
		}

		var succecssmsg = '${succecssmsg}';
		console.log(succecssmsg);
		if(succecssmsg!=""){
			alert(succecssmsg+'${sessionScope.EMPID}');
			}
		
		function Request() {
			var requestParam = "";

			//getParameter 펑션
			this.getParameter = function(param) {
				//현재 주소를 decoding
				var url = unescape(location.href);
				//파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
				var paramArr = (url.substring(url.indexOf("?") + 1, url.length))
						.split("&");

				for (var i = 0; i < paramArr.length; i++) {
					var temp = paramArr[i].split("="); //파라미터 변수명을 담음

					if (temp[0].toUpperCase() == param.toUpperCase()) {
						// 변수명과 일치할 경우 데이터 삽입
						requestParam = paramArr[i].split("=")[1];
						break;
					}
				}
				return requestParam;
			}
		}
		// Request 객체 생성
		/*  var request = new Request();
		 // test 라는 파라메터 값을 얻기
		var tmp =  request.getParameter("managerList"); */
	</script>


</body>
</html>