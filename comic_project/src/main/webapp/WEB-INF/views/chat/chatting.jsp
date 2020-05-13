<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/chatCss.css">

<div class="modal" id="chatModal">

			<!-- Modal body -->
					<div class="chat_window" id="chat_window">
						<div class="top_menu">
							<div style="float: right; margin-right:30px;">
								<div class="button close" id="chatClose">
								<font color=#fac4b7X; style="cursor: pointer; font-weight: 900;">X</font></div>
								</div>
							<div class="title"></div>
						<c:forEach var="i" begin="1" end="6" step="1">
							<ul class="messages" id="messages${i}"></ul>
						</c:forEach>
						<div class="bottom_wrapper clearfix">
							<div class="message_input_wrapper">
								<input class="message_input" id="message_input"placeholder="입력해주세요" />
							</div>
							<div class="send_message" id="send_message">
								<div class="icon"></div>
								<div class="text">Send</div>
							</div>
						</div>
					</div>
						<c:forEach var="i" begin="1" end="6" step="1">
						<div class="message_template${i}">
							<li class="message"><div class="avatar"></div>
							<div class="text_wrapper">
								<div class="text"></div>
							</div></li>
						</div>
						</c:forEach>
				
</div>
<script type="text/javascript">
var sessionValue = "<c:out value = '${admin}' />";
var memberid = "<c:out value='${memberid}' />";
var chatRoom;
var rightLeft;
var checkInOut;
var test;


	$("#chatClose").click(function() {
		$("#chatModal").hide();
		$('#modalstyle').css('display','none');
	});	

	$('#send_message').click(function(e) {
		console.log("메세지 보내기");
		if($('.message_input').val() == "") {
			return;
		}
		message_side = 'right';
		sendMessage(getMessageText());
		if(sessionValue == 'admin') {
			checkInOut = 'user';
			memberid = 'admin';
		} else {
			checkInOut = 'admin';
		}
		console.log($('.message_input').val());
		socket.send("chat," + chatRoom + "," + checkInOut + "," + $('.message_input').val() + "," + memberid);
		$('.message_input').val('');
	});

	$('#message_input').keyup(function(e) {
		if (e.which === 13) { 
			message_side = 'right';
			if($('.message_input').val() == "") {
				return;
			}
			sendMessage(getMessageText());
			if(sessionValue == 'admin') {
				checkInOut = 'user';
				memberid = 'admin';
			} else {
				checkInOut = 'admin';
				
			}
			
			console.log($('.message_input').val());
			console.log(chatRoom);
			socket.send("chat," + chatRoom + "," + checkInOut + "," + $('.message_input').val() + "," + memberid);
			$('.message_input').val('');
		}
	});

</script>
