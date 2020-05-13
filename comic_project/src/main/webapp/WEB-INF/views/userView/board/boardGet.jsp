<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../includes/userHeader.jsp"%>
      <!-- partial -->
      <div class="main-panel">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
                   <div class="card-body" style="margin-top:100px; margin-left:350px;">
                  <h2 class=".h2">건의 게시판</h2><br/>
                  <div class="table-responsive">
                    <table class="table" style="border: 1px solid #cdcdce; width: 1200px;" >
						<tr height="30" >
							<td align="center" width = "20" style="border: 1px solid #cdcdce">글번호</td>
							<td align="center" width = "20" style="border: 1px solid #cdcdce"> ${ board.board_num }</td>
							<td align="center" width = "30" style="border: 1px solid #cdcdce">글제목</td>
							<td align="center" width = "300" style="border: 1px solid #cdcdce">${ board.board_title }</td>
							<td align="center" width = "30" style="border: 1px solid #cdcdce">작성자</td>
							<td align="center" width = "80" style="border: 1px solid #cdcdce">${ board.board_id }</td>
							
						</tr>
						
						<tr>

							<td height="300" width = "1000" colspan="6" style="word-break: break-all;">
							${ board.board_content }
							</td>

						</tr>
				
			 			<!-- 댓글 입력 -->		
			 			
                    
                		<!-- 끝 댓글 입력 끝  -->
                
                		<!-- 댓글 목록  -->	
               
		 				<tr >
							<td colspan="6" >
								
							   <div id="cmntList">
							   		
							   		<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!여기에 댓글목록이 있어야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							    	
							   </div>	
							</td>
						</tr>
               
                
               			<!-- 끝 댓글 목록 끝 -->	
                    		    
				
				<!-- 글 수정 및 삭제 버튼  -->
						<tr>
							<td height="50" width = "1000" colspan="6" style="border: 1px solid #cdcdce">
							<button type="button" data-oper='listBtn' class="btn btn-primary">목록가기</button>
				            
				            <c:if test="${ Memberlogin.MEMBER_ID == board.board_id || Memberlogin.MEMBER_ID=='9999'}">
				            <button type="button" data-oper='remBtn' 
				            		class="btn btn-primary" style="float:right;  margin-left:10px;">삭제하기</button>
				            </c:if> 
				            
				            <c:if test="${ Memberlogin.MEMBER_ID == board.board_id}">
				            <button type="button" data-oper='modBtn' 
				            		class="btn btn-primary" style="float:right;">수정하기</button>
				            </c:if>

							</td>
						</tr>
						
				<!-- 버튼 단락 끝  -->
					
		            </table>     
		            
		            
		            <form id='operForm' action="/userView/board/BoardModify" method="get">
					  <input type='hidden' id='board_num' name='board_num' value='<c:out value="${board.board_num}"/>'>
					  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
					</form>
					
					<form id='removeForm' action="/userView/board/BoardRemove" method="post">
					  <input type='hidden' id='board_num' name='board_num' value='<c:out value="${board.board_num}"/>'>
					</form>
		            
		            
                  </div>
                </div>
              </div>
            </div>
         </div>


<script type="text/javascript" src="/resources/js/comments.js"></script>
            
<script>

//////////////////////////////////////////////////////////comments//////////////////////////////////////////
 $(document).ready(function () {

    var boardValue = '<c:out value="${board.board_num}"/>'; 
	var cmntList = $("#cmntList");

	commentsList();
	
	function commentsList(){
		
		console.log("페이지번호: " + boardValue);
		var str='';

		cmntajax.getList(boardValue, function(data){	
		for (var i = 0, len = data.length || 0; i < len; i++) {
			 str += '<div style="margin-bottom: 10px; height:190px; background-color:#DAE8E8; border-radius: 20px; width:1150px;"><br/>';
			 str += '<div style="margin-left:40px; float:left; width:40px; height:40px; background-color:white; border-radius: 50%; font-weight:bold;"></br>&emsp;'+data[i].cmnt_num+'</div>';
			 str += '<div style="height:20px; font-size:20px; margin-left:100px;">'+'작성자 : '+data[i].cmnt_id+' / 작성일 : '+cmntajax.displayTime(data[i].cmnt_date)+'</div>';
  			 str +=	'<br/><br/><div style="word-break: break-all; background-color:white; border-radius:20px; height:110px; margin-left:40px; width:1000px;" id= "updateCmnt_'+ data[i].cmnt_num +'"><br/>'+data[i].cmnt_content+'</div>';
	   		 str +=	'</div>';			

		}
		cmntList.html(str);
	 });

	}



//////////////////////////////////////////////////////////board/////////////////////////////////////////////

	  var operForm = $("#operForm");
	  var removeForm = $("#removeForm");
	  
	  $("button[data-oper='modBtn']").on("click", function(e){
	    
	    operForm.attr("action","/userView/board/boardModify").submit();
	    
	  });
	  
	    
	  $("button[data-oper='listBtn']").on("click", function(e){
	    
	    operForm.find("#board_num").remove();
	    operForm.attr("action","/userView/board/boardList")
	    operForm.submit();
	    
	  });

	  $("button[data-oper='remBtn']").on("click", function(e){

		if(confirm("게시물을 삭제하시겠습니까?")){

			removeForm.attr("action", "/userView/board/boardRemove").submit();
		
		}else{

			return false;
		}


	  });  

});

</script>
           

</body>

</html>