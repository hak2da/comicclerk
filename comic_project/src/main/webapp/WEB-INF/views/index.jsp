<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./includes/userHeader.jsp"%>
<style type="text/css">
.content-wrapper {
	padding-top: 150px;
}
</style>
<body>

	<!-- Header -->
	<div class="main-penal">
		<div style="background-color: #37363a; height: 150px;">
			<img src="/resources/images/comic_image.png" alt="" style="width: 200px; height: 100px; margin-left:40px; margin-top:20px; "/>
			<div style="width: 1000px; float:right; height: 100px; color:#f4e362; margin-top:50px; font-size: 50px;">
			 여기는 편의를 위한 임시 창입니다
			</div>
			<br/><br/>
		</div>
			<br/><br/>
			
			<div class="container" >
				<!-- <div class="content-section-heading text-center">
					<h2 class="mb-5">코믹서기에 오신걸 환영합니다</h2> 
				</div>  -->
				<div class="row no-gutters"> 
					<!-- <div class="col-lg-4">
						<a class="portfolio-item" name="roomMove" value="1"> <span class="caption"> <span class="caption-content">
									<h3>1번방</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div> -->
					<div class="col-lg-4">				
						<a class="portfolio-item" name="roomMove" value="1"> <img class="img-fluid" src="/resources/images/room-icon.png" alt="" style="width:370px; height:250px;">
							<span class="caption"> 
							<span class="caption-content">
									<h3 style="margin-left:75px; margin-top:100px;">1번방</h3>
							</span>
							</span> 
						</a>
					</div>
					
					<div class="col-lg-4">				
						<a class="portfolio-item" name="roomMove" value="2"> <img class="img-fluid" src="/resources/images/room-icon.png" alt="" style="width:370px; height:250px;">
							<span class="caption"> 
							<span class="caption-content">
									<h3 style="margin-left:75px; margin-top:100px;">2번방</h3>
							</span>
							</span> 
						</a>
					</div>					
					<div class="col-lg-4">				
						<a class="portfolio-item" name="roomMove" value="3"> <img class="img-fluid" src="/resources/images/room-icon.png" alt="" style="width:370px; height:250px;">
							<span class="caption"> 
							<span class="caption-content">
									<h3 style="margin-left:75px; margin-top:100px;">3번방</h3>
							</span>
							</span> 
						</a>
					</div>	
					<div class="col-lg-4">				
						<a class="portfolio-item" name="roomMove" value="4"> <img class="img-fluid" src="/resources/images/room-icon.png" alt="" style="width:370px; height:250px;">
							<span class="caption"> 
							<span class="caption-content">
									<h3 style="margin-left:75px; margin-top:100px;">4번방</h3>
							</span>
							</span> 
						</a>
					</div>	 
					<div class="col-lg-4">				
						<a class="portfolio-item" name="roomMove" value="5"> <img class="img-fluid" src="/resources/images/room-icon.png" alt="" style="width:370px; height:250px;">
							<span class="caption"> 
							<span class="caption-content">
									<h3 style="margin-left:75px; margin-top:100px;">5번방</h3>
							</span>
							</span> 
						</a>
					</div>
					<div class="col-lg-4">						
							<a class="portfolio-item" name="erpMain"><img class="img-fluid" src="/resources/images/settingIcon.png" alt="" style="width:370px; height:250px;">
								<span class="caption"> 
								<span class="caption-content">
										<h3 style="margin-left:90px; margin-top:50px; height: 40px;">ERP</h3>
								</span>
								</span> 
							</a>						
					</div> 
				</div>
			</div>
	</div>
	
	<!-- hidden form -->
	<form id="operForm"></form>
</body> 
<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	
	
	$("a[name='roomMove']").on("click", function(e){
		operForm.append("<input type='hidden' name='roomNum' value='" + $(this).attr('value') + "'>");
		operForm.attr("method", "post");
		operForm.attr("action","/userView/mainPro");
		operForm.submit();
	});

	$("a[name='erpMain']").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/managerpos/managerpos");
		operForm.submit();
	});
});
</script>
</html>
