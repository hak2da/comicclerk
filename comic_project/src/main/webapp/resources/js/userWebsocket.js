$(document).ready(function() {
	var socket = new WebSocket("ws://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/echo_order");
	socket.onopen = function() {
		console.log("소켓 시작");
	};
 
	socket.onmessage = function(event) {
		console.log(event.data);
		var textData = event.data.split('|');
		test = textData[0];
		message_side = 'left';
		sendMessage(textData[1]);
	};

	socket.onclose = function() {
		console.log("소켓 끝");
	}; 
	 
	var Message;
	Message = function(arg) {
		this.text = arg.text, this.message_side = arg.message_side;
		this.draw = function(_this) {
			return function() {
				var $message;
				console.log(chatRoom);
				test = chatRoom;
				console.log(test);
				$message = $($('.message_template' + test).clone().html());
				$message.addClass(_this.message_side).find('.text').html(
						_this.text);
				$('#messages' + test).append($message);
				return setTimeout(function() {
					return $message.addClass('appeared');
				}, 0);
			};
		}(this);
		return this;
	};

	var getMessageText, message_side, sendMessage;
	getMessageText = function() {
		var $message_input;
		$message_input = $('.message_input');
		return $message_input.val();
	};
	sendMessage = function(text) {
		var $messages, message;
		if (text.trim() === '') {
			return;
		}
		$messages = $('.messages');
		
		message = new Message({
			text : text,
			message_side : message_side
		});
		message.draw();
		
		return $messages.animate({
			scrollTop : $messages.prop('scrollHeight')
		}, 300);
	};
	
	$('.send_message').click(function(e) {
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
	
	$('.message_input').keyup(function(e) {
		if (e.which === 13) { 
			message_side = 'right';
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
	
	for(var i = 0; i < chatvo.length; i++) {
		console.log(chatvo);

	}
});
//보류
function selectChat() {
	$.ajax({
		type : 'post',
		url : '/userOrderManager/productCheck',
		data : JSON.stringify(productJSON),
		contentType : "application/json; charset=utf-8",
		success : function(result, status, xhr) {
			if (callback) {
				callback(result);
			}
		},
		error : function(xhr, status, er) {
			if (error) {
				error(er);
			}
		}
	});
}
