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
<title>코믹 서기 건의 게시판</title>
</head>
<body>
      <!-- partial -->
	<div class="main-panel">        
	  <div class="content-wrapper">
	    <div class="row">
	   		<div class="col-12 grid-margin stretch-card">
	            <div class="card">
	                <div class="card-body">
                  	<h2 class=".h2">건의 게시판</h2>
                  
				    <form class="form-inline" action="/CustomerCenter/boardList" 
				          id='searchForm' method="get" style="float: right; margin-bottom: 20px;">
				    		<select name="type" class="form-control">
				     			<option value=""
									 <c:out value="${pageMaker.cri.type == null?'selected':''}"/> >선택해주세요</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							 </select>
				    		<input type="text" name="keyword" class="form-control" >&nbsp;
				    		<input id="searchBtn" type="submit" class="btn btn-primary btn-md" value="검색">
				    		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'/>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
				    		
				    </form>
				    	
		            <br/><br/>
                  <div class="table-responsive">
                  
                    <c:if test='${count==0}'>
                      <td colspan="4"><h3 style="text-align: center;">작성된 게시글이 없습니다.</h3></td>                    	
					</c:if>
					
					<c:if test="${count>0 }">
                                       
                    <table class="table" style="border:1px solid #f3f3f3;" >
                      <thead>
                        <tr>
                          <td style="width:200px;">글번호</td>
                          <td style="width:1000px;">글제목</td>
                          <td style="width:400px;">글쓴이</td>
                          <td style="width:300px;">날짜</td>
                        </tr>
                      </thead>
 
                      <c:forEach items="${ list }" var="list">
                      
	                      <tbody>
	                        <tr>
	                          <td style="width:200px;"><c:out value="${list.board_num }" /></td>
	                          <td style="width:1000px;"><a class='move' href='<c:out value="${list.board_num}"/>'>
	                          ${list.board_title }</a></td>
	                          <td style="width:400px;"><c:out value="${list.board_id }" /></td>
	                          <td style="width:300px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.board_date }" /></td>
	                        </tr>         
                      	  </tbody>
                      	  
                      </c:forEach>
                    </table>
                    
                    <br>		
					 </div>
					<!-- /.container -->
                    
                    <!-- 글번호 작성 -->                       
                   
                    <div class='pull-right' style="float: left; width:500px; height: 80px;">
                    <br>
					  <ul class="pagination" >
					  
					  	<c:if test="${pageMaker.prev}">
					    <li class="page-item">
					    <a class="page-link" href="${pageMaker.startPage -1}">Prev
					    </a></li>
					    </c:if>
					    
					    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					    <li class="page-item" ${pageMaker.cri.pageNum == num ? "active":""} ">
					    	<a class="page-link" id="pages" href="${num}">${num}</a>
					    </li>
					    </c:forEach>
					    
					    <c:if test="${pageMaker.next}">
					    <li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
					    </c:if>
					    
					  </ul>
					  

					</div>
					
					</c:if>
					<c:if test="${sessionScope.EMPPOSITION=='사장' or sessionScope.EMPPOSITION=='매니저'}">
					<div class="template-demo" style="float: right; width:100px; margin-left:350px">
			            <button type="button" id='regBtn' class="btn btn-primary">글쓰기</button>
			     	</div>
					</c:if>
					
					<form id='actionForm' action="/CustomerCenter/boardList" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				   </form>

           </div>
         </div>
      </div>
    </div>
   </div>
  </div>


            
<script type="text/javascript">

	$(document)
		.ready(
				function(){


			var actionForm = $("#actionForm");

			
 			$(".move").on(
					"click",
					function(e){
						e.preventDefault();
						actionForm.append("<input type='hidden' name='board_num' value='"
								+$(this).attr("href")+ "'>");
						actionForm.attr("action", "/CustomerCenter/boardGet");
						actionForm.submit();
						
			}); 

			$("#regBtn").on("click", function() {

				self.location = "/CustomerCenter/boardRegister";

			});

			$(".page-item a").on( 
					"click",
					function(e) {

						e.preventDefault();

						console.log('페이지이동');

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
			 });

			var searchForm = $("#searchForm");

			 $("#searchBtn").on(
					"click",
					function(e){
						console.log('검색 방지 필터');

						if(!searchForm.find("option:selected").val()){
							alret("검색 종류를 선택해주세요");
						}
						if(!searchForm.find("input[name='keyword']").val()){
							alret("키워드를 입력해주세요");
						}
						searchForm.find("input[name='pageNum']").val(1);
						e.preventDefault();
						console.log('검색');

						searchForm.submit();
						});
		
		});

</script>


</body>


</html>