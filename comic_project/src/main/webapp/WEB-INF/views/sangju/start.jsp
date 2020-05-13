<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
	<button value="1" class="move">1번방</button>
	<button value="2" class="move">2번방</button>
	<button value="3" class="move">3번방</button>
	<button value="4" class="move">4번방</button>
	<button value="5" class="move">5번방</button>
	<button value="6" class="move">6번방</button>

	<form id='operForm' method="get">
	</form>
</body>
<script type="text/javascript">
	$(document).ready(function () {

		var operForm = $("#operForm");

		$(".move").on("click", function (e) {
			e.preventDefault();
			var getRoomNumber = $(this).val();
			console.log(getRoomNumber);
			operForm.append("<input type='hidden' name='roomNum' value='" + getRoomNumber + "'>");
			operForm.attr("method", 'post');
			operForm.attr("action", "/sangju/main");
			operForm.submit();
		});
	});
</script>

</html>