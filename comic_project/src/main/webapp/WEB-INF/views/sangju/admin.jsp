<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/sidebar.jsp"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12">
				<h1>Admin</h1>
				상품주문 뷰 CRUD
				<hr>
			</div>
			<div class="col-md-6 grid-margin">
				<ul>
					<c:forEach items="${ OrderViewVO_List }" var="list">
						<li><button class="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button>
							<a href="#" class="categoryUpdate"
							value="${ list.orderview_num }">[수정]</a> <a href="#"
							class="categoryDelete" value="${ list.orderview_num }">[삭제]</a></li>
					</c:forEach>
				</ul>
				<button id="categoryAdd">categoryAdd</button>
			</div>
			<div class="col-md-6 grid-margin">
				<ul class="orderProduct"></ul>
				<button name="productAdd">productAdd</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				실시간 주문 들어오는 곳
				<hr>
				
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
                <h4 class="modal-title" id="myModalLabel">category Add</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>category</label>
                    <input class="form-control" name="category">
                </div>
            </div>
            <div class="modal-footer">
                <button id="cateModalRegisterBtn" type="button" class="btn btn-primary">Resgister</button>
            </div>
        </div>
    </div>
</div>

<!-- modal category Update-->
<div class="modal" id="ModalcategoryUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">category Update</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>category</label>
                    <input class="form-control" name="category">
                </div>
            </div>
            <div class="modal-footer">
                <button id="cateModalUpdateBtn" type="button" class="btn btn-primary">Update</button>
            </div>
        </div>
    </div>
</div>

<!-- modal product add-->
<div class="modal" id="modalProductAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">product Add</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>product</label>
                    <input class="form-control" name="product">
                    <label>image file</label>
                    <form id="uploadForm" method="post" enctype="multipart/form-data">
	                    <input class="form-control" type="file" name="uploadFile">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="productModalRegisterBtn" type="button" class="btn btn-primary">Resgister</button>
            </div>
        </div>
    </div>
</div>
<!-- modal product update-->
<div class="modal" id="modalProductUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">product Update</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div> 
            <div class="modal-body">
                <div class="form-group">
                    <label>product</label>
                    <input class="form-control" name="product">
                    <label>image file</label>
                    <form id="uploadForm" method="post" enctype="multipart/form-data">
	                    <input class="form-control" type="file" name="uploadFile">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button id="productModalRegisterBtn" type="button" class="btn btn-primary">Resgister</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/resources/js/order.js?after"></script>
<script>
    $(document).ready(function () {
        var operForm = $("#operForm"); 
        
        var modalCateAdd = $("#ModalcategoryAdd");
        var modalCateUpdate = $("#ModalcategoryUpdate");
        var modalInputCategory = modalCateAdd.find("input[name='category']");
        var modalInputCategoryUpdate = modalCateUpdate.find("input[name='category']");
        
		var indexNum = 0;
		
        $("#categoryAdd").on("click", function (e) {
        	modalCateAdd.modal("show"); 
        });

        $("#cateModalRegisterBtn").on("click", function (e) {
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategory.val() + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryAdd");
            operForm.submit();
        });

		$(".categoryUpdate").on("click", function (e) {
			modalCateUpdate.modal('show');
			indexNum = $(this).attr('value');
				
		});
		
		$("#cateModalUpdateBtn").on("click", function (e) {
        	operForm.append("<input type='hidden' name='category' value='" + modalInputCategoryUpdate.val() + "'>");
        	operForm.append("<input type='hidden' name='number' value='" + indexNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryUpdate");
            operForm.submit();
        });

		$(".categoryDelete").on("click", function (e) {
			if(confirm("정말 삭제하시겠습니까?") == false) return;

			indexNum = $(this).attr('value');
        	operForm.append("<input type='hidden' name='number' value='" + indexNum + "'>");
            operForm.attr("method", 'post');
            operForm.attr("action", "/sangju/admin/categoryDelete");
            operForm.submit();
		});

		// 여기부터 상품 등록 ajax
		$("button[name=productAdd]").hide();

		var orderProduct = $(".orderProduct");
		var categoryValue;
		var modalProductAdd = $("#modalProductAdd");
		
		$(".categoryButton").on("click", function (e) {
			categoryValue = $(this).attr('value');
			orderProductShow(categoryValue);
		});

		function orderProductShow(category) {
			$("button[name=productAdd]").show();
			orderProductService.getList(category, function(data) {
				var str = "";
				
				if(data.length == 0 ) {
					str += " ";
					orderProduct.html(str);
					return;
				}

				for(var i = 0, len = data.length || 0; i < len; i++) {
					str += "<li>";
					str += "이름: " + data[i].PRODUCT_NAME + " / 가격: " +data[i].PRODUCT_PRICE;
					str += "<a href='#' onclick=\'productDelete(" + data[i].ORDERVIEW_NUM + ")\'>[delete]</a>";
					str += "<a href='#' onclick=\'productUpdate(" + data[i].ORDERVIEW_NUM + ")\'>[update]</a>";
					str += "<img src='" + data[i].ORDERVIEW_UPLOADPATH + "\\" + data[i].ORDERVIEW_UUID + "_" + data[i].ORDERVIEW_FILENAME +"'/>";
					str += "</li>";
				}

				orderProduct.html(str);
			});
		}

		$("button[name = productAdd]").on("click", function(e){
			modalProductAdd.modal("show");
		});

		$("#productModalRegisterBtn").on("click", function (e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;

			//add filedate to formdata
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
				formData.append("productName", $("input[name='product']").val());
				formData.append("productCategory", categoryValue);
			}

			var productJSON = {
				productName: $("input[name='product']").val(),
				productCategory: categoryValue
			};


			orderProductService.productCheck(productJSON, function(result) {
				if(result == "NULL") {
					alert("재고에 해당 상품이 없습니다.");
					$("input[name='product']").val('');
					return;
				}
				
				orderProductService.productAdd(formData, function(result){
					$("input[name=product]").val('');
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

		window.productUpdate = function (number) {
			modalProductAdd.modal("show");
			
		}
		
		var maxSize = 5242880; // 5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과입니다.");
				return false;
			}
			var ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			if(!(ext == "git" || ext == "jpg" || ext == "png")){
				alert("이미지 파일만 업로드 가능합니다.");
				return false;
			}
			return true;
		}
    });	
</script>

</html>