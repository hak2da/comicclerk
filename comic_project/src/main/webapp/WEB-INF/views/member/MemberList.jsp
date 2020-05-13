<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/style.css">
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">회원 관리</p>
							<div class="table-responsive" style="overflow: hidden;">
								<table id="memberListTable" class="table  table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>이메일</th>
											<th>핸드폰번호</th>
											<th class="no-sort">수정</th>
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
	<jsp:include page="MemberModifyModal.jsp" />
	<script src="/resources/js/memberlist.js?ver=2"></script>
</body>
</html>