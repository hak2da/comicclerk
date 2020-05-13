function salesMonthTableinit() {
	$('#salesMonthTable').DataTable(
		{ // 페이징 처리, 검색, show entries
			pageLength : 10, //처음 페이지에 처리 개수
			bPaginate : true, // 페이징 기능
			bLengthChange : true,
			lengthMenu : [ [ 10, 20, 30, -1 ],
					[ 10, 20, 30, "All" ] ], //show entries
			bAutoWidth : false,
			processing : true,
			ordering : true,
			serverSide : false,
			searching : true, // 검색 기능
			bStateSave : true,
			"iDisplayLength" : 10,
			"columnDefs" : [ {
				targets : 'no-sort',
				orderable : false
			} ],
			ajax : {
				url : "/salesstatistics/salesMonthdata.json",
				type : "get",
				dataSrc : '',
			},
			"language": {
			      search: "Search :"
			},
			aoColumns : [
					{
						data : "salestime"
					},
					{
						data : "productsales_order_price"
					},
					{
						data : "roomsales_totalprice"
					},
					{
						data : "loss_pay"
					},
					{
						mRender : function(data, type, row) {
							data = row['productsales_order_price']
									+ row['roomsales_totalprice']
									+ row['loss_pay']
							return data;
						}
					} ],
			order : [ [ 0, 'desc' ] ]
		});
}


function salesTableinit() {
		$('#salesTable').DataTable(
			{ // 페이징 처리, 검색, show entries
				pageLength : 10, //처음 페이지에 처리 개수
				bPaginate : true, // 페이징 기능
				bLengthChange : true,
				lengthMenu : [ [ 10, 20, 30, -1 ],
						[ 10, 20, 30, "All" ] ], //show entries
				bAutoWidth : false,
				processing : true,
				ordering : true,
				serverSide : false,
				searching : true, // 검색 기능
				bStateSave : true,
				"iDisplayLength" : 10,
				"columnDefs" : [ {
					targets : 'no-sort',
					orderable : false
				} ],
				ajax : {
					url : "/salesstatistics/salesdata.json",
					type : "get",
					dataSrc : '',
				},
				"language": {
				      search: "Search :"
				},
				aoColumns : [
						{
							data : "salestime"
						},
						{
							data : "productsales_order_price"
						},
						{
							data : "roomsales_totalprice"
						},
						{
							data : "loss_pay"
						},
						{
							mRender : function(data, type, row) {
								data = row['productsales_order_price']
										+ row['roomsales_totalprice']
										+ row['loss_pay']
								return data;
							}
						} ],
				order : [ [ 0, 'desc' ] ]
			});
	}
	
	
	function salesSearchTableinit(){
		$('#salesSearchTable').DataTable(
			{ // 페이징 처리, 검색, show entries
				pageLength : 10, //처음 페이지에 처리 개수
				bPaginate : true, // 페이징 기능
				bLengthChange : true,
				lengthMenu : [ [ 10, 20, 30, -1 ],
						[ 10, 20, 30, "All" ] ], //show entries
				bAutoWidth : false,
				processing : true,
				ordering : true,
				serverSide : false,
				searching : false, // 검색 기능
				bStateSave : true,
				"iDisplayLength" : 10,
				ajax: {
					url : "/salesstatistics/salesSearchdata.json",
					type : "get",
					dataSrc : '',
				},
				aoColumns : [
					{ data: "roomsales_time", 
			    		"render": function (data) {
			    			var date = new Date(data); var month = date.getMonth() + 1; 
			    			return  date.getFullYear() + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds(); } 
				    },
					{
						data : "roomsales_id"
					},
					{
						data : "roomsales_num"
					},
					{
						data : "roomsales_totalprice"
					},
					{
						data : "productsales_order_price"
					},
					{
						mRender : function(data, type, row) {
							data = row['productsales_order_price'] + row['roomsales_totalprice']
							return data;
						}
					}
				],
				"columnDefs" : [ {
					targets : 'no-sort',
					orderable : false
				} ],
				
				order : [ [ 0, 'desc' ] ]
			});
	}
	
	function salesSearchTableReset() {
		$('#salesSearchTable').DataTable().clear().draw();
	}
	
	function salesSearchTableData(data) {
		$('#salesSearchTable').DataTable().rows.add(data).draw();
	}
	
	$('select[name=type]').change(function(){
		if ($(this).val() == 'date') {
		    $( "#datepicker").datepicker({
		    	dateFormat: 'yy-mm-dd',
	    		prevText: '이전 달',
	    	    nextText: '다음 달',
	    	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	    dayNames: ['일','월','화','수','목','금','토'],
	    	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    	    showMonthAfterYear: true,
	    	    changeMonth: true,
	    	    changeYear: true,
	    	    yearSuffix: '년',
	    	    onSelect: function (date) {
	    			var endDate = $('#datepicker2');
	    			var startDate = $(this).datepicker('getDate');
	    			var minDate = $(this).datepicker('getDate');
	    			endDate.datepicker('setDate', minDate);
	    			startDate.setDate(startDate.getDate() + 30); // 한달이 최대
	    			endDate.datepicker('option', 'maxDate', startDate);
	    			endDate.datepicker('option', 'minDate', minDate);
	    	    }
		    });
		    $('#inputSpan').append("~ <input type='text' name='keyword' class='form-control' id='datepicker2' >");
		    $( "#datepicker2").datepicker({
		    	dateFormat: 'yy-mm-dd',
	    		prevText: '이전 달',
	    	    nextText: '다음 달',
	    	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	    dayNames: ['일','월','화','수','목','금','토'],
	    	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    	    showMonthAfterYear: true,
	    	    changeMonth: true,
	    	    changeYear: true,
	    	    yearSuffix: '년'
		    });
		} else {
			 $('#inputSpan').empty();
			 $( "#datepicker").datepicker("destroy");
			 $( "#datepicker2").datepicker("destroy");
			 $( "#datepicker").val('');
		}
	});
	
	
	$('#salesSearchBtn').click(function(){
		var type = $('select[name=type]').val();      // option value 값
		var keyword = $('input[name=keyword]').val(); // input text 값
		
		
		if (type != 'date') {
			$.ajax({
				type: 'get',
			    url: "/salesstatistics/searchsales.json?type="+type+"&keyword="+keyword,
			    success: function(data) {
			    	salesSearchTableReset();
			    	salesSearchTableData(data);
			    }
			});
		} else { // 날짜 별 검색 시 !
			var start = $( "#datepicker").val();
			var end = $( "#datepicker2").val();
			
			$.ajax({
				type: 'get',
			    url: "/salesstatistics/searchsalesDate.json?start="+start+"&end="+end,
			    success: function(data) {
			    	salesSearchTableReset();
			    	salesSearchTableData(data);
			    }
			});
		}
	});
	
	$('input[name=keyword]').keypress(function(event){
		if (event.which == 13) {/* enter키 코드 13번 */
			$('#salesSearchBtn').click();
			return false;
		}	
	});