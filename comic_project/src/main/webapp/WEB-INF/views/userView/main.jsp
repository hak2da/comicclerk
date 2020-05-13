<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/userHeader.jsp"%>
<script src="/resources/js/header.js"></script>

<style type="text/css">
.content-wrapper {
	padding-top: 30px;
}
</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>
	<!-- Header -->
	
	<div class="main-penal">
		<div class="content-wrapper">
			<div style="background-color: #37363a; height: 150px;">
				<img src="/resources/images/comic_image.png" alt="" style="width: 200px; height: 100px; margin-left:400px; margin-top:20px; float: left "/>
				<div class="content-section-heading text-center" style="width: 500px; height: 100px; margin-top:30px; float: left;"><br/>
					<h1 style="color:white;">${ roomNum } 번방 홈 &emsp;&emsp; <span id="main_time"></span></h1>
				</div> 
				<div style="width: 300px; height: 100px; color:#f4e362; float:right; margin-top:60px; margin-right:400px; font-size: 20px;" >
					<a style="color:#f4e362;" href='javascript:headermembermodifyBtn()'>회원 수정</a>
				</div>
				<br/><br/>
			</div>
			<div class="container">
				<div class="row no-gutters" style="margin-top: 50px;">
					
					<div class="col-lg-4">
						<a class="portfolio-item" id="userOrderView"> <span class="caption"> <span class="caption-content">
									<h3>상품 주문</h3>
									<p class="mb-0">상품을 주문하실 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/orderIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="userSearchbook"> <span class="caption"> <span class="caption-content">
									<h3>도서 검색</h3>
									<p class="mb-0">코믹 서기의 도서를 검색할 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/searchIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="billModalBtn"> <span class="caption"> <span class="caption-content">
									<h3>상세 요금</h3>
									<p class="mb-0">현재 사용한 요금을 보실 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/moneyIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" id="userChat"> <span class="caption"> <span class="caption-content">
									<h3 id="chatCss">채팅 하기</h3>
									<p class="mb-0">실시간 대화를 나눌 수 있습니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/chatIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div> 
					<div class="col-lg-4">
						<a class="portfolio-item" id="userBoard"> <span class="caption"> <span class="caption-content">
									<h3>건의 게시판</h3>
									<p class="mb-0">건의 사항을 적는 게시판입니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/boardIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
					<div class="col-lg-4"> 
						<a class="portfolio-item" id="kakaopay"> <span class="caption"> <span class="caption-content">
									<h3>사용 종료</h3>
									<p class="mb-0">사용 종료를 하면 카카오페이로 연결되고 완료되면 로그아웃 됩니다</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/exitIcon.png" alt="" style="width:370px; height:250px;">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modalstyle" class="modal-backdrop show"></div>
		
	<jsp:include page="headerMemberModifyModal.jsp" />
	<jsp:include page="headerMemberModifyPasswordModal.jsp" />
	<jsp:include page="billModal.jsp" />
	<jsp:include page="productBillModal.jsp" />
	<jsp:include page="chatting.jsp" />
	<jsp:include page="orderArlet.jsp" />
	<!-- hidden form -->
	<form id="operForm"></form>
</body>

