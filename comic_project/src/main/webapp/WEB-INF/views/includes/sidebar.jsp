<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- partial:partials/_sidebar.html -->

<style>
li{list-style: none;}
.accordion_wrap a{cursor:pointer;}
.accordion_wrap .accordion_content{display:none;}
</style>


	<nav class="sidebar sidebar-offcanvas">
	
		<ul class="nav">

			<li class="nav-item"><a class="nav-link"
						href="/managerpos/managerpos">
					<i class="mdi mdi-home menu-icon"></i><span class="menu-title">
					포스 화면</span></a></li>
					
			<li class="nav-item"><a class="nav-link"
						href="/administrator/ceologin">
					<i class="mdi mdi-face menu-icon"></i><span class="menu-title">
					관리자 로그인</span></a></li>
						
			<c:if test="${sessionScope.EMPPOSITION=='사장'}">
			<li class="nav-item open accordion_wrap"><a class="nav-link"> 
			<i class="mdi mdi-cube menu-icon"></i> 
			<span class="menu-title">재고</span></a>
					
					<ul class="accordion_content">
						<li class="nav-item"><a class="nav-link"
							href="/product/productList"> <i
							class="mdi mdi-food menu-icon"></i> <span
								class="menu-title">상품 재고</span>
						</a></li>
						
						<li class="nav-item"><a class="nav-link"
							href="/book/bookList"> <i
							class="mdi mdi-book-open-page-variant menu-icon"></i> <span
								class="menu-title">책 재고</span>
						
						</a></li>
					</ul>
			</li>
			
			
			<li class="nav-item open accordion_wrap"><a class="nav-link"> 
			<i class="mdi mdi-currency-krw menu-icon"></i> 
			<span class="menu-title">매출 관리</span></a>
					
					<ul class="accordion_content">
						<li class="nav-item"><a class="nav-link"
						href="/salesstatistics/saleslist"> <i
							class="mdi mdi-file-document-box-outline menu-icon"></i> <span
							class="menu-title">매출 확인</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/settlement/settlementlist"> <i
								class="mdi mdi-calculator menu-icon"></i> <span
								class="menu-title">정산</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/loss/losslist"> <i
						class="mdi mdi-contrast menu-icon"></i> <span
						class="menu-title">손실</span>
						</a></li>
						<li class="nav-item">
						<a class="nav-link" href="/salesstatistics/salesstatisticslist">
						<i class="mdi mdi-chart-pie menu-icon"></i>
						<span class="menu-title">매출 통계</span>
						</a>
						</li>	
					</ul>
			</li>
			</c:if>
			
	
			
			<c:if test="${sessionScope.EMPPOSITION=='사장'}">
			<script type="text/javascript">
			
			</script>
			</c:if>
			
			
			<li class="nav-item"><a class="nav-link"
				href="/CustomerCenter/boardList"> <i
				class="mdi mdi-comment-text-multiple-outline menu-icon"></i> <span
					class="menu-title">건의 게시판</span>
			</a></li>
			
			 

			<%-- <c:if test="${empty Employeelogin}">
			<li class="nav-item"><a class="nav-link"
				href="/member/EmployeeLogin"> <i
				class="mdi mdi-file-document-box-outline menu-icon"></i> <span
					class="menu-title">직원 로그인</span>
			</a></li>
			</c:if> --%>
			
			<c:if test="${sessionScope.EMPPOSITION=='사장'}">
			<li class="nav-item"><a class="nav-link"
				href="/member/MemberList"> <i
				class="mdi mdi-account menu-icon"></i> <span
					class="menu-title">회원 관리</span>
			</a></li>


			<li class="nav-item"><a class="nav-link"
				href="/userOrderManager/orderManager"> <i
				class="mdi mdi-inbox-arrow-down menu-icon"></i> <span
					class="menu-title">상품판매관리</span> 
			</a></li>	
						</c:if>				

		</ul>
</nav>
<script type="text/javascript">
$(".accordion_wrap > a").click(function(){
    // 현재 클릭한 태그가 a 이기 때문에
    // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
    $(this).next("ul").toggleClass("accordion_content");
    console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
});
$("#commute").on("click", function() {
	$("#commuteModal").modal("show");
	gettodaycommute();
});

function sessioninvalid(){
	alert("세션삭제");

	sessionStorage.removeItem( "EMPID" );

}

function gettodaycommute() {

	$.ajax({
		url : '/managerpos/gettodaycommute',
		dataType : 'json',
		contentType : "application/json; charset=utf-8;",
		type : 'POST',
		success : function(data) {

			console.log(data);
			/* var text="";
			console.log(data[0]);*/
			var htmlStr = "";
			
			htmlStr += "<table style='width: 100%; text-align:center;'>";
			$.each(data, function(index, list) {
				htmlStr += "<tr>";
				htmlStr += "<td class='td_y_header'>" + list.empnum +"/"+list.empname +"</td>"
				htmlStr += "<td class='td_y_header'>" + list.starttime + "</td>"
				htmlStr += "<td class='td_y_header'>" + list.endtime + "</td>"
				htmlStr += "</tr>";
			});
			htmlStr += "</table>";
			$("#todaycummute").html(htmlStr);
			
		},
		error : function(data) {
			console.log("실패");
		}
	});

}
</script>