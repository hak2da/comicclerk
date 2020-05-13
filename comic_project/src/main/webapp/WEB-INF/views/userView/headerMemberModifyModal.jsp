<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal" id="headerMemberModifyModal">
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
							<form class="forms-sample" name="headermembermodify" method="post" autocomplete="off" action="/member/MemberModify2" onsubmit="return javascript:headervalidate();">
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">아이디</font>
									</label> <input name="MEMBER_ID" id="HeaderMEMBER_ID" readonly="readonly"
										class="form-control" value="${Memberlogin.MEMBER_ID}"/>
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">이름</font>
									</label> <input name="MEMBER_NAME" id="HeaderMEMBER_NAME" readonly="readonly"
										class="form-control" value="${Memberlogin.MEMBER_NAME}">
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">비밀번호</font>
									</label> <input name="MEMBER_PWD" id="HeaderMEMBER_PWD" type="password"
										class="form-control" style='ime-mode:disabled' maxlength="12">
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">이메일</font>
									</label> <input name="MEMBER_EMAIL" id="HeaderMEMBER_EMAIL" type="email"
										class="form-control" value="${Memberlogin.MEMBER_EMAIL}" maxlength="50">
								</div>
								<div class="form-group">
									<label> <font style="vertical-align: inherit;">핸드폰
											번호</font>
									</label> <input name="MEMBER_PHONE_NUMBER" id="HeaderMEMBER_PHONE_NUMBER"
										type="tel" class="form-control" value="${Memberlogin.MEMBER_PHONE_NUMBER}">
								</div>
								<div class="form-group" align="center">
									<button type="submit" id="headermodifyBtn" name="headermodifyBtn" class="btn btn-info">수정</button>
									<button type="button" id="headermodifyclose" class="btn btn-success">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>