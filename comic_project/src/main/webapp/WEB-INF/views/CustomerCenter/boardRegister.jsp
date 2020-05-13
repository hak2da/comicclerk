<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코믹서기 고객센터</title>
</head>
<body>
<!-- partial -->
	
	
	<div class="main-panel">        
	  <div class="content-wrapper">
	    <div class="row">
	   		<div class="col-12 grid-margin stretch-card">
	              <div class="card">
	                 <div class="card-body" style="margin-top:100px; margin-left:200px;">
		                  <h1 class="card-title"> 건의사항 게시판입니다</h1>
		                  <form class="forms-sample" action="/CustomerCenter/boardRegister" method="post"
		                   onsubmit="return nullcheck();"> 
		                  
		                  	<input type="hidden" name="board_id" value="관리자" >
		                  	
		                    <div class="form-group">
		                      <label for="board_title">제목</label>
		                      <input type="text" class="form-control" name="board_title" style="border: 1px solid #cdcdce; width: 1100px;" 
		                      	     maxlength="27" placeholder="제목을 입력해주세요">
		                    </div>
	
		                    <div class="form-group">
		                      <label for="board_content">내용</label>
		                      <textarea class="form-control" name="board_content" rows="10" cols="70" maxlength="660"
		                      			style="border: 1px solid #cdcdce; width: 1100px;" placeholder="내용을 입력해주세요"></textarea>
		                    </div>
		                    <a href="/CustomerCenter/boardList"><button type="button" class="btn btn-outline-secondary">목록 가기</button></a>
		                    <button type="submit" class="btn btn-primary mr-2" style="margin-left:900px;">제출</button>
		                  </form>
	                </div>
	              </div>
		   </div>
	     </div>
	    </div>
	   </div>
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
</body>
</html>