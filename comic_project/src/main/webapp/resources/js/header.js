function headermembermodifyBtn() {
	$('#headerMemberModifyPasswordModal').show();
	
	$('#headerMemberModifyPasswordclose').click(function(){
		$('#headerMemberModifyPasswordModal').hide();
		$('#headerMemberModifyPasswordModal').find('form')[0].reset();
	});
}


function headerMemberModifyPasswordCheck(MEMBER_ID,MEMBER_PWD){
	$.ajax({
		type : 'get',
		url : "/member/MembermodifyCheck?MEMBER_ID=" + MEMBER_ID +"&MEMBER_PWD=" + MEMBER_PWD,
		dataType : "json",
		success : function(data) {
			console.log(data);
			if(data == 1){
			$('#headerMemberModifyPasswordModal').hide();
			$('#headerMemberModifyPasswordModal').find('form')[0].reset();
			$.ajax({
				type : 'get',
				url : "/member/MemberModify?MEMBER_ID=" + MEMBER_ID,
				success : function(data) {
					$('#HeaderMEMBER_ID').attr('value',
						data.getModify['member_ID']);
					$('#HeaderMEMBER_NAME').attr('value',
							data.getModify['member_NAME']);
					$('#HeaderMEMBER_EMAIL').attr('value',
							data.getModify['member_EMAIL']);
					$('#HeaderMEMBER_PHONE_NUMBER').attr('value',
							data.getModify['member_PHONE_NUMBER']);
					$('#headerMemberModifyModal').show();
				}
			});
			$('#headermodifyclose').click(function(){
				$('#headerMemberModifyModal').hide();
				$('#headerMemberModifyModal').find('form')[0].reset();
			});
			} else {
				alert("비밀번호가 틀렸습니다.");
			}
		}
	});
}

//function headerMemberModifyPasswordBtn(MEMBER_ID){
//		console.log("여기는 오는거임!");
//		$.ajax({
//			type : 'get',
//			url : "/member/MemberModify?MEMBER_ID=" + MEMBER_ID,
//			success : function(data) {
//				$('#HeaderMEMBER_ID').attr('value',
//					data.getModify['member_ID']);
//				$('#HeaderMEMBER_NAME').attr('value',
//						data.getModify['member_NAME']);
//				$('#HeaderMEMBER_EMAIL').attr('value',
//						data.getModify['member_EMAIL']);
//				$('#HeaderMEMBER_PHONE_NUMBER').attr('value',
//						data.getModify['member_PHONE_NUMBER']);
//				$('#headerMemberModifyModal').show();
//			}
//		});
//		$('#headermodifyclose').click(function(){
//			$('#headerMemberModifyModal').hide();
//			$('#headerMemberModifyModal').find('form')[0].reset();
//		});
//};


function headervalidate() {
	var re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	var regExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식

	var pw = document.getElementById("HeaderMEMBER_PWD");
	var email = document.getElementById("HeaderMEMBER_EMAIL");
	var phone = document.getElementById("HeaderMEMBER_PHONE_NUMBER");
	// ------------ 이메일 까지 -----------

	console.log("수정누르면 이거뜨는건가?");
	if (!check(re, pw, "ㄹㄹㄹ패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (pw.value == "") {
		alert("비밀번호를 입력해 주세요");
		pw.focus();
		return false;
	}

	if (email.value == "") {
		alert("이메일을 입력해 주세요");
		email.focus();
		return false;
	}

	if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}

	if (!check(regExp, phone, "적합하지 않은 번호 형식입니다.")) {
		return false;
	}
}

function check(re, what, message) {
	if (re.test(what.value)) {
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	//return false;
}

$("#orderOK").on("click", function() {
	$("#ModalorderArlet").modal("hide");
});