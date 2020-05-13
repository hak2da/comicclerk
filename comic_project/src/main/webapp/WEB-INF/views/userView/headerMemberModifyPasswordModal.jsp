<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal" id="headerMemberModifyPasswordModal">
			<div class="modal-dialog">
				<div class="modal-content" align="center">
					<!-- Modal Header -->
					<div class="modal-header">
						<h3 class="modal-title">회원 정보</h3>
					</div>
					<!-- Modal body -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">
								<font style="vertical-align: inherit;">회원 정보</font>
							</h4>
							<form>
							<div class="form-group">
								<label> <font style="vertical-align: inherit;">비밀번호 확인</font></label>
								<input type="password" name="MEMBER_PWD" id="headerMemberModifyPassword" class="form-control">
								<input type="hidden" id="headermemberhiddenid" value ="${Memberlogin.MEMBER_ID}">
							</div>
							<div class="form-group" align="center">
								<button type="button" id="headerMemberModifyPasswordBtn" name="headerMemberModifyPasswordBtn" class="btn btn-info" onclick="headerMemberModifyPasswordCheck(headermemberhiddenid.value,headerMemberModifyPassword.value);">확인</button>
								<button type="button" id="headerMemberModifyPasswordclose" class="btn btn-success">닫기</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>