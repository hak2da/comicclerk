$(document).ready(function(){
	$('#abcde').css('display', "none");
	
	$('#modalstyle').css('display','none');
	$('#productTable').DataTable({ // 페이징 처리, 검색, show entries
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
	    	url : "/product/productData.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "product_num"},
	    	{data: "product_name"},
	    	{data: "product_price"},
	    	{data: "product_qty"},
	    	{data: "product_category"},
            {
                mData: "product_num",
                mRender: function (data, type, row) {
                    return "<button name ='getBtn' value=" + data +" type='button' class='btn btn-warning' style='color:white;'onclick='javascript:productModify(value)'>수정</button> " +
                    	   "&emsp;<button name ='removeBtn' value=" + data +" type='submit' class='btn btn-secondary' onclick='javascript:productRemove(value)'>삭제</button>";
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
	
	$('#orderBtn').click(function() {
		self.location = "/productOrder/productOrderList";
	});
	
});

function productRemove(product_num){
	
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}
	
	var form = document.createElement("form"); // form을 만듬
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "productRemove");
	document.body.appendChild(form);

	var hiddenInput = document.createElement("input");
	hiddenInput.setAttribute("type", "hidden");
	hiddenInput.setAttribute("name", "product_num");
	hiddenInput.setAttribute("value", product_num);

	form.appendChild(hiddenInput);

	form.submit();
}

function productModify(product_num) {
    	
    	$.ajax({
    	    type: 'get',
    	    url: "/product/productGet?product_num="+product_num,
    	    dataType : "json",
    	    success: function(data) {
	    	    
    	    	$('#product_num_modify').attr('value',data.product_num);
    	    	$('#product_name_modify').attr('value',data.product_name);
    	    	$('#product_price_modify').attr('value',data.product_price);
    	    	$('#product_qty_modify').attr('value',data.product_qty);
    	    	$('#product_category_modify').attr('value',data.product_category);
    	    	$('#productGet').show();
    	    	$('#modalstyle').css('display','');
    	    	
    	    }
    	});
	
}