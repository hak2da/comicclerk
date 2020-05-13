<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손실</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">재고 손실</p>
							<div class="table-responsive">
								<button name="createBtn" style="margin-bottom: 10px; color:white" 
								        type="button" class="btn btn-warning">손실 추가</button>
								<table id="lossTable" class="table table-striped">
									<thead>
										<tr>
											<th>번호</th>	
											<th>손실/수익</th>
											<th>수량</th>
											<th>요금</th>
											<th>상품</th>
											<th>날짜</th>
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
	<div id="modalstyle" class="modal-backdrop show"></div>
<jsp:include page="createModal.jsp" />	
<jsp:include page="modifyModal.jsp" />
<script src="/resources/js/inholoss.js?ver=2"></script>
</body>
</html>