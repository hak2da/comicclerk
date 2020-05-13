<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The ProductGet Modal -->
<div class="modal" id="productGet">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">상품 정보</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form onsubmit="return productModifyCheck();" class="forms-sample" action="/product/productModify" method="post" autocomplete="off">
							<div class="form-group">
								<label for="exampleInputUsername1">
									<font style="vertical-align: inherit;">상품 번호</font>
								</label>
								<input name="product_num" id="product_num_modify" readonly="readonly" class="form-control" value="">
							</div>
							<div class="form-group">
								<label for="exampleInputUsername1">
									<font style="vertical-align: inherit;">상품 이름</font>
								</label>
								<input name="product_name" id="product_name_modify" readonly="readonly" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">
									<font style="vertical-align: inherit;">상품 판매가</font>
								</label>
								<input name="product_price" id="product_price_modify" type="number" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">
									<font style="vertical-align: inherit;">상품 수량</font>
								</label>
								<input name="product_qty" id="product_qty_modify" type="number" class="form-control">
							</div>
							<div class="form-group">
								<label for="exampleInputConfirmPassword1">
									<font style="vertical-align: inherit;">상품 종류</font>
								</label>
								<input name="product_category" id="product_category_modify" type="text" class="form-control">
							</div>
							<button type="submit" class="btn btn-warning" style="color:white;">수정</button>
							<button id="modifyBtn" type="button" class="btn btn-secondary">닫기</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div id="abcde" class="modal-backdrop show"></div>
<!-- End ProductGet Modal -->

<script type="text/javascript">



	$("#modifyBtn").click(function() {
		$("#productGet").find('form')[0].reset();
		$("#productGet").hide();
		$('#modalstyle').css('display','none');
	});

	function productModifyCheck() {

		if($.trim($("#product_category_modify").val()) != $("#product_category_modify").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#product_category_modify").val("");
		      $("#product_category_modify").focus();
		      return false;
		}
		if($("#product_price_modify").val() <= 0) {
			alert("판매가를 정해주세요");
			$("#product_price_modify").val("");
		    $("#product_price_modify").focus();
		    return false;
		}
		if($("#product_qty_modify").val() <= 0) {
			alert("수량을 정해주세요");
			$("#product_qty_modify").val("");
		    $("#product_qty_modify").focus();
		    return false;
		}
		return true;
		
	}
	
</script>