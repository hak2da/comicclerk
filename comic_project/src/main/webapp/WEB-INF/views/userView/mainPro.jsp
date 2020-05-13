<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<body>

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
var socket = new WebSocket("ws://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/echo_order");
var sessionValue = ${roomNum};
var memberid = "<c:out value='${memberid}' />";
socket.onopen = function() {
	console.log("소켓 시작");
	socket.send(sessionValue + ",시작," + memberid);
};

socket.onclose = function() {
	console.log("소켓 끝");
};


self.location = "/userView/main";
</script> 
</body>
</html>