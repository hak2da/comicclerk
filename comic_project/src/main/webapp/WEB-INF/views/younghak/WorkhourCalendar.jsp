<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">
*{
	font-family: 맑은 고딕;
}
td {
	width: 200px;
	height: 100px;
	text-align:left;
	font-size: 20px;
	border: 1px solid #dadfe4;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할

	function prevCalendar() {//이전 달
		// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		// 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}
	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		//이번 달의 첫째 날,
		//new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
		//new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
		//왜냐면 getMonth()는 0~11을 반환하기 때문
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		//이번 달의 마지막 날
		//new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
		//day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
		//대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다

		/*   alert("첫째날 = "+doMonth.getFullYear()+num_modify(doMonth.getMonth() + 1)+num_modify(doMonth.getDate())+
		          "\n마지막날 = "+lastDate.getFullYear()+num_modify(lastDate.getMonth() + 1)+num_modify(lastDate.getDate())
		          +"\n"+"${empname}"); */
		var lastDate2 = new Date(today.getFullYear(), today.getMonth() + 1, 1); //31일에 일했을경우를 생각해서 그다음달의 첫번째 날을 가져옴

		var startday = doMonth.getFullYear().toString()
				+ num_modify(doMonth.getMonth() + 1)
				+ num_modify(doMonth.getDate());
		var endday = lastDate2.getFullYear().toString()
				+ num_modify(lastDate2.getMonth() + 1)
				+ num_modify(lastDate2.getDate());

		//alert(startday+"\n"+endday+"\n${empname}");
		ajaxtogetdb_empworkrecord(startday, endday, "${empnum}");

		var tbCalendar = document.getElementById("calendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		document.getElementById("tbCalendarpremonth").innerHTML = "◀ "+ today
				.getFullYear()
				+ "년 " + today.getMonth() + "월";
		//저번달 가져오는 메서드
		document.getElementById("tbCalendarnextmonth").innerHTML = today
				.getFullYear()
				+ "년 " + (today.getMonth() + 2) + "월"+" ▶";
		//이번달 가져오는 메서드
		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {

			var year = today.getFullYear();
			var month = (today.getMonth() + 1);
			var day = today.getDate();

			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = i + addfontidbyday(year, month, i);

			//cell.innerHTML = i+year+num_modify(month)+num_modify(i);//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌

			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
				cell.innerHTML = "<font color='red'>" + i + "</font>"
						+ addfontidbyday(year, month, i);
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
				cell.innerHTML = "<font color='#4d83ff'>" + i + "</font>"
						+ addfontidbyday(year, month, i);
				//7번째의 cell에만 색칠
				row = calendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			/*오늘의 날짜에 노란색 칠하기*/
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#fcf2d8";//셀의 배경색을 노랑으로 
			}
		}
	}

	function num_modify(num) {

		if (num.toString().length == 1) {
			num = "0" + num;
		}
		return num;
	}

	var workingempdata;
	var worksecond_month = 0;
	function ajaxtogetdb_empworkrecord(startday, endday, empnum) {

		var list = [ startday, endday, empnum ];
		//사용자,시작시간,사용자 상태,주문 상태,방번호
		//alert("보내기전의 list" + list);
		var sendData = {
			'list' : list
		};

		//			var workingempdata=new Array();

		$.ajax({
			url : '/managerpos/getempworkrecord',
			dataType : 'json',
			data : JSON.stringify(sendData),
			contentType : "application/json; charset=utf-8;",
			type : 'POST',
			success : function(data) {

				workingempdata = data;

				console.log(workingempdata);

				var text = "";
				//console.log(data[0]);
				worksecond_month=0;
				$.each(data, function(index, list) {
					var number = 1;
					number = list.workingday;
					$('#' + number).text(
							"출근 : " + list.starttime + "~\r\n퇴근 : " + list.endtime);
					worksecond_month += list.worksecond;
					//날짜별로 데이터를 넣어줌

				});
				$('#worksummary').text(secondtotimeformat(worksecond_month));

			},
			error : function(data) {
				console.log("ajaxtogetdb_empworkrecord\n실패");
			}
		});

		console.log(workingempdata);
		//alert(workingempdata);
		return workingempdata;
	}
	function secondtotimeformat(time) {
		//var time ="";
		
		var hour = Math.floor(time / 3600);
		hour = time_modify(hour);

		var min= Math.floor(time%3600 / 60);
		min= time_modify(min);

		var sec= time % 60;
		sec= time_modify(sec);

		//return Math.floor(hour) + ":" + Math.floor(min) + ":" + sec;
		return hour + ":" + min + ":" + sec;
	}

	function time_modify(time) {

		if (time.toString().length == 1) {
			time = "0" + time;
		}
		return time;
	}

	function addfontidbyday(year, month, i) {//각 날짜(ex.20191015 를 id로 폰트를 저장하는 메서드)

		//var msg = "<br>"+year+num_modify(month)+num_modify(i);
		var msg = "<br><font id=" + year + num_modify(month) + num_modify(i)
				+ " > </font>"
		return msg;
	}
</script>


</head>
<body>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="row">
				<%@ include file="./younghak_header.jsp"%>
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="row">
							<div class="col-md-12">
								<p></p>
								<h1 style="margin:20px 0; text-align: center;">${empname} 의 출근표</h1>
								<h4 style="margin:20px 0; text-align: center;">
								총 근무 시간 : <font id="worksummary" style="color:red;"></font
								></h4>
								<table id="calendar" 
									style="border:3px solid #e9ecef; text-align:center; margin:0 0 50px 100px;">
									<tr style="font-weight: bold;">
										<!-- label은 마우스로 클릭을 편하게 해줌 -->
										<td style="border:1px solid white; text-align: center;">
										<label id="tbCalendarpremonth" style="cursor: pointer; color:#4d83ff;" onclick="prevCalendar()"></label>
										</td>
										
										<td id="tbCalendarYM" colspan="5" style="font-size:x-large; border:1px solid white; text-align: center;">
										</td>
										
										<td style="border:1px solid white; text-align: center;">
										<label id="tbCalendarnextmonth" style="cursor: pointer; color:#4d83ff;" onclick="nextCalendar()"></label>
										</td>
									</tr>
									<tr style="background-color:#686868; font-weight: bold;">
										<td style="text-align: center;"><font color="red">일</font></td>
										<td style="text-align: center;"><font color="white">월</font></td>
										<td style="text-align: center;"><font color="white">화</font></td>
										<td style="text-align: center;"><font color="white">수</font></td>
										<td style="text-align: center;"><font color="white">목</font></td>
										<td style="text-align: center;"><font color="white">금</font></td>
										<td style="text-align: center;"><font color="#4d83ff">토</font></td>
									</tr>
								</table>
								<script type="text/javascript">
									buildCalendar();//
								</script>
								

							</div>
							<!-- <div class="col-md-0"> -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- main-panel ends -->

</body>
</html>