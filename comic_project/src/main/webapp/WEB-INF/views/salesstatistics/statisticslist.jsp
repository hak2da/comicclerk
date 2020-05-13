<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 통계</title>
</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">
								<select name="selectYear" id="selectYear">
									<option value="19">2019</option>
									<option value="20">2020</option>
									<option value="21">2021</option>
									<option value="22">2022</option>
									<option value="23">2023</option>
									<option value="24">2024</option>
									<option value="25">2025</option>
									<option value="26">2026</option>
									<option value="27">2027</option>
									<option value="28">2028</option>
									<option value="29">2029</option>
								</select> 월 매출
							</h4>
							<div id="linecanvas">
								<canvas id="line"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">
								<select name="selectYear2" id="selectYear2">
									<option value="19">2019</option>
									<option value="20">2020</option>
									<option value="21">2021</option>
									<option value="22">2022</option>
									<option value="23">2023</option>
									<option value="24">2024</option>
									<option value="25">2025</option>
									<option value="26">2026</option>
									<option value="27">2027</option>
									<option value="28">2028</option>
									<option value="29">2029</option>
								</select> <select name="selectMonth" id="selectMonth">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select> 일 매출
							</h4>
							<div id="barcanvas">
								<canvas id="bar"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">상품 매출 TOP5</h4>
							<div id="horizontalbarcanvas">
								<canvas id="horizontalbar"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">방 매출</h4>
							<div id="horizontalRoombarcanvas">
								<canvas id="horizontalRoombar"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	var barChartCanvas = $("#bar").get(0).getContext("2d");
	var lineChartCanvas = $("#line").get(0).getContext("2d");
	var horizontalbarChartCanvas = $("#horizontalbar").get(0).getContext("2d");
	var horizontalRoombarChartCanvas = $("#horizontalRoombar").get(0).getContext("2d");
	$(document).ready(function(){
						getYearList(sendData, lineChartCanvas);
						getMonthList(sendData, barChartCanvas);
						getProductList();
						getRoomList();
	});

	$('#selectYear').change(function() {
		var changeYear = $('#selectYear option:selected').val();

		sendData = {
			"year" : changeYear
		}
		sendData = {
			"year" : changeYear
		}
		$('#line').remove();
		$('#linecanvas').append('<canvas id="line"></canvas>');
		lineChartCanvas = $("#line").get(0).getContext("2d");
		getYearList(sendData, lineChartCanvas);
	});

	$('#selectMonth').change(function() {
		var changeYear2 = $('#selectYear2 option:selected').val();
		var changeMonth = $('#selectMonth option:selected').val();

		sendData = {
			"year" : changeYear2,
			"month" : changeMonth
		}
		$('#bar').remove();
		$('#barcanvas').append('<canvas id="bar"></canvas>');
		barChartCanvas = $("#bar").get(0).getContext("2d");
		getMonthList(sendData, barChartCanvas);
	});

	$('#selectYear2').change(function() {
		var changeYear2 = $('#selectYear2 option:selected').val();
		var changeMonth = $('#selectMonth option:selected').val();

		sendData = {
			"year" : changeYear2,
			"month" : changeMonth
		}
		$('#bar').remove();
		$('#barcanvas').append('<canvas id="bar"></canvas>');
		barChartCanvas = $("#bar").get(0).getContext("2d");
		getMonthList(sendData, barChartCanvas);
	});

	function selector(target, value) {
		var obj = document.getElementById(target);

		for (i = 0; i < obj.length; i++) {

			if (obj.options[i].value == value) {
				obj.options[i].selected = true;
			}
		}
	}

	var today = new Date();
	var mm = today.getMonth() + 1;
	var yy = today.getFullYear().toString().substr(2, 2);
	selector("selectMonth", mm);
	selector("selectYear", yy);
	selector("selectYear2", yy);
</script>
<script src="/resources/js/inhochart.js"></script>
</html>
