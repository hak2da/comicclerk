<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- The ProductOrderGet Modal -->
<div class="modal" id="orderArlet">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal body -->
				<div class="card" id="product-bill-card">
					<div class="card-body" id="product-bill-card-body" >
							<h3>주문이 준비되었습니다. 카운터로 오시면 됩니다.</h3><br/>
							
							<button id="orderArletClose" type="button" class="btn btn-warning"><font style="color:white;">닫기</font></button>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End ProductOrderGet Modal -->

<script type="text/javascript">
	
	$("#orderArletClose").click(function() {
		$("#orderArlet").hide();
	});
	
</script>