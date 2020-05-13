<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
font {
	font-weight: 500;
	font-size: large;
}
</style>

<!-- The ProductOrderGet Modal -->
<div class="modal" id="billModal">
	<div class="modal-dialog">
		<div class="modal-content" align="center" style="border: 3px solid #cdcdce;">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">상세 요금</h3>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputUsername1"> <font
							style="vertical-align: inherit;">상품 요금</font>
						</label><br /> <input id="productBill" readonly="readonly"
							class="form-control" style="width: 300px; float: left;">
						<button id="productBillModalBtn" type="button"
							class="btn btn-warning btn-sm"
							style="float: right; height: 45px;">
							<font style="color: white;">주문 내역</font>
						</button>
					</div>
					<br /> <br />
					<div class="form-group">
						<label for="exampleInputUsername1"> <font
							style="vertical-align: inherit;">방 요금</font>
						</label> <input id="roomBill" readonly="readonly" class="form-control">
					</div>
					<div class="form-group">
						<label for="exampleInputUsername1"> <font
							style="vertical-align: inherit;">전체 요금</font>
						</label> <input id="totalBill" readonly="readonly" class="form-control">
					</div>
					<button id="billModalCloseBtn" type="button"
						class="btn btn-warning">
						<font style="color: white;">닫기</font>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- End ProductOrderGet Modal -->

<script type="text/javascript">
	$("#billModalCloseBtn").click(function() {
		$('#modalstyle').css('display','none');
		$("#billModal").hide();
	});
</script>