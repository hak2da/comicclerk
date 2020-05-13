<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- The Modal -->

	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content" align="center">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h3 class="modal-title">재고 변경</h3>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="card-body">
					<div class="form-group row">
						<div class="col-sm-9" style="margin-left: 50px;">
							<table class="table" style="border: 1px solid #d7d7d8;">
								<c:forEach items="${settleList}" var="settle" varStatus="status">
									<tr style="border: 1px solid #d7d7d8;">
										<th style="border: 1px solid #d7d7d8;"><input type="hidden" value="${settle.product_num }"
											name="productNum"> ${settle.product_name }</th>
										<td style="border-top: 1px solid #d7d7d8;">${settle.product_qty }</td>
										<td style="border-top: 1px solid #d7d7d8;"> &nbsp;&nbsp; -> </td>
										<td id="b${status.count-1}" style="border-top: 1px solid #d7d7d8;"></td>
									</tr>	
							   </c:forEach>
							</table>
						</div>
					</div>
					<button type="submit" class="btn btn-warning" style="color:white;" onclick="javascript:modify_product()">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">변경</font></font>
					</button>
					<button type="button" data-dismiss="modal" id="modalclose" class="btn btn-secondary">닫기</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- End Modal -->