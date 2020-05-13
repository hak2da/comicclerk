<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/inhostyle.css?after">
<meta charset="UTF-8">
<title>재고 정산</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-12 stretch-card">
					<div class="card">
						<div class="card-body">
							<p class="card-title">재고 확인</p>
							<div class="table-responsive">
								<table id="recent-purchases-listing"
									class="table table-striped">
									<thead>
										<tr>
											<th>상품번호</th>
											<th>종류</th>
											<th>상품명</th>
											<th>재고수량</th>
											<th>실제수량</th>
											<th class="sorting">오차수량</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${settleList}" var="settle" varStatus="status" >
											<tr>
												<td>${settle.product_num }</td>
												<td>${settle.product_category }</td>
												<td>${settle.product_name }</td>
												<td><input type="hidden" value="${settle.product_qty }" id="product_qty${status.count-1}">${settle.product_qty }</td>
												<td><input type="number" class="currentqty" name="curqty"
													id="ainput${status.count-1}" size="10"></td>
												<td id="a${status.count-1}"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table><br/>
								<div align="right">
									<button id="btn1" class="btn btn-danger">오차확인</button>
									<button id="btn2" class="btn btn-primary">재고정산</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modalstyle" class="modal-backdrop show"></div>
	<jsp:include page="settlementModal.jsp" />	
</body>

<script src="/resources/js/inhosettlement.js?ver=1"></script>
<script>
	//오차수량 sorting

	$(document).ready(function() {
		 var reSortColors = function($table) {
		     $('tbody tr:odd', $table)
		       .removeClass('even').addClass('odd');
		     $('tbody tr:even', $table)
		       .removeClass('odd').addClass('even');
		   };
		  $('table').each(function() {
		    var $table = $(this);
		    reSortColors($table);
		    $('th', $table).each(function(column) {
		      var $header = $(this);
		      if ($header.is('.sorting')) {
		          //header에서 sorting이란 클래스가있다면
		    	  $header.addClass('clickable').hover(function() {
		              $header.addClass('hover');
		            }, function() {
		              $header.removeClass('hover');
		            }).click(function() {
		   			
		   			var sortDirection = 1;
		              if ($header.is('.sorted-asc')) {
		                sortDirection = -1;
		              }
		   			//변수 삽입 
		              var rows = $table.find('tbody > tr').get();
		              rows.sort(function(a, b) {
		                var keyA = $(a).children('td').eq(column).text()
		                  .toUpperCase();
		                var keyB = $(b).children('td').eq(column).text()
		                  .toUpperCase();
		                if (keyA < keyB) return -sortDirection;
		                if (keyA > keyB) return sortDirection;
		                return 0;
		              });
		              $.each(rows, function(index, row) {
		                $table.children('tbody').append(row);
		              });
		   		
		   		$table.find('th').removeClass('sorted-asc')
		                .removeClass('sorted-desc');
		              if (sortDirection == 1) {
		                $header.addClass('sorted-asc');
		              }
		              else {
		                $header.addClass('sorted-desc');
		              }
		              reSortColors($table);
		            });
		          }
		        });
		      });
		    });
</script>
</html>