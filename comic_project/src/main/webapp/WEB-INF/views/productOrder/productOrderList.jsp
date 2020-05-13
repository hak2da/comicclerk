<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/style.css">
<meta charset="UTF-8">
<title>상품 재고</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">상품 발주</p>
							<div class="table-responsive" style="overflow: hidden;">
								<button style="margin-bottom: 10px; color:white;" data-toggle="modal" data-target="#productOrderRegister" type="button"
										class="btn btn-warning" data-backdrop="static" data-keyboard="false"
										>발주 등록</button>
										
								<table id="productOrderTable" class="table  table-striped" >
									<thead>
										<tr>
											<th style="width: 100px;">발주 번호</th>
											<th>상품 이름</th>
											<th>발주 구매가</th>
											<th>발주 수량</th>
											<th>발주 날짜</th>
											<th class="no-sort" style="width: 150px;">수정/삭제</th>
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
	<div id="modalstyle" class="modal-backdrop show"></div>
	
	<jsp:include page="productOrderRegisterModal.jsp" />
	<jsp:include page="productOrderGetModal.jsp" />
	<script src="/resources/js/productOrderTable.js?ver=1"></script>
</body>
</html>