<script type="text/javascript">
var sessionValue = ${roomNum};
var room_num = ${roomNum};
var mem_id = '${memberid}';
var total_price;
$(document).ready(function(){
	$('#modalstyle').css('display','none');
	$('#chatModal').css('display','none');
	
	ajaxtogetdb_comic_room_uselist();
	var operForm = $("#operForm");


	
	
	$("#userOrderView").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/userView/order");
		operForm.submit();
	});
	$("#userChat").on("click", function(e){
		$("#chatCss").css('color', 'black');
		$('#chatModal').css('display','');
		$("#chatModal").show();
		$('#modalstyle').css('display','');
		$.ajax({
			type: 'get',
			url: '/userView/chatting',
			dataType: 'json',
			success: function(data) {
				$("#messages" + sessionValue).html("");
				$.each(data , function(i){
					var str = "";
					if(data[i].chat_id == "admin") {
		            	str += "<li class='message left appeared'>";
		            	str += '<div class="avatar"></div>';
		            	str += '<div class="text_wrapper">';
		            	str += '<div class="text">' + data[i].chat_content +'</div>';
		            	str += '</div>';
		            	str += '</li>';
					} else {
						str += "<li class='message right appeared'>";
		            	str += '<div class="avatar"></div>';
		            	str += '<div class="text_wrapper">';
		            	str += '<div class="text">' + data[i].chat_content +'</div>';
		            	str += '</div>';
		            	str += '</li>';
					}
					$("#messages" + sessionValue).append(str);
	           });
			}
		});
	});

	
	$("#userSearchbook").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/SearchBook/searchList");
		operForm.submit();
	});
	$("#userBoard").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/userView/board/boardList");
		operForm.submit();
	});
	$("#billModalBtn").on("click", function(e){
		totalprice();
		$('#modalstyle').css('display','');
		totalprice();
		$.ajax({
			type: 'get',
			url: '/userView/userBill?userId=${Memberlogin.MEMBER_ID}',
			dataType: 'json',
			success: function(data) {
				$('#productBill').attr('value',data.product_bill);
				$('#roomBill').attr('value',data.room_bill);
				$('#totalBill').attr('value',data.total_bill);
			}
		});
		
		
		$("#productBillModalBtn").click(function() {
			$.ajax({
				type: 'get',
				url: '/userView/userProductBill?userId=${Memberlogin.MEMBER_ID}',
				dataType: 'json',
				success: function(data) {
					console.log(data);
					$("#productBillTbody").html("");
		            var str = '<tr>';
		            $.each(data , function(i){
		            	var date = new Date(data[i].order_time); var month = date.getMonth() + 1; 
		                str += '<td>' + date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate() +
		                "<br>" + date.getHours() + " : " + date.getMinutes() + ' : ' + date.getSeconds() + '</td><td>' + data[i].product_name + '</td><td>' + data[i].order_qty + '</td><td>' + data[i].order_bill + '</td>';
		                str += '</tr>';
		           });
		           $("#productBillTbody").append(str);
					
				}
			});
			/* $("#productBillModal").modal('show').css({
			    'margin-top': function () { //vertical centering
			        return -($(this).height() / 100);
			    },
			    'margin-left': function () { //Horizontal centering
			        return -($(this).width() / 100);
			    }
			}); */
			$("#productBillModal").show();
		});
		$('#billModal').show();
	});
});
/* 여기부터 시작관련 */
function ajaxtogetdb_comic_room_uselist() {			
	$.ajax({
		url : '/managerpos/get_room_uselist',
		dataType : 'json',
		contentType : "application/json; charset=utf-8;",
		type : 'POST',
		success : function(data) {
			
			var text="";
			console.log(data[0]);
			$.each(data, function(index,list){
				var number = list.roomuse_num;0
				if(number == sessionValue) {
					time_start(list.starttime, number);
				}
			});
			
		},
		error : function(data) {
			console.log("실패");
		}
	});
}
function time_start(time, num) {
	time =parseInt(time)//가끔 여기서 사용된 파라미터가 string형태로 읽어와져서 형변환을 한번해준다.
	time += 1;
	hour = Math.floor(time / 3600);
	hour = time_modify(hour);
	minute = Math.floor(time%3600 / 60);
	minute = time_modify(minute);
	var second = time % 60;
	second = time_modify(second);
	document.getElementById('main_time').innerHTML = hour
			+ ":" + minute + ":" + second;
	var t = setTimeout(function() {
		time_start(time, num)
	}, 1000)
}
function time_modify(time) {
	if (time.toString().length == 1) {
		time = "0" + time;
	}
	if(time==null){
		time=0;
	}
	
	return time;
}

function totalprice() {
	$.ajax({
		type: 'get',
		url: '/userView/userBill?userId=${Memberlogin.MEMBER_ID}',
		dataType: 'json',
		async: false,
		success: function(data) {
			total_price = data.total_bill;
		}
	});
}

var closeParam;
function popupclose(param) {
	closeParam = param;
} 

$('#kakaopay').click(function(e){
	totalprice();
	e.preventDefault();
	console.log(total_price);
	$.ajax({
		url : '/pay/kakao',
		type : 'get',
		data : { 
			  room_num : room_num,
			  id : mem_id,
			  totalprice : total_price
			},
		success : function(res) {
			console.log(res);
			if (res.totalprice != "0") {	
				var popup = window.open(res.payUrl, '카카오 결제', 'width=450, height=600, status=no, toolbar=no, location=no, top=200, left=200');
				timer = setInterval(function(){
		              if(popup.closed){
			              if( closeParam == 'success') {
			            	socket.send(room_num + ",종료," + mem_id);
			            	location.href="http://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/userView/mainPro?roomNum="+room_num
			            	
			              } else {
		            	  	location.href="http://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/userView/main?roomNum="+room_num
					      }
		                 
		              }
		        }, 1000)
			} else {
				socket.send(room_num + ",종료," + mem_id);
				location.href="http://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/userView/mainPro?roomNum="+room_num
			}
		}
	});
});
</script>
</html>