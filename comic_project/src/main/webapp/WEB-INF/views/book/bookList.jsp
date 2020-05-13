<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 재고</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">책 재고</p>
							<div class="table-responsive" style="overflow: hidden;">
								<button id="bookRegisterBtn" type="button" class="btn btn-warning" 
								style="margin-bottom: 10px; color:white;">책 등록</button>
								
								<table id="bookTable" class="table  table-striped">
									<thead>
										<tr>
											<th>책이름</th>
											<th>책위치</th>
											<th>책출판사</th>
											<th>책 저자</th>
											<th>책 소개</th>
											<th>책 분류</th>
											<th>마지막권</th>
											<th>연재상태</th>
											<th class="no-sort">수정/삭제</th>
										</tr>
									</thead>
								</table>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modalstyle2" class="modal-backdrop show"></div>
	
	<jsp:include page="bookRegisterModal.jsp" />
	<jsp:include page="bookGetModal.jsp" />
	<script src="/resources/js/bookTable.js?ver=38" ></script>
	<script src="/resources/js/bookRegister.js?ver=22" ></script>
	<script src="/resources/js/bookGet.js?ver=33" ></script>
</html>