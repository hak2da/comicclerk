<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- The ProductOrderRegister Modal -->
<div class="modal" id="productOrderRegister">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">발주 등록</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<form onsubmit="return productOrderRegistercheck();" class="forms-sample" action="/productOrder/productOrderRegister" method="post" autocomplete="off">
							<div class="form-group row">
								<label for="exampleInputUsername2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>상품 이름</h5></font>
								</label>
								<div class="col-sm-9">
									<select class="form-control" name="productOrder_product_name" id="productOrder_product_name">
										<option value="">선   택</option>
		                            	<c:forEach items="${productList}" var="productList">
		                            		<option value="${productList.product_name}">${productList.product_name}</option>
		                            	</c:forEach>
	                            	</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>발주 구매가</h5></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="productOrder_cost" id="productOrder_cost_register" 
									required style="border:3px solid #dadfe4;">
								</div>
							</div>
								<div class="form-group row">
								<label for="exampleInputEmail2" class="col-sm-3 col-form-label">
									<font style="vertical-align: inherit;"><h5>발주 수량</h5></font>
								</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" name="productOrder_qty" id="productOrder_qty_register" required
									 style="border:3px solid #dadfe4;">
								</div>
							</div>
							<button type="submit" class="btn btn-warning" style="color:white;">
								<font style="vertical-align: inherit;">등록</font>
							</button>
							<button onclick="productOrderRegisterModalClose();" data-dismiss="modal" type="button" class="btn btn-success">닫기</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End ProductOrderRegister Modal -->

<script type="text/javascript">

	function productOrderRegistercheck() {
		
		if($("#productOrder_product_name option:selected").val() == "") {
			alert("상품을 정해주세요");
		    $("#productOrder_product_name").focus();
		    return false;
		}
		if($("#productOrder_cost_register").val() <= 0) {
			alert("판매가를 정해주세요");
			$("#productOrder_cost_register").val("");
		    $("#productOrder_cost_register").focus();
		    return false;
		}
		if($("#productOrder_qty_register").val() <= 0) {
			alert("수량을 정해주세요");
			$("#productOrder_qty_register").val("");
		    $("#productOrder_qty_register").focus();
		    return false;
		}
		return true;
		
	}

	function productOrderRegisterModalClose() {
		$("#productOrderRegister").find('form')[0].reset();
	}
	
</script>