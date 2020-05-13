<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>
<style>
#orderProduct {
	text-align: center;
}

#orderTest {
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="card">
			<div class="card-body">
				<h4>상품주문 화면</h4><hr>
				<button class="btn btn-warning" id="categoryAdd" style="color:#f3f3f3;">카테고리 추가</button>
				<br/><hr>
					<div class="row">
						<c:forEach items="${ OrderViewVO_List }" var="list">
							<div class="col-sm-2" >
									<div style="text-align: center;">
									
										<button name="categoryButton" class="btn btn-outline-secondary"
												style="margin-top:10px;" value="${ list.orderview_category }">
											${ list.orderview_category }</button>
										<div class="btn-group-vertical" role="group" style="margin-top:10px;"
											aria-label="Basic example">
											<div class="btn-group">
												<button type="button"
													class="btn btn-secondary dropdown-toggle"
													data-toggle="dropdown"></button>
												<div class="dropdown-menu" style="background-color: #d6e3ff;">
													<a class="dropdown-item" name="categoryDelete" value="${ list.orderview_num }"
													style="cursor: pointer;">삭제</a> 
													<%-- <a class="dropdown-item" name="categoryUpdate" value="${ list.orderview_num }"
													style="cursor: pointer;">수정</a> --%>
												</div>
											</div>
										
										</div>
									</div>
							</div>
						</c:forEach>
					</div><hr>
			
				<div id="orderProduct"><!-- 등록한 상품이 나타난다. --></div>
				<button class="btn btn-warning" name="productAdd" 
						style="color: #f3f3f3; margin-top:10px;">상품추가</button>
			</div>
		</div>
	</div>
</div>


<!-- hidden form -->
<form id="operForm"></form>

<!-- modal category add-->
<div class="modal" id="ModalcategoryAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="float: right; width: 100px;">&times;</button>
                <h4 class="modal-title" id="myModalLabel">카테고리 추가</h4>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>category</label>
                    <!-- <input class="form-control" name="category"> -->
                    <select class="form-control" name="category">
						<option value="">선   택</option>
                       	<c:forEach items="${productGetList}" var="productGetList">
                       		<option value="${productGetList.product_category}">${productGetList.product_category}</option>
                       	</c:forEach>
                  	</select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cateModalRegisterBtn" type="button" class="btn btn-warning" style="color:white">등록</button>
            </div>
        </div>
    </div>
</div>

<!-- modal category Update-->
<div class="modal" id="ModalcategoryUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">카테고리 수정</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>카테고리</label>
                    <!-- <input class="form-control" name="category"> -->
                    <select class="form-control" name="category">
						<option value="">선   택</option>
                       	<c:forEach items="${productGetList}" var="productGetList">
                       		<option value="${productGetList.product_category}">${productGetList.product_category}</option>
                       	</c:forEach>
                  	</select>
                </div>
            </div>
            <div class="modal-footer">
                <button id="cateModalUpdateBtn" type="button" class="btn btn-warning" style="color:white">수정</button>
            </div>
        </div>
    </div>
</div>

<!-- modal product add-->
<div class="modal" id="modalProductAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="productAddModalCloseBtn">&times;</button>
                <h4 class="modal-title" id="myModalLabel">상품 추가</h4>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>상품</label>
                    <!-- <input class="form-control" name="product"> -->
                    <select class="form-control" name="product" id="productCategoryNameOption">
                    
                  	</select>
                    <label>이미지 파일</label>
                    <form id="uploadForm" method="post" enctype="multipart/form-data">
	                    <input class="form-control" type="file" name="uploadFile">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="productModalRegisterBtn" type="button" class="btn btn-warning" style="color:white">등록</button>
            </div>
        </div>
    </div>
</div>
<!-- modal product update-->
<div class="modal" id="modalProductUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="productUpdateModalCloseBtn">&times;</button>
                <h4 class="modal-title" id="myModalLabel">상품 수정</h4>
            </div>  -->
            <div class="modal-body">
                <div class="form-group">
                    <label>상품</label>
                    <!-- <input class="form-control" name="product"> -->
                    <select class="form-control" name="product" id="productCategoryNameUpdateOption">
                    
                  	</select>
                    <label>이미지 파일</label>
                    <form id="uploadForm" method="post" enctype="multipart/form-data">
	                    <input class="form-control" type="file" name="uploadFile">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="productModalUpdateBtn" type="button" class="btn btn-warning" style="color:white">수정</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/resources/js/userOrderManeger.js?vaer=2"></script>
