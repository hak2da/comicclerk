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
	                <div class="card-body" style="margin-top:50px; margin-left:200px; margin-bottom:50px;">
	                  <h1 class="card-title">건의 게시판 입니다</h1>
	                  
	                  <form role="form" class="forms-sample" action="/CustomerCenter/boardModify" method="post" 
							 onsubmit="return nullcheck();">
	                  	
	                  	<input type="hidden" name="board_id" value="${Memberlogin.MEMBER_ID}" >
	                  	<input type="hidden" name="board_num" value="${board.board_num}" >
	                  	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
					    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
						
						<!-- 제목 및 제목 -->
	                  	
	                    <div class="form-group">
	                      <label for="board_title">제목</label>
	                      <input type="text" class="form-control" name="board_title" style="border: 1px solid #cdcdce; width: 1100px;" 
	                      	     maxlength="27" value='${board.board_title}'>
	                    </div>
	                    
	                    <div class="form-group">
	                      <label for="board_content">내용</label>
	                      <textarea class="form-control" name="board_content" rows="10" cols="70" style="border: 1px solid #cdcdce; width: 1100px;"
	                                 maxlength="660" placeholder="내용을 입력해주세요" >${board.board_content}</textarea>
	                    </div>
	                    
	                    
	                    <!-- 리스트 및 목록가기 -->
	                    
	                    <button type="button" data-oper="list" class="btn btn-primary">목록가기</button>
	                    <button type="submit" class="btn btn-primary mr-2" style="margin-left:900px;">제출</button>
	                  </form>
	                </div>
	              </div>
		   </div>
	     </div>
	    </div>
	   </div>
	   
 <script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
		 if(operation === 'list'){
	      //move to list
		      formObj.attr("action", "/CustomerCenter/boardList").attr("method","get");
		      
		      var pageNumTag = $("input[name='pageNum']").clone();
		      var amountTag = $("input[name='amount']").clone();
		      var keywordTag = $("input[name='keyword']").clone();
		      var typeTag = $("input[name='type']").clone();      
		      
		      formObj.empty();
		      
		      formObj.append(pageNumTag);
		      formObj.append(amountTag);
		      formObj.append(keywordTag);
		      formObj.append(typeTag);	       
	    }
	    
	    formObj.submit();
	  });

});
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