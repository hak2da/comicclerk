<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../includes/userHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코믹서기 고객센터</title>
</head>
<body>
<!-- partial -->
      <div class="main-panel">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card-body" style="margin-top:100px; margin-left:400px;">
	                  <h1 class="card-title">불만사항이나 건의 사항을 적어주세요</h1><br/>
	                  <form class="forms-sample" action="/userView/board/boardRegister" method="post" 
	                  onsubmit="return nullcheck();">
	                  		
	                  
	                  	<input type="hidden" name="board_id" value="${Memberlogin.MEMBER_ID}" >
	                  	
	                    <div class="form-group">
	                      <label for="board_title">제목</label>
	                      <input type="text" class="form-control" name="board_title" style="border: 1px solid #cdcdce; width: 1100px;" 
	                      		 maxlength="27" placeholder="제목을 입력해주세요">
	                    </div>

	                    <div class="form-group">
	                      <label for="board_content">내용</label>
	                      <textarea class="form-control" name="board_content" rows="10" cols="70" maxlength="660"
	                      			style="border: 1px solid #cdcdce; width: 1100px;" placeholder="내용을 입력해주세요" ></textarea>
	                    </div>
	                    <a href="/userView/board/boardList"><button type="button" class="btn btn-outline-secondary">목록 가기</button></a>
	                    <button type="submit" class="btn btn-primary mr-2" style="margin-left:900px;">제출</button>
	                  </form>
	                </div>
	              </div>
		   </div>
	     </div>
</body>
<script>
function nullcheck(){
	if($("input[name='board_title']").val()==""){
		alert("제목을 입력해주세요");
		return false;
	}
	if($("textarea[name='board_content']").val()==""){
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}


</script>
</html>