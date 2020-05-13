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
		<div class="content-wrapper">
			<div class="row">
				<div class="col-md-2 text-center">
				</div>
				<img src="/resources/images/comic_image.png" alt="" style="border:1px solid black; width: 100px; height: 50px;"/>
				
			</div>
			<div class="container">
				<div class="content-section-heading text-center">
					<h2 class="mb-5">모드선택</h2> 
				</div> 
				<div class="row no-gutters"> 
					<div class="col-lg-4">
						<a class="portfolio-item" name="roomMove" value="1"> <span class="caption"> <span class="caption-content">
									<h3>1번방</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" name="roomMove" value="2"> <span class="caption"> <span class="caption-content">
									<h3>2번방</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" name="roomMove" value="3"> <span class="caption"> <span class="caption-content">
									<h3>3번방</h3>
									<p class="mb-0">A yellow pencil with envelopes on a clean, blue backdrop!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-1.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4">
						<a class="portfolio-item" name="roomMove" value="4"> <span class="caption"> <span class="caption-content">
									<h3>4번방</h3>
									<p class="mb-0">Strawberries are such a tasty snack, especially with a little sugar on top!</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-3.jpg" alt="">
						</a>
					</div> 
					<div class="col-lg-4">
						<a class="portfolio-item" name="roomMove" value="5"> <span class="caption"> <span class="caption-content">
									<h3>5번방</h3>
									<p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-4.jpg" alt="">
						</a>
					</div>
					<div class="col-lg-4"> 
						<a class="portfolio-item" name="erpMain"> <span class="caption"> <span class="caption-content">
									<h3>ERP 시스템</h3>
									<p class="mb-0">A yellow workspace with some scissors, pencils, and other objects.</p>
							</span>
						</span> <img class="img-fluid" src="/resources/images/portfolio-4.jpg" alt="">
						</a>
					</div>
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
		operForm.attr("action","/userView/main");
		operForm.submit();
	});

	$("a[name='erpMain']").on("click", function(e){
		operForm.attr("method", "get");
		operForm.attr("action","/erp");
		operForm.submit();
	});
});
</script>
</html>
