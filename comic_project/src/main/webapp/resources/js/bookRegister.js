$(document).ready(function(e){
	  
	  var formObj = $("#registerForm");
	  
	  
	  $("#RegisterSubmitBtn").on("click", function(e){

	    
	    e.preventDefault();
	    
	    console.log("submit clicked");

	    var book_name = $('#book_name_register').val();
		var nameCheck = 0;
		
		$.ajax({
			type : 'POST',
			data : {book_name : book_name},
			async: false,
			url : "/book/bookNameCheck",
			dataType : "json",
			success : function(result) {

				nameCheck = result;

				return;
			}
		});

		if($.trim($("#book_name_register").val()) != $("#book_name_register").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_name_register").val("");
		    $("#book_name_register").focus();
			return false;
		}
		if(nameCheck > 0) {
			alert("이미 있는 책입니다.");
			$("#book_name_register").val("");
		    $("#book_name_register").focus();
		    return false;
		}
		if($.trim($("#book_loc_register").val()) != $("#book_loc_register").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_loc_register").val("");
		    $("#book_loc_register").focus();
		    return false;
		}
		if($.trim($("#book_publisher_register").val()) != $("#book_publisher_register").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_publisher_register").val("");
		    $("#book_publisher_register").focus();
		    return false;
		}
		if($.trim($("#book_writer_register").val()) != $("#book_writer_register").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_writer_register").val("");
		    $("#book_writer_register").focus();
		    return false;
		}
		if($.trim($("#book_category_register").val()) != $("#book_category_register").val()) {
		    alert("앞,뒤 공백을 지워주세요.");
		    $("#book_category_register").val("");
		    $("#book_category_register").focus();
		    return false;
		}
		if($.trim($("#book_lastbook_register").val()) != $("#book_lastbook_register").val()) {
		    alert("마지막권을 입력해주세요.");
		    $("#book_lastbook_register").val("");
		    $("#book_lastbook_register").focus();
		    return false;
		}
		if($('#uploadFileRegister')[0].files[0] == null) {
			alert("이미지를 넣어주세요.")
			$("#uploadFileRegister").focus();
			return false;
		}
	    
	    var str = "";
	    
	    $(".uploadResultRegister ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
	    
	  });
	
	  
	  var regex = new RegExp("(.*?)\.(jpg|png)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      $("#uploadFileRegister").val("");
	      return false;
	    }
	    
	    if(!regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      $("#uploadFileRegister").val("");
	      return false;
	    }
	    return true;
	  }
	  
	  $("#uploadFileRegister").change(function(e){
	
	    var formData = new FormData();
	    
	    var inputFile = $("#uploadFileRegister");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){
	
	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/uploadAjaxAction',
	      processData: false, 
	      contentType: false,
	      data: formData,
	      type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 
	
	      }
	    }); //$.ajax
	   $('#uploadFileRegister').attr('disabled', true);
	  });  
	  
	  function showUploadResult(uploadResultArr){
		    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResultRegister ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
	    	
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +" ><div>";
				str += "<span></span>";
				str += "<button id='imageRemoveBtn' type='button' data-file=\'"+fileCallPath+"\' "
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
	
	  $(".uploadResultRegister").on("click", "button", function(e){
		    
		  console.log("delete file");
	      
		  var targetFile = $(this).data("file");
		  var type = $(this).data("type");
		  var targetLi = $(this).closest("li");
		  console.log(targetFile);
		  console.log(type);
		  console.log(targetLi);
		  $.ajax({
			  url: '/deleteFile',
			  data: {fileName: targetFile, type:type},
			  dataType:'text',
			  type: 'POST',
			  success: function(result){
				  targetLi.remove();
			  }
		  }); //$.ajax
		  $('#uploadFileRegister').attr('disabled', false);
		  $("#uploadFileRegister").val("");
	  });
	  
	  $("#bookRegisterCloseBtn").click(function() {
	      if($("#imageRemoveBtn").data("file") != null) {
			  var targetFile = $("#imageRemoveBtn").data("file");
			  var type = $("#imageRemoveBtn").data("type");
			  var targetLi = $("#imageRemoveBtn").closest("li");
			  console.log(targetFile);
			  console.log(type);
			  console.log(targetLi);
			  $.ajax({
				  url: '/deleteFile',
				  data: {fileName: targetFile, type:type},
				  dataType:'text',
				  type: 'POST',
				  success: function(result){
					  targetLi.remove();
				  }
			  }); //$.ajax
	      }
	      $('#uploadFileRegister').attr('disabled', false);
	      $("#card-body-register").scrollTop(0);
		  $("#uploadFileRegister").val("");
		  $("#bookRegister").find('form')[0].reset();
		  $('#bookRegister').hide();
		  $('#modalstyle2').css('display','none');
	  });
	
});