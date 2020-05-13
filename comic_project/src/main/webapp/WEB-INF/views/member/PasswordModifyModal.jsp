<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- The Modal -->
<div class="modal" id="PasswordModifyModal">
	<div class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">비밀번호 찾기</h3>
			</div>

			<!-- Modal body -->
			<div class="card" >
				<div class="card-body" style="background-color: RGB(215,215,216,.5);">
					<h4 class="card-title">
						<font style="vertical-align: inherit;">회원 정보</font>
					</h4>
					<form class="forms-sample" name="passwordmodify" method="post" autocomplete="off" onsubmit="return validate();">
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">아이디</font>
							</label>
							<input name="MEMBER_ID" id="MEMBER_ID" class="form-control">
						</div>
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">이름</font>
							</label>
							<input name="MEMBER_NAME" id="MEMBER_NAME" class="form-control" maxlength="10">
						</div>
						<div class="form-group">
							<label>
								<font style="vertical-align: inherit;">이메일</font>
							</label>
							<input name="MEMBER_EMAIL" id="MEMBER_EMAIL" type="email" class="form-control" maxlength="50">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">
								<font style="vertical-align: inherit;">핸드폰 번호</font>
							</label>
							<input name="MEMBER_PHONE_NUMBER" id="MEMBER_PHONE_NUMBER" type="tel" class="form-control">
						</div>
						<div class="form-group" align="center">
							<button type="button" id="pmodify" name="pmodify" style="color:white;"
									class="btn btn-warning" onclick="pwdmodify();">확인</button>
							<button type="button" id="passwordmodifyclose" class="btn btn-primary">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Modal -->