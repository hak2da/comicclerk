$(document).ready(function() {
	var num = 1;
	$(".uploadResultGet").on("click", "button", function(e){
	    
	    console.log("delete file");
	      
	    if(confirm("삭제 하시겠습니까?")){
	    	$('#uploadFileGet').attr('disabled', false);
	    	$("#uploadFileGet").val("");
	    	var targetLi = $(this).closest("li");
	    	targetLi.remove();
	    	num = 0;
	    }
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	  
	function checkExtensionGet(fileName, fileSize){
	    
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			$("#uploadFileGet").val("");
			return false;
	    }
	    
	    if(regex.test(fileName)){
	    	alert("해당 종류의 파일은 업로드할 수 없습니다.");
	    	$("#uploadFileGet").val("");
	    	return false;
	    }
	    return true;
	}
	  
	$("#uploadFileGet").change(function(e){
		num = 1;
		var formData = new FormData();
	    
	    var inputFile = $("#uploadFileGet");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	    	if(!checkExtensionGet(files[i].name, files[i].size) ){
	    		return false;
	    	}
	    	formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/uploadAjaxAction',
	      processData: false, 
	      contentType: false,data: 
	      formData,type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResultGet(result); //업로드 결과 처리 함수 
	      }
	    }); //$.ajax
	    $('#uploadFileGet').attr('disabled', true);
	  });
	
	function showUploadResultGet(uploadResultArr){
	    
	  	if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResultGet ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
			
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span></span>";
				str += "<button id='imageGetBtn' type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-inverse-danger btn-icon'><i class='mdi mdi-close'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +"</li>";
			}

	    });
	    
		uploadUL.append(str);
	}
	
	var formObj = $("#getForm");

	$('#getSubmitBtn').on("click", function(e){
		var nameCheck = 0;
		
		$.ajax({
			type : 'POST',
			data : {book_name : $('#book_name_get').val()},
			async: false,
			url : "/book/bookNameCheck",
			dataType : "json",
			success : function(result) {

				nameCheck = result;

				return;
			}
		});
	    
		e.preventDefault(); 
	        
	    console.log("submit clicked");
	        
	    var str = "";
	        
	    $(".uploadResultGet ul li").each(function(i, obj){
	          
	    	var jobj = $(obj);
	          
	        console.dir(jobj);
	        console.log(i+"=========================");
	        str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
		});
	    if($("#book_name_hidden").val() != $("#book_name_get").val()) {
	    	if($.trim($("#book_name_get").val()) != $("#book_name_get").val()) {
			    alert("앞,뒤 공백을 지워주세요.");
			    $("#book_name_get").val("");
			    $("#book_name_get").focus();
				return false;
			}
			if(nameCheck > 0) {
				alert("이미 있는 책입니다.");
				$("#book_name_get").val("");
			    $("#book_name_get").focus();
			    return false;
			}
	    }
	    if($.trim($("#book_loc_get").val()) != $("#book_loc_get").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_loc_get").val("");
		      $("#book_loc_get").focus();
		      return false;
		}
		if($.trim($("#book_publisher_get").val()) != $("#book_publisher_get").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_publisher_get").val("");
		      $("#book_publisher_get").focus();
		      return false;
		}
		if($.trim($("#book_writer_get").val()) != $("#book_writer_get").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_writer_get").val("");
		      $("#book_writer_get").focus();
		      return false;
		}
		if($.trim($("#book_category_get").val()) != $("#book_category_get").val()) {
		      alert("앞,뒤 공백을 지워주세요.");
		      $("#book_category_get").val("");
		      $("#book_category_get").focus();
		      return false;
		}
		if(num == 0) {
			alert("이미지를 넣어주세요.")
			$("#uploadFileGet").focus();
			return false;
		}
	        
	    formObj.append(str).submit();
        
	});
	
	$('#bookGetBtn').click(function() {
		$("#card-body-get").scrollTop(0);
		$("#bookGet").find('form')[0].reset();
		$('#bookGet').hide();
		$('#modalstyle2').css('display','none');
	});
	
});