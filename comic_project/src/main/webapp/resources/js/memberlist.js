var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;  // 이메일이 적합한지 검사할 정규식
var regExp = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰번호 정규식

$(document).ready(function(){
	$('#modalstyle').css('display','none');
	$('#memberListTable').DataTable({ // 페이징 처리, 검색, show entries
		pageLength: 10, //처음 페이지에 처리 개수
	    bPaginate: true, // 페이징 기능
	    bLengthChange: true,
	    lengthMenu : [ [ 10, 20, 30, -1 ], [ 10, 20, 30, "All" ] ], //show entries
	    bAutoWidth: false,
	    processing: true,
	    ordering: true,
	    serverSide: false,
	    searching: true, // 검색 기능
	    ajax : {
	    	url : "/member/MemberData.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "member_ID"},
	    	{data: "member_NAME"},
	    	{data: "member_EMAIL"},
	    	{data: "member_PHONE_NUMBER"},
            {
                mData: "member_ID",
                mRender: function (data, type, row) {
                	console.log(data);
                    return "<button name ='membermodifyBtn' value=" + data +" type='button' class='btn btn-warning' onclick='javascript:membermodifyBtn(value)' style='color:white;'>수정</button> ";
                }
            }
        ],
	    
	    bStateSave: true,
	    "iDisplayLength": 10,
	    "language": {
	      search: "Search :"
	    },
	    "columnDefs": [{
	        targets: 'no-sort',
	        orderable: false
	    }],
	    
	    order: [[0, 'desc']]
	});
	
});

function membermodifyBtn(MEMBER_ID) {
    	
	$.ajax({
	    type: 'get',
	    url: "/member/MemberModify?MEMBER_ID="+MEMBER_ID,
	    dataType : "json",
	    success: function(data) {
	    	$('#MEMBER_ID_modify').attr('value',data.getModify['member_ID']);
	    	$('#MEMBER_NAME_modify').attr('value',data.getModify['member_NAME']);
	    	$('#MEMBER_EMAIL_modify').attr('value',data.getModify['member_EMAIL']);
	    	$('#MEMBER_PHONE_NUMBER_modify').attr('value',data.getModify['member_PHONE_NUMBER']);
	    	$('#MemberModifyModal').show();
	    }
	});
	$('#modifyclose_modify').click(function(){
		$('#MemberModifyModal').hide();
		$('#MemberModifyModal').find('form')[0].reset();
		$('#modalstyle').css('display','none');
	});
	$('#modalstyle').css('display','');
	
}

