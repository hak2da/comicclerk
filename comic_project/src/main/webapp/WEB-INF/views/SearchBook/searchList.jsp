<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/userHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코믹 서기 책 위치 검색</title>
<style type="text/css">

table, tr , td{border:1px solid #d0dfef; font-size:20px; text-align: center;}

tr{margin-bottom:5px;}
.hide {display:none;}
.show {display:table-row; font-size:20px; }
.info td {cursor:pointer; font-size:20px; }

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	
}

.uploadResult ul li img {
	width: 170px;
	height: 220px;
}

.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

</head>
<body>
      <!-- partial -->
      <div class="main-panel">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">  
                <div class="card-body" style="margin-top:50px; margin-left:150px;">
                  <div style="text-align:center; width:1560px;">
                    <h2 class=".h2"><a href="javascript:home()">홈</a> > 도서 검색</h2> </br><h4> 제목을 누르면 상세정보를 볼 수 있습니다.</h4><br/>
                  </div><br/>
                  	<div style="width:800px; margin:0 auto;">
				    <form class="form-inline" action="/SearchBook/searchList" 
				          id='searchForm' method="get" style="margin-bottom: 20px; margin:0 auto;">
				    		<select name="type" class="form-control">
				     			<option value=""
									 <c:out value="${pageMaker.cri.type == null?'selected':''}"/> >선택해주세요</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>카테고리</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>저자</option>
								<option value="N"
									<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>내용</option>
								<option value="TN"
									<c:out value="${pageMaker.cri.type eq 'TN'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 저자</option>
							 </select>
				    		<input type="text" name="keyword" class="form-control" size="70" maxlength="40" >&nbsp;
				    		<input type="submit" class="btn btn-primary btn-md" value="검색">
				    		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'/>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
				    		
				    </form>
				    </div>
		            <br/><br/>
                  <div class="table-responsive">
                  
                    <c:if test='${count==0}'>
                      <td colspan="4"><h3 style="text-align: center;">검색 결과 없습니다.</h3></td>                    	
					</c:if>
					
					<c:if test="${count>0 }">
					
					<table class="accocss table-stripe">
                      <thead>
                        <tr style="height: 40px;">
                          <td style="width:80px;">분류</td>
                          <td style="width:800px;">제목</td>
                          <td style="width:300px;">저자</td>
                          <td style="width:300px;">출판사</td>
                          <td style="width:100px;">마지막 권</td>
                          <td style="width:200px;">위치</td>                      
                        </tr>
                      </thead>
 
					
						<c:forEach items="${ list }" var="list">
						
							<tbody>					
								<tr class="info" style="height: 40px; background-color: #F3F2EC;">
		                          <td style="width:80px;"><c:out value="${list.book_category }" /></td>
		                          <td style="width:800px; color: #007bff;"><a class="book_name" value="${list.book_name }" >
		                          <c:out value="${list.book_name }" /></a></td>
		                          <td style="width:300px;"><c:out value="${list.book_writer }" /></td>
		                          <td style="width:300px;"><c:out value="${list.book_publisher }" /></td>
		                          <td style="width:100px;"><c:out value="${list.book_lastbook }" /></td>
		                          <td style="width:200px;"><c:out value="${list.book_loc }" /></td>	                         
		                        </tr>
		                        
		                        <tr class="hide" style="height: 230px;">
		                          <td colspan="6">			                          
							      	<div class='uploadResult' style="width: 170px; float: left; height: 220px; margin: 10px 10px 0px 20px;"> 
							        	<ul>
							          		<!-- 이미지 -->
							        	</ul>
							        </div>
							        							        
							        <font style="font-weight: 900; color: #1d809f; float:left; margin-left: 30px;">
							        &lt; <c:out value="${list.book_status }" />&gt;
							        </font>
							        
							        <div style="margin:10px 30px 10px 10px; width: 1300px; height: 200px; float: right; 
							              text-align: justify; border: 2px solid #d0dfef; border-radius: 10px; ">			          
				                         <c:out value="${list.book_content }" />
		                          	</div>
		                          </td>
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

					
					<form id='actionForm' action="/SearchBook/searchList" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				   </form>
				   <!--홈관련 hidden form -->
				   <form id="operForm"></form>
           </div>
         </div>
      </div>
    </div>



            
<script type="text/javascript">
	var roomNum = "<c:out value='${roomNum}'/>";
	console.log(roomNum);
	
	$(document).ready(function(){
		
			$(function(){
	            var article = (".accocss .show"); 
	            $(".accocss .info td").click(function() { 
	                var myArticle =$(this).parents().next("tr"); 
	                if($(myArticle).hasClass('hide')) { 
	                	$(article).removeClass('show').addClass('hide'); 
	                    $(myArticle).removeClass('hide').addClass('show'); 
	                } 
	                else { 
	                    $(myArticle).addClass('hide').removeClass('show'); 
	                } 
	            }); 
	        });

			/*
			아코디언 구조
	        
			순정 나가다 만화 ~~~
	        액션 가나다 만화 ~~~

	        this.parents().next("tr"); ---> 
	        ".accocss .info td"의 부모의 오른쪽 혹은 밑 요소 = ".accocss .info td"의 부모 tr의 오른쪽 혹은 옆의 요소(상세보기가 적힌 tr)
	        
	        **나가다라는 제목이 적힌 tr을 누르면 display:none 되어있던 나가다 밑에 tr의 td(상세정보)가 보여진다.
	        이때 가나다라는 제목이 적힌 다른 tr을 누르면 이전에 나타난 나가다 밑에 tr 의 td(상세정보)가 숨겨지고 
	        현재 누른 가나다 밑에 tr 의 td(상세정보)가 보여진다.**

	        if($(myArticle).hasClass('hide')) :
		       원래 class name이 hide니까 만약 hide라면 보여진건 숨겨지고 클릭한 제목의 상세보기는 보여지게 하는것(**로 둘러싸인 내용을 구현)

	        else { $(myArticle).addClass('hide').removeClass('show');}
	        	= if($(myArticle).hasClass('hide'))가 아니라면 $(myArticle).hasClass('show')라면 &&로 둘러싸인 내용을 구현하라

	 	    &&& 나가다라는 제목이 적힌 tr을 누르면 display:none 되어있던 나가다 밑에 tr의 td(상세정보)가 보여진다. 
	 	    다시 나가다라는 제목이 적힌 tr을 누르면 나가다 밑에 tr의 td(상세정보)가 숨겨진다.&&

	         */

			var actionForm = $("#actionForm");

			$(".page-item a").on( 
					"click",
					function(e) {

						e.preventDefault();

						console.log('페이지이동');

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
			 });

			 

		
		});

		$('.book_name').click(function(){
			var bookname = $(this).attr('value');
			var str="";
			$.ajax({
				async : false, // 비동기
				type: 'get',
				url: '/book/getAttachList?book_name='+bookname,				
				success: function(attach) {
					var fileCallPath = encodeURIComponent(attach[0].uploadPath+"/s_"+attach[0].uuid+"_"+attach[0].fileName);
					str += "<li data-path='"+attach[0].uploadPath+"' data-uuid='"+attach[0].uuid+"' data-filename='"+attach[0].fileName+"' data-type='"+attach[0].fileType+"'>";
					str += "<div><img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
				}
			});
			$(".uploadResult ul").html(str);
		});

		function home(){
			var operForm = $("#operForm");

			operForm.append("<input type='hidden' name='roomNum' value='" + roomNum + "'>");
			operForm.attr("method", "post");
			operForm.attr("action","/userView/main");
			operForm.submit();
		}


</script>


</body>

</html>
