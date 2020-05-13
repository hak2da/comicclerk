document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
var createSelectValue = new Array();

$(document).ready(function(){
	$('#modalstyle').css('display','none');
	$('#lossTable').DataTable({ // 페이징 처리, 검색, show entries
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
	    	url : "/loss/lossdata.json",
	    	type : "get",
	    	dataSrc: '',
	    },
	    aoColumns: [
	    	{data: "loss_num"},
	    	{data: "loss_category"},
	    	{data: "loss_qty"},
	    	{data: "loss_pay"},
	    	{data: "loss_product"},
	    	{ data: "loss_date", 
	    		"render": function (data) {
	    			var date = new Date(data); var month = date.getMonth() + 1; 
	    			return  date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate(); } 
	    	},
            {
                mData: "loss_num",
                mRender: function (data, type, row) {
                    return "<button name ='modifyBtn' value=" + data +" class='btn btn-warning' style='color:white;' onclick='javascript:modify(value)'>수정</button>&emsp;<button name ='removeBtn' value=" + data +" type='submit' class='btn btn-secondary' onclick='javascript:remove(value)'>삭제</button>";
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

$('button[name=createBtn]').click(function(){
	console.log('create');
	$('#modalstyle').css('display','');
	$.ajax({
	    type: 'post',
	    url: "/loss/lossCreate",
	    success: function(data) {
	    	$("#loss_createproduct").find("option").remove().end();
	    	
	    	for (var i = 0; i < data.product.length; i++) {
	    		createSelectValue[i] = data.product[i].product_price;
	    		$('#loss_createproduct').append("<option value='"+ data.product[i].product_name +"'>" + data.product[i].product_name + "</option>");
			}
	    	$('#loss_createpay').attr('value', createSelectValue[0]);
	    	$('#myModal').show();
	    }
	});
});

$('#loss_createproduct').change(function(){
	var index = $('#loss_createproduct option').index($('#loss_createproduct option:selected'));
	$('#loss_createpay').attr('value', createSelectValue[index]);
	
});

function remove(loss_num){
	var form = document.createElement("form"); // form을 만듬
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "lossRemove");
	document.body.appendChild(form);

	var hiddenInput = document.createElement("input");
	hiddenInput.setAttribute("type", "hidden");
	hiddenInput.setAttribute("name", "loss_num");
	hiddenInput.setAttribute("value", loss_num);

	form.appendChild(hiddenInput);

	form.submit();
}


function modify(loss_num){
	$.ajax({
	    type: 'get',
	    url: "/loss/lossUpdate?loss_num="+loss_num,
	    success: function(data) {
	    	$("#loss_product").find("option").remove().end();
	    	var pay = 0;
	    	for (var i = 0; i < data.product.length; i++) {
	    		createSelectValue[i] = data.product[i].product_price;
	    		if (data.getModify.loss_product == data.product[i].product_name) {
	    			$('#loss_product').append("<option value='"+ data.product[i].product_name +"' selected>" + data.product[i].product_name + "</option>");
	    			pay = i;
	    		} else {
	    			$('#loss_product').append("<option value='"+ data.product[i].product_name +"'>" + data.product[i].product_name + "</option>");
	    		}
			}
	    	
	    	$('#loss_pay').attr('value', createSelectValue[pay]);
	    }
	});
	
	$.ajax({
	    type: 'get',
	    url: "/loss/lossModify?loss_num="+loss_num,
	    success: function(data) {
	    	var loss_date = data.getModify['loss_date'];
	    	var date = new Date(parseInt(("/Date("+loss_date+")/").match(/\d+/)[0]));
	    	
	    	$('#loss_num').attr('value',data.getModify['loss_num']);
	    	$('#loss_category').attr('value',data.getModify['loss_category']);
	    	$('#loss_qty').attr('value',data.getModify['loss_qty']);
	    	$('#loss_date').attr('value',dateFormat(date));
	    	$('#myModifyModal').show();
	    }
	});
	$('#modalstyle').css('display','');
}

$('#loss_product').change(function(){
	var index = $('#loss_product option').index($('#loss_product option:selected'));
	$('#loss_pay').attr('value', createSelectValue[index]);
	
});


$('#modifyclose').click(function(){
	$('#myModifyModal').hide();
	$('#myModifyModal').find('form')[0].reset();
	$('#modalstyle').css('display','none');
});

	
$('#createclose').click(function(){
	$('#myModal').hide();
	$('#modalstyle').css('display','none');

});


function dateFormat(d) {
	   return d.getFullYear() + "-" + ((d.getMonth() + 1) + "").padStart(2, "0") 
	      + "-" + (d.getDate() + "").padStart(2, "0");
}
