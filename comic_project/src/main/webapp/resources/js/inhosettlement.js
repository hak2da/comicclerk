$(document).ready(function() {
	$('#modalstyle').css('display','none');
});
$('#btn1').click(function() { 
		var list = new Array();		
		$("input[name=curqty]").each(function(index, item) {  // 반복문
			list.push(item.value);
		});
		var sendData = {
			'list' : list
		};
		console.log(list);
		$.ajax({
			url : '/settlement/settlementlist',
			dataType : 'json',
			data : JSON.stringify(sendData),
			contentType : "application/json; charset=utf-8;",
			type : 'POST',
			success : function(data) {
				for (var i = 0; i < list.length; i++) {
					$('#' + 'a' + i.toString()).html(data[i]);
					if (data[i] > 0) {
						$('#' + 'a' + i.toString()).css("color", "blue");
					} else if (data[i] < 0) {
						$('#' + 'a' + i.toString()).css("color", "red");
					} else {
						$('#' + 'a' + i.toString()).css("color", "black");
					}
				}
			},
			error : function(data) {
				console.log("실패");
			}
		});
	});

	$('#btn2').click(function() {
		var list = new Array();
		$("input[name=curqty]").each(function(index, item) {
			if (item.value == "") { // 공백일 경우 현재 값을 list에 저장
				list.push($('#'+'product_qty'+index).val())
			} else {
				list.push(item.value);
			} 
			
		});
		console.log(list);
		for (var i = 0; i < list.length; i++) {
			$('#' + 'b' + i.toString()).html(list[i]);
		}
		$('#myModal').show();
		$('#modalstyle').css('display','');
	});

	function modify_product() {
		var numList = new Array();
		var productList = new Array();
		$("input[name=productNum]").each(function(index, item) {
			numList.push($(item).val());
		});

		$("input[name=curqty]").each(function(index, item) {
			productList.push($(item).val());
		});


		var form = document.createElement("form"); // form을 만듬
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "modify");
		document.body.appendChild(form);

		var hiddenInput = document.createElement("input");
		hiddenInput.setAttribute("type", "hidden");
		hiddenInput.setAttribute("name", "numList");
		hiddenInput.setAttribute("value", numList);

		var hiddenInput2 = document.createElement("input");
		hiddenInput2.setAttribute("type", "hidden");
		hiddenInput2.setAttribute("name", "productList");
		hiddenInput2.setAttribute("value", productList);
		form.appendChild(hiddenInput);
		form.appendChild(hiddenInput2);

		form.submit();

		$('#myModal').hide();
	}
	
	$('#modalclose').click(function(){
    	$('#myModal').hide();
    	$('#modalstyle').css('display','none');
    });