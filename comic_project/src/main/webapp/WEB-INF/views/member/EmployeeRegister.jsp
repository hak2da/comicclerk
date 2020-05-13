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
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
             	<button type="button" id="AdminModal" class="btn btn-primary">직원 추가</button>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  
  
  
  <!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="ModalLabel">직원 추가</h4>
							</div>
							<div class="modal-body">
								<form class="pt-3" id="register" action="/member/EmployeeRegister" method="post">
										<div class="form-group">
											<label>이름</label> <input type="text"
												class="form-control form-control-lg" name="EMPLOYEE_NAME"
												placeholder="Name">
										</div>
										<div class="form-group">
											<label>비밀번호</label> <input type="text"
												class="form-control form-control-lg" name="EMPLOYEE_PWD"
												placeholder="Password">
										</div>
										<div class="form-group">
											<label>핸드폰 번호</label> <input type="email"
												class="form-control form-control-lg" name="EMPLOYEE_PHONE"
												placeholder="Phone">
										</div>
										<div class="form-group">
											<label>주소</label> <input type="text"
												class="form-control form-control-lg" name="EMPLOYEE_ACCOUNT"
												placeholder="Account">
										</div>
										<div class="form-group">
											<label>직책</label> <input type="text"
												class="form-control form-control-lg" name="EMPLOYEE_POSITION"
												placeholder="Position">
										</div>
										<div class="form-group">
											<label>시급/월급</label> <input type="text"
												class="form-control form-control-lg" name="EMPLOYEE_PAY"
												placeholder="Pay">
										</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="document.getElementById('register').submit()">추가</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/resources/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/resources/js/off-canvas.js"></script>
  <script src="/resources/js/hoverable-collapse.js"></script>
  <script src="/resources/js/template.js"></script>
  <!-- endinject -->
  
  <script type="text/javascript">
  $("#AdminModal").on("click", function() {
	  $("#myModal").modal("show");	
  });
  </script>
</body>

</html>
