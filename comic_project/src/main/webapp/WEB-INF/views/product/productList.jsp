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
			<div class="row" >
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">상품 재고</p>
							<div class="table-responsive" style="overflow: hidden;" >
								<button style="margin-bottom: 10px; color:white;" data-toggle="modal" data-target="#productRegister" type="button" 
								class="btn btn-warning" data-backdrop="static" data-keyboard="false">상품 등록</button>
								<button id="orderBtn" style="margin-bottom: 10px;" type="button" class="btn btn-primary">상품 발주</button>
									
								<table id="productTable" class="table  table-striped">
									<thead>
										<tr>
											<th style="width:100px;">상품 번호</th>
											<th>상품 이름</th>
											<th>상품 판매가</th>
											<th>상품 수량</th>
											<th>상품 종류</th>
											<th class="no-sort" style="width:100px;">수정/삭제</th>
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
	
	<jsp:include page="productRegisterModal.jsp" />
	<jsp:include page="productGetModal.jsp" />
	<script src="/resources/js/productTable.js?ver=7"></script>
</body>
</html>