<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- The BookGet Modal -->
<div class="modal" id="bookGet">
	<div id="modal-dialog-get" class="modal-dialog">
		<div class="modal-content" align="center">

			<!-- Modal Header -->
			<div class="modal-header">
				<h3 class="modal-title">책 정보</h3>
			</div>

			<!-- Modal body -->
			<div class="card">
				<div id="card-body-get" class="card-body" align="center">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">
							<font style="vertical-align: inherit;">책 이미지</font>
						</label>
						<div class="form-group row">
					        <div class="form-group uploadDiv">
					            <input id="uploadFileGet" type="file" name='uploadFile'>
					        </div>
				        
					        <div class='uploadResultGet'> 
					        	<ul>
					          
					        	</ul>
					        </div>
				    	</div>
					</div>
					<form id="getForm" class="forms-sample" action="/book/bookModify" role="form" method="post" autocomplete="off">
						<input type="hidden" name="book_name" id="book_name_hidden">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 이름</font>
							</label>
							<div class="col-sm-9">
								<input id="book_name_get" type="text" class="form-control" name="book_name_change">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책위치</font>
							</label>
							<div class="col-sm-9">
								<input id="book_loc_get" type="text" class="form-control" name="book_loc" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책출판사</font>
							</label>
							<div class="col-sm-9">
								<input id="book_publisher_get" type="text" class="form-control" name="book_publisher" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 저자</font>
							</label>
							<div class="col-sm-9">
								<input id="book_writer_get" type="text" class="form-control" name="book_writer" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 소개</font>
							</label>
							<div class="col-sm-9">
								<textarea id="book_content_get" name="book_content" class="form-control" rows="20"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">책 분류</font>
							</label>
							<div class="col-sm-9">
								<input id="book_category_get" type="text" class="form-control" name="book_category" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">마지막권</font>
							</label>
							<div class="col-sm-9">
								<input id="book_lastbook_get" type="number" class="form-control" name="book_lastbook" required>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">
								<font style="vertical-align: inherit;">연재상태</font>
							</label>
							<div class="col-sm-9">
								<select id="book_status_get" class="form-control" name="book_status">

	                            </select>
							</div>
						</div>
						<button id="getSubmitBtn" type="button" class="btn btn-warning">
							<font style="vertical-align: inherit; color:white;">수정</font>
						</button>
						<button id="bookGetBtn" type="button" class="btn btn-secondary">닫기</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- End BookGet Modal -->

<style>
.uploadResultGet {
	width: 100%;
	/* background-color: gray; */
}

.uploadResultGet ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResultGet ul li {
	list-style: none;
	/* padding: 10px; */
}

.uploadResultGet ul li img {
	/* width: 100px; */
	width: 170px;
	height: 220px;
}

#imageGetBtn{
	float: right;
}

#modal-dialog-get{
    overflow-y: initial !important
}
#card-body-get{
    height: 760px;
    overflow-y: auto;
}
</style>
</html>