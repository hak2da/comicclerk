<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h2 class=".h2">건의 게시판</h2><br/>
                  <div class="table-responsive">
                    <table class="table" style="border: 1px solid #cdcdce" >
						<tr height="30">
							<td align="center" width = "20" style="border: 1px solid #cdcdce">글번호</td>
							<td align="center" width = "20" style="border: 1px solid #cdcdce"> ${ board.board_num }</td>
							<td align="center" width = "30" style="border: 1px solid #cdcdce">글제목</td>
							<td align="center" width = "400"style="border: 1px solid #cdcdce">${ board.board_title }</td>
							<td align="center" width = "30" style="border: 1px solid #cdcdce">작성자</td>
							<td align="center" width = "50" style="border: 1px solid #cdcdce">${ board.board_id }</td>
							
						</tr>
						
						<tr>

							<td height="300" width = "1000" colspan="6" style="word-break: break-all;">
							${ board.board_content }
							</td>

						</tr>
				
			 			<!-- 댓글 입력 -->		
			 			
			 			
			 			<c:if test="${sessionScope.EMPPOSITION=='사장' or sessionScope.EMPPOSITION=='매니저'}">
						<tr>
						
							<td height="50" width = "1000" colspan="6" style="border: 1px solid #cdcdce">
							<div id='cmntInsert'>
								
								<div class="form-group" style="float: left;">
									<input type="hidden" name="cmnt_id" value="관리자" >
									<input type="hidden" name="board_num" value="${board.board_num}" >
				                    <textarea class="form-control" name="cmnt_content" id="cmnt_content "placeholder="댓글을 입력하세요" 
				                      		  maxlength="330" rows="5" style="width:1370px; border: 1px solid #cdcdce;"></textarea>
			                    </div>
			                    
			                    <div class="form-group" style="float: right;"> 
				                    <button type="button" class="btn btn-primary mr-2" 
				                     		id="cIstBtn" style="width:110px; height: 100px;">댓글쓰기</button><br/><br/>
				                    
			                    </div>
			                    
							</div>
							
							</td>
						</tr>
						
						</c:if>
                    
                		<!-- 끝 댓글 입력 끝  -->
                
                		<!-- 댓글 목록  -->	
               
		 				<tr>
							<td colspan="6">
								
							   <div id="cmntList">
							   		
							   		<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!여기에 댓글목록이 있어야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							    	
							   </div>	
							</td>
						</tr>
               
                
               			<!-- 끝 댓글 목록 끝 -->	
                    		    
				
				<!-- 글 수정 및 삭제 버튼  -->
						<tr>
							<td height="50" width = "1000" colspan="6">
							<button type="button" data-oper='listBtn' class="btn btn-primary">목록가기</button>
				            
				            <c:if test="${sessionScope.EMPPOSITION=='사장' or sessionScope.EMPPOSITION=='매니저'}">
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
		            
		            
		            <form id='operForm' action="/CustomerCenter/BoardModify" method="get">
					  <input type='hidden' id='board_num' name='board_num' value='<c:out value="${board.board_num}"/>'>
					  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
					</form>
					
					<form id='removeForm' action="/CustomerCenter/BoardRemove" method="post">
					  <input type='hidden' id='board_num' name='board_num' value='<c:out value="${board.board_num}"/>'>
					</form>
		            
		            
                  </div>
                </div>
              </div>
            </div>
         </div>
       </div>
     </div>
     <div style="font: "></div>

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
			 str += '<div style="margin-bottom: 10px; height:190px; background-color:#DAE8E8; border-radius: 20px; width:1500px;"><br/>';
			 str += '<div style="margin-left:40px; float:left; width:40px; height:40px; background-color:white; border-radius: 50%; font-weight:bold;"></br>&emsp;'+data[i].cmnt_num+'</div>';
			 str += '<div style="height:20px; font-size:20px; margin-left:100px;">'+'작성자 : '+data[i].cmnt_id+' / 작성일 : '+cmntajax.displayTime(data[i].cmnt_date);

			 if( ${sessionScope.EMPPOSITION=='사장' || sessionScope.EMPPOSITION=='매니저'}) { 
	   		 str +=	'&emsp;<button class="btn btn-sm btn-outline-secondary" onclick="updateCmntForm('+data[i].cmnt_num+',\''+data[i].cmnt_content+'\');">수정</button>'; 
  			 str += '&emsp;<button class="btn btn-sm btn-outline-secondary" onclick="commentDelete('+data[i].cmnt_num+')">삭제</button>';

			 }
  			 str +=	'</div><br/><br/><div style="background-color:white; border-radius: 20px; height:110px; width:1400px; margin-left:40px;" id= "updateCmnt_'+ data[i].cmnt_num +'"><br/>'+data[i].cmnt_content+'</div>';
	   		 str +=	'</div>';			

		}
		cmntList.html(str);
	 });

	}
	

	var reply = $("#cmntInsert");
	var replyContent = reply.find("textarea[name='cmnt_content']");
	var replyId = reply.find("input[name='cmnt_id']");
	var replyDate = reply.find("input[name='cmnt_date']"); 
	var boardNum = reply.find("input[name='board_num']");
	var updateDiv = $("#updateDiv"); 	
	var cIstBtn = $("#cIstBtn");

       window.updateCmntForm = function(cmnt_num, cmnt_content) {

	     console.log(cmnt_num);
	     console.log(cmnt_content);
         var str='';
    	 str += '<div id="updateDiv">';
    	 str += '<textarea style="float:left; margin-left:10px; margin-top:5px; width:1200px;" class="form-control" name="content_'+cmnt_num+'"rows="5"  maxlength="330">'+cmnt_content+'</textarea>';
    	 str += '<div>&emsp;&emsp;'
    	 str += '<button style="margin-top:8px;" class="btn btn-md btn-outline-secondary" onclick="updateBtn(' + cmnt_num + ');">수정 완료</button><br/><br/>&emsp;&emsp;';
    	 str += '<button class="btn btn-md btn-outline-secondary" onclick="test(' + cmnt_num + ', \''+cmnt_content+'\');">수정 취소</button>';
    	 str += '</div></div>';

 		 $("#updateCmnt_"+cmnt_num).html(str);
 	 }  

 	 window.test = function(cmnt_num, cmnt_content) {
		var str = '<div id= "updateCmnt_'+ cmnt_num +'"><br/>&emsp;&emsp;'+cmnt_content+'</div>';
  		$("#updateCmnt_"+cmnt_num).html(str);
 	}

   	window.updateBtn= function(cmnt_num) {

		var comments ={
			cmnt_num : cmnt_num,
			cmnt_content : $('[name=content_'+cmnt_num+']').val()
		};

		cmntajax.update(comments, function(result){

 			console.log(result);
 			updateDiv.find("textarea").val("");

 			commentsList();

   	   	 });

   	}

     cIstBtn.on("click",function(e){
        
        var comments = {
        	  cmnt_id: replyId.val(),
        	  cmnt_content: replyContent.val(),
              board_num : boardNum.val()
	    };

	    console.log(comments);

	    cmntajax.add(comments, function(result){
          
	        console.log(result);
	       
	          
	        reply.find("textarea").val("");

	        commentsList();
    
        });
            
      }); 

 
    window.commentDelete = function(cmnt_num){

    	console.log("삭제버튼 누르면 나와야하는 로그");

        if(confirm('댓글을 삭제하시겠습니까?')){

        	 console.log("이건 댓글 번호: "+cmnt_num);
         	  
         	 cmntajax.remove(cmnt_num, function(result){
         	    
         	     commentsList();
         	      
         	  });

         }else{
			return false;
         }
	  
    } 

//////////////////////////////////////////////////////////board/////////////////////////////////////////////

	  var operForm = $("#operForm");
	  var removeForm = $("#removeForm") 
	  
	  $("button[data-oper='modBtn']").on("click", function(e){
	    
	    operForm.attr("action","/CustomerCenter/boardModify").submit();
	    
	  });
	  
	    
	  $("button[data-oper='listBtn']").on("click", function(e){
	    
	    operForm.find("#board_num").remove();
	    operForm.attr("action","/CustomerCenter/boardList")
	    operForm.submit();
	    
	  });

	  $("button[data-oper='remBtn']").on("click", function(e){

		if(confirm("게시물을 삭제하시겠습니까?")){

			removeForm.attr("action", "/CustomerCenter/boardRemove").submit();
		
		}else{

			return false;
		}


	  });  

});

</script>
           

</body>

</html>