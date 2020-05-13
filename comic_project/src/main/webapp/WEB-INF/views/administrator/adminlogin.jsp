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
			<div class="row">
				<div class="col-md-12">
					<div class="content-wrapper d-flex align-items-center auth px-0"
						style="background-color: #d7d7d8;">

						<div class="col-lg-4 mx-auto">
							<div class="auth-form-light text-left py-5 px-4 px-sm-5">
								<div class="brand-logo">
									<img src="/resources/images/comic_icon.png" width="280px"
										height="100px" alt="logo"
										onclick="javascript:location.href='/managerpos/managerpos'">
								</div>
								<h4>관리자 로그인</h4>
								<form class="pt-3" action="/administrator/workonoff"
									id="workonoff" method="post">
									<div class="form-group">
										<input type="text" class="form-control form-control-lg"
											style="border: 1px solid #d7d7d8;" id="Inputempnum"
											name="Inputempnum" placeholder="사원번호" required>
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-lg"
											style="border: 1px solid #d7d7d8;" id="Inputemppwd"
											name="Inputemppwd" placeholder="비밀번호" required>
									</div>
									<div class="mt-3">
										<!-- <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
										href="/index">사인 히어</a> -->

										<button type="button" class="btn btn-warning btn-block"
											style="color: white;" onclick="adminloginout('login')">관리자
											로그인</button>
										<button type="button" class="btn btn-warning btn-block"
											style="color: white;"
											onclick="javascript:adminloginout('logout')">관리자
											로그아웃</button>

									</div>


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
	<script type="text/javascript">
		function adminloginout(loginout) {
			var empnum = document.getElementById("Inputempnum").value;
			var emppwd = document.getElementById("Inputemppwd").value;
			
			var list = [ empnum, emppwd, loginout ];
			var sendData = {
				'list' : list
			}

			if (loginout == 'login') {
				$.ajax({
					url : '/administrator/loginout',
					dataType : 'json',
					data : JSON.stringify(sendData),
					contentType : "application/json; charset=utf-8;",
					type : 'POST',
					success : function(data) {
						var successdata = data['successmsg'];
						console.log("ajaxtoadminloginout() 성공 가져온데이터\n<br> = "
								+ successdata);

						//alert("ajaxtoadminloginout() 성공 가져온데이터\n = "+successdata);
						if (successdata == '로그인성공') {
							alert("관리자 로그인 성공");
							//sessionStorage.setItem("emppos","사장");
							
							location.href="/managerpos/managerpos";
						} else if (successdata == '로그인실패') {
							alert("관리자 로그인 실패");
						} else {
							alert("wtf!");
						}

						
						//alert("가져온 세션데이터 : "+sessionStorage.getItem("emppos"));
					},
					error : function(data) {
						console.log("실패");
					}
				});
			} else {

				//로그아웃 세션지워주기
				$.ajax({
					url : '/administrator/loginout',
					dataType : 'json',
					data : JSON.stringify(sendData),
					contentType : "application/json; charset=utf-8;",
					type : 'POST',
					success : function(data) {
						var successdata = data['successmsg'];
						console.log("ajaxtoadminloginout() 성공 가져온데이터\n<br> = "
								+ successdata);
						location.href="/managerpos/managerpos";
						alert("세션지워짐");

					},
					error : function(data) {
						console.log("실패");
					}
				});
			}
		}
	</script>


</body>
</html>