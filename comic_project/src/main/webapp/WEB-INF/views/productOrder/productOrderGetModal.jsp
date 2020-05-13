<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The ProductOrderGet Modal -->
<div class="modal" id="productOrderGet">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">발주 정보</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form onsubmit="return productOrderModifyCheck();" class="forms-sample" action="/productOrder/productOrderModify" method="post" autocomplete="off">
							<div class="form-group">
								<label for="exampleInputUsername1">
									<font style="vertical-align: inherit;">발주 번호</font>
								</label>
								<input name="productOrder_num" id="productOrder_num" readonly="readonly" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">
									<font style="vertical-align: inherit;">상품 이름</font>
								</label>
								<input name="productOrder_product_name" id="productName" readonly="readonly" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">
									<font style="vertical-align: inherit;">발주 구매가</font>
								</label>
								<input name="productOrder_cost" id="productOrder_cost" type="number" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">
									<font style="vertical-align: inherit;">발주 수량</font>
								</label>
								<input name="productOrder_qty" id="productOrder_qty" type="number" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputConfirmPassword1">
									<font style="vertical-align: inherit;">발주 날짜</font>
								</label>
								<input id="product_date" readonly="readonly" class="form-control">
							</div>
							<button type="submit" class="btn btn-info">수정</button>
							<button id="productOrderGetBtn" type="button" class="btn btn-success">닫기</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End ProductOrderGet Modal -->

<script type="text/javascript">
	
	$("#productOrderGetBtn").click(function() {
		$("#productOrderGet").find('form')[0].reset();
		$("#productOrderGet").hide();
		$('#modalstyle').css('display','none');
	});

	function productOrderModifyCheck() {
		
		if($("#productOrder_cost").val() <= 0) {
			alert("판매가를 정해주세요");
			$("#productOrder_cost").val("");
		    $("#productOrder_cost").focus();
		    return false;
		}
		if($("#productOrder_qty").val() <= 0) {
			alert("수량을 정해주세요");
			$("#productOrder_qty").val("");
		    $("#productOrder_qty").focus();
		    return false;
		}
		return true;
		
	}
	
</script>