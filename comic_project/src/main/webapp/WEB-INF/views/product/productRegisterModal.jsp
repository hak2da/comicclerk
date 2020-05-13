<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- The ProductRegister Modal -->
<div class="modal" id="productRegister">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">상품 등록</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form onsubmit="return productRegisterCheck();" class="forms-sample" action="/product/productRegister" method="post" autocomplete="off">
							<div class="form-group row">
								<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>상품 이름</h5></font>
								</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="product_name" id="product_name_register" required
										style="border:3px solid #dadfe4">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>상품 판매가</h5></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="product_price" id="product_price_register" required
									style="border:3px solid #dadfe4">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>상품 수량</h5></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="product_qty" id="product_qty_register" required
									style="border:3px solid #dadfe4">
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputPassword2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>상품 종류</h5></font>
								</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="product_category" id="product_category_register" required
									style="border:3px solid #dadfe4">
								</div>
							</div>
							<button type="submit" class="btn btn-warning">
								<font style="vertical-align: inherit; color:white;">등록</font>
							</button>
							<button onclick="productRegisterModalClose();" data-dismiss="modal" type="button" class="btn btn-secondary">닫기</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End ProductRegister Modal -->

<script type="text/javascript">

	$("#closeBtn").click(function() {
		$('#modalstyle').css('display','none');
	});

	function productRegisterCheck() {
		
		var product_name = $('#product_name_register').val();
		var nameCheck = 0;
		
		$.ajax({
			type : 'POST',
			data : {product_name : product_name},
			async: false,
			url : "/product/productNameCheck",
			dataType : "json",
			success : function(result) {

				nameCheck = result;

				return;
			}
		});
		
		if($.trim($("#product_name_register").val()) != $("#product_name_register").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#product_name_register").val("");
		      $("#product_name_register").focus();
		      return false;
		}
		if(nameCheck > 0) {
			alert("이미 있는 상품입니다.");
			 $("#product_name_register").val("");
		     $("#product_name_register").focus();
		     return false;
		}
		if($.trim($("#product_category_register").val()) != $("#product_category_register").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#product_category_register").val("");
		      $("#product_category_register").focus();
		      return false;
		}
		if($("#product_price_register").val() <= 0) {
			alert("판매가를 정해주세요");
			$("#product_price_register").val("");
		    $("#product_price_register").focus();
		    return false;
		}
		if($("#product_qty_register").val() <= 0) {
			alert("수량을 정해주세요");
			$("#product_qty_register").val("");
		    $("#product_qty_register").focus();
		    return false;
		}
		return true;
		
	}

	function productRegisterModalClose() {
		$("#productRegister").find('form')[0].reset();
	}
	
</script>