<script>
    $(document).ready(function () {
        var operForm = $("#operForm"); 
        
        var modalCateAdd = $("#ModalcategoryAdd");
        var modalCateUpdate = $("#ModalcategoryUpdate");
        var modalInputCategory = modalCateAdd.find("select[name='category']");
        var modalInputCategoryUpdate = modalCateUpdate.find("select[name='category']");
        
		var indexNum = 0;
		
        $("#categoryAdd").on("click", function (e) {
        	modalCateAdd.modal("show"); 
        });

        $("#cateModalRegisterBtn").on("click", function (e) {
            if(modalInputCategory.val() == "") {
                alert("카테고리를 선택해주세요.")
                return false;
            }
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategory.val() + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/userOrderManager/categoryAdd");
            operForm.submit();
        });

		$("a[name='categoryUpdate']").on("click", function (e) {	
			modalCateUpdate.modal('show');
			indexNum = $(this).attr('value');
		});
		
		$("#cateModalUpdateBtn").on("click", function (e) {
			if(modalInputCategoryUpdate.val() == "") {
                alert("카테고리를 선택해주세요.")
                return false;
            }
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategoryUpdate.val() + "'>");
        	operForm.append("<input type='hidden' name='number' value='" + indexNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/userOrderManager/categoryUpdate");
            operForm.submit();
        });

		$("a[name='categoryDelete").on("click", function (e) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;

			indexNum = $(this).attr('value');
        	operForm.append("<input type='hidden' name='number' value='" + indexNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/userOrderManager/categoryDelete");
            operForm.submit();
		});

		// 여기부터 상품 등록 ajax
		$("button[name=productAdd]").hide();

		var orderProduct = $("#orderProduct");
		var categoryValue;
		var modalProductAdd = $("#modalProductAdd");
		
		$("button[name='categoryButton']").on("click", function (e) {
			$("button[name='productAdd']").val($(this).attr('value'));
			categoryValue = $(this).attr('value');
			orderProductShow(categoryValue);
		});

		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function orderProductShow(category) {
			$("button[name=productAdd]").show();
			orderProductService.getList(category, function(data) {
				var str = "";
				
				if(data.length == 0 ) {
					str += " ";
					orderProduct.html(str);
					return;
				}
				str += '<div class="row order-list">';
				for(var i = 0, len = data.length || 0; i < len; i++) {
					var fileCallPath =  encodeURIComponent( data[i].ORDERVIEW_UPLOADPATH+ "/"+data[i].ORDERVIEW_UUID +"_"+data[i].ORDERVIEW_FILENAME);
					str += "<div class='col-sm-6 col-md-4 col-lg-3' id='orderTest'>";
					str += "<input type='hidden' id='prodcutCategoryUpdateHidden' value='"+category+"'>";
					str += "<br/>"; 
					str += "<img src='/userOrderManager/display?fileName=" + fileCallPath + "' width='150' height='200'/>";
					str += "<br/>"; 
					str += "" + data[i].PRODUCT_NAME;
					str += "<br/>";
					str += "" + numberWithCommas(data[i].PRODUCT_PRICE)+"<br/><br/>";
					str += "<button class='btn btn-primary btn-sm' onclick=\'productDelete(" + data[i].ORDERVIEW_NUM + ")\'>삭제</button>";
/* 					str += "&emsp;"  */
					/* str += "<button class='btn btn-primary btn-sm' onclick=\'productUpdate(" + data[i].ORDERVIEW_NUM + ")\'>수정</button>"; */
					str += "</div>";
				}
				str += '</div>';

				orderProduct.html(str);
			});
		}

		$("button[name = productAdd]").on("click", function(e){
			var Optionstr = "";
			Optionstr += "<option value=''>선 택</option>";
			$.ajax({
				type: 'get',
			    url: "/userOrderManager/productCategoryName?product_category="+$(this).attr('value'),
			    dataType : "json",
			    async : false,
			    success: function(data){
				    for(var i = 0; i < data.length; i++) {
				    	Optionstr += '<option value="'+data[i].product_name+'">'+data[i].product_name+'</option>';
					}
				}
			});
			$("#productCategoryNameOption").append(Optionstr);
			modalProductAdd.modal("show");
			$("#productAddModalCloseBtn").on("click", function (e) {
				$("#productAddInputUploadFile").val("");
				$("select#productCategoryNameOption option").remove();
			});
		});

		$("#productModalRegisterBtn").on("click", function (e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			console.log(inputFile);
			var files = inputFile[0].files;
			console.log(files.length); 

			if(files.length == 0) {
				
			}
			
			//add filedate to formdata
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
				/* formData.append("productName", $("input[name='product']").val()); */
				formData.append("productName", $("select[name='product']").val());
				formData.append("productCategory", categoryValue);
			} 

			var productJSON = {
				/* productName: $("input[name='product']").val(), */
				productName: $("select[name='product']").val(),
				productCategory: categoryValue
			};


			orderProductService.productCheck(productJSON, function(result) {
				if(result == "NULL") {
					alert("재고에 해당 상품이 없습니다.");
					/* $("input[name='product']").val(''); */
					return;
				}
				
				orderProductService.productAdd(formData, function(result){
					/* $("input[name=product]").val(''); */
					$("#productAddInputUploadFile").val("");
					$("select#productCategoryNameOption option").remove();
					modalProductAdd.modal("hide");
					orderProductShow(categoryValue);
				});
			});
        }); 


		//잠시 보류
        $("#productModalUpdateBtn").on("click", function (e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;

			//add filedate to formdata
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
				/* formData.append("productName", $("input[name='product']").val()); */
				formData.append("productName", $("select[name='product']").val());
				formData.append("productCategory", categoryValue);
			}

			var productJSON = {
				/* productName: $("input[name='product']").val(), */
				productName: $("#productCategoryNameUpdateOption").val(),
				productCategory: categoryValue
			};


			orderProductService.productCheck(productJSON, function(result) {
				if(result == "NULL") {
					alert("재고에 해당 상품이 없습니다.");
					/* $("input[name='product']").val(''); */
					return;
				}
				
				orderProductService.productAdd(formData, function(result){
					/* $("input[name=product]").val(''); */
					modalProductAdd.modal("hide");
					orderProductShow(categoryValue);
					 
				});
			});
        });
		
		var indexProductNum = 0;
		
		$(".productDelete").on("click", function (e) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;

			indexProductNum = $(this).attr('value');
        	operForm.append("<input type='hidden' name='number' value='" + indexProductNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/productDelete");
            operForm.submit();

            orderProductShow(categoryValue);
		});

		window.productDelete = function (number) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;
			var numberJSON = {
				number : number
			};
			orderProductService.productDelete(numberJSON, function(data) {
				console.log(data);
				console.log(categoryValue);
				
				orderProductShow(categoryValue);
			});
		}

/* 		window.productUpdate = function (number) {
			var category = $("#prodcutCategoryUpdateHidden").val();
			var Optionstr = "";
			Optionstr += '<option value="">선 택</option>';
			$.ajax({
				type: 'get',
			    url: "/userOrderManager/productCategoryName?product_category="+category,
			    dataType : "json",
			    async : false,
			    success: function(data){
				    for(var i = 0; i < data.length; i++) {
				    	Optionstr += '<option value="'+data[i].product_name+'">'+data[i].product_name+'</option>';
					}
				}
			});
			$("#productCategoryNameUpdateOption").append(Optionstr);
			$("#modalProductUpdate").modal("show");
			$("#productUpdateModalCloseBtn").on("click", function (e) {
				$("select#productCategoryNameUpdateOption option").remove();
			});
			
		} */
		
		var maxSize = 5242880; // 5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과입니다.");
				return false;
			}
			var ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			if(!(ext == "gif" || ext == "jpg" || ext == "png")){
				alert("이미지 파일만 업로드 가능합니다.");
				return false;
			}
			return true;
		}
    });	
</script>

</html>