<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script type="text/javascript">
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
</head>
<body>
<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card" style="margin-bottom: 20px;">
						<div class="card-body">
							<p class="card-title">월 순이익 확인</p>
							<div class="table-responsive">
								<table id="salesMonthTable" class="table table-striped">
									<thead>
										<tr>
											<th>날짜</th>
											<th>상품 총매출</th>
											<th>방 총매출</th>
											<th>손실/수익</th>
											<th>순 이익</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card" style="margin-bottom: 20px;">
						<div class="card-body">
							<p class="card-title">일 순이익 확인</p>
							<div class="table-responsive">
								<table id="salesTable" class="table table-striped">
									<thead>
										<tr>
											<th>날짜</th>
											<th>상품 총매출</th>
											<th>방 총매출</th>
											<th>손실/수익</th>
											<th>순 이익</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card" style="margin-bottom: 20px;">
						<div class="card-body">
							<p class="card-title">매출 확인</p>
							<div class="form-inline" style="float: right; margin-bottom: 20px;">
								<select name="type" class="form-control">
					     			<option selected value="all">전체</option>
									<option value="roomsales_id">ID별 검색</option>
									<option value="date">날짜별 검색</option>
									<option value="roomsales_num">방 번호별 검색</option>
								 </select>
								 
								 	<input type="text" name="keyword" class="form-control" id="datepicker" >&nbsp;
								 	<span id = "inputSpan"></span> <!-- datepicker시 input 추가 -->
					    		 <button type="submit" id="salesSearchBtn" class="btn btn-primary btn-md">검색</button>
							 </div>
							<div class="table-responsive">
								<table id="salesSearchTable" class="table table-striped">
									<thead>
										<tr>
											<th>날짜</th>
											<th>ID</th>
											<th>방 번호</th>
											<th>방 매출</th>
											<th>상품 매출</th>
										 	<th>매출 합계</th>
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
</body>
<script src="/resources/js/inhosales.js"></script>
<script>
	$(document).ready(function() {
		salesMonthTableinit();
		salesTableinit();
		salesSearchTableinit();
	});
</script>
</html>