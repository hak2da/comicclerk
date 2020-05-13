<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content" align="center">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">손실 추가</h3>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="card-body">
				<form class="forms-sample" action="/loss/lossRegister" method="post">
					<div class="form-group row">
						<label for="exampleInputEmail2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">손실/수익</font></font></label>
						<div class="col-sm-9">
							<select class="form-control" name="loss_category">
							  <option value="손실">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;손실</option>
							  <option value="수익">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수익</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">수량</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="loss_qty">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">요금</font></font></label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="loss_pay" id="loss_createpay" readonly="readonly">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">상품</font></font></label>
						<div class="col-sm-9">
							<select class="form-control" name="loss_product" id="loss_createproduct"></select>
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">날짜</font></font></label>
						<div class="col-sm-9">
							<input type="date" class="form-control" name="loss_date" id="currentDate">
						</div>
					</div>
					<button type="submit" class="btn btn-primary mr-2">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">등록</font></font>
					</button>
					<button type="button" data-dismiss="modal" id="createclose" class="btn btn-success">닫기</button>
				</form>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- End Modal -->