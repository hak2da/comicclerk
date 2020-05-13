$(document).ready(function(){
	
	$("#bookRegisterBtn").click(function() {
		$("#bookRegister").show();
		$('#modalstyle2').css('display','');
	});

	$('#modalstyle2').css('display','none');
	$('#bookTable').DataTable({ // 페이징 처리, 검색, show entries	
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
	    	url : "/book/bookData.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "book_name"},
	    	{data: "book_loc"},
	    	{data: "book_publisher"},
	    	{data: "book_writer"},
	    	{data: "book_content"},
	    	{data: "book_category"},
	    	{data: "book_lastbook"},
	    	{data: "book_status"},
            {
                mData: "book_name",
                mRender: function (data, type, row) {
                    return "<button name ='getBtn' value=" + data +" type='button' class='btn btn-warning' onclick='javascript:bookModify(value)' style='color:white;'>수정</button> " +
                    	   "<button name ='removeBtn' value=" + data +" type='submit' class='btn btn-secondary' onclick='javascript:bookRemove(value)'>삭제</button>";
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
	        orderable: false,
	        targets: 4,
	        render: function ( data, type, row ) {
	            return data.substr( 0, 10 ) + "...";
	        }
	    }],
	    
	    order: [[0, 'desc']]
	    
	});
	
});

function bookRemove(book_name){
	
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}
	
	var form = document.createElement("form"); // form을 만듬
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "bookRemove");
	document.body.appendChild(form);

	var hiddenInput = document.createElement("input");
	hiddenInput.setAttribute("type", "hidden");
	hiddenInput.setAttribute("name", "book_name");
	hiddenInput.setAttribute("value", book_name);

	form.appendChild(hiddenInput);

	form.submit();
}

function bookModify(book_name) {
	
	$.ajax({
	    type: 'get',
	    url: "/book/bookGet?book_name="+book_name,
	    dataType : "json",
	    success: function(data) {
	    	$('#book_name_hidden').attr('value',data.book_name);
	    	$('#book_name_get').attr('value',data.book_name);
	    	$('#book_loc_get').attr('value',data.book_loc);
	    	$('#book_publisher_get').attr('value',data.book_publisher);
	    	$('#book_writer_get').attr('value',data.book_writer);
	    	$('#book_content_get').val(data.book_content);
	    	$('#book_category_get').attr('value',data.book_category);
	    	$('#book_lastbook_get').attr('value',data.book_lastbook);
	    	
	    	$("#book_status_get").html("");
	    	var optionStr = "";
	    	if(data.book_status == "완결") {
	    		optionStr += '<option value="' + data.book_status + '">' + data.book_status + '</option>';
	    		optionStr += '<option value="연재중">연재중</option>';
	    	} else {
	    		optionStr += '<option value="' + data.book_status + '">' + data.book_status + '</option>';
	    		optionStr += '<option value="완결">완결</option>';
	    	}
	    	$("#book_status_get").append(optionStr);
	    	
			$.getJSON("/book/getAttachList", {book_name: book_name}, function(arr){
		    
				console.log(arr);

				var str="";

				$(arr).each(function(i, attach){
			    	//image type
			    	if(attach.fileType){
			            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
			            
			            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
			            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			            str += "<span></span>";
			            str += "<button id='imageGetBtn' type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
			            str += "class='btn btn-inverse-danger btn-icon'><i class='mdi mdi-close'></i></button><br>";
			            str += "<img src='/display?fileName="+fileCallPath+"'>";
			            str += "</div>";
			            str +"</li>";
					}else{
			            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
			            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
			            str += "<span> "+ attach.fileName+"</span><br/>";
			            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
			            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			            str += "<img src='/resources/img/attach.png'></a>";
			            str += "</div>";
			    		str +"</li>";
			    	}
			    });
				$(".uploadResultGet ul").html(str);
				$('#uploadFileGet').attr('disabled', true);
			});
	    	
	    	$('#bookGet').show();
	    	$('#modalstyle2').css('display','');
	    	
	    }
	});

}