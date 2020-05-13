<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- The Modal -->
<div class="modal" id="MemberModifyModal">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">회원 관리</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">
						<font style="vertical-align: inherit;">회원 수정</font>
					</h4>
					<form class="forms-sample" action="/member/MemberModify" method="post" autocomplete="off" onsubmit="return validate();">
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">아이디</font>
							</label>
							<input name="MEMBER_ID" id="MEMBER_ID_modify" readonly="readonly" class="form-control">
						</div>
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">이름</font>
							</label>
							<input name="MEMBER_NAME" id="MEMBER_NAME_modify" readonly="readonly" class="form-control">
						</div>
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">이메일</font>
							</label>
							<input name="MEMBER_EMAIL" id="MEMBER_EMAIL_modify" type="email" class="form-control" maxlength="50"
							style="border:3px solid #dadfe4">
						</div>
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">핸드폰 번호</font>
							</label>
							<input name="MEMBER_PHONE_NUMBER" id="MEMBER_PHONE_NUMBER_modify" type="tel" class="form-control"
							style="border:3px solid #dadfe4">
						</div>
						<div class="form-group" align="center">
							<button type="submit" class="btn btn-warning" style="color:white;">수정</button>
							<button type="button" id="modifyclose_modify" class="btn btn-secondary">닫기</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<!-- End Modal -->