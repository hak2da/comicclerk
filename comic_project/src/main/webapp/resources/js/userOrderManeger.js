 var orderProductService = (function() {
	function getList(category, callback, error) {
		$.getJSON("/userOrderManager/productRead/" + category + ".json", function(data) {
			if (callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function productCheck(productJSON, callback, err) {
		console.log(productJSON);
		$.ajax({
			type : 'post',
			url : '/userOrderManager/productCheck',
			data : JSON.stringify(productJSON),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function productDelete(number, callback, err) {
		$.ajax({
			type : 'post',
			url : '/userOrderManager/productDelete',
			data : JSON.stringify(number),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (callback) {
					callback(data);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function resultOrder(orderArray, callback, err) {
		$.ajax({
			type : 'post',
			url : '/userOrderManager/resultOrder',
			data : JSON.stringify(orderArray),
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if (callback) {
					callback(data);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function productAdd(formData, callback, err) {
		$.ajax({
			url: "/userOrderManager/productAdd",
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(data) {
				if (callback) { 
					callback(data);
				}
			}, 
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
	}
	
	return {
		getList : getList,
		productCheck : productCheck,
		productAdd : productAdd,
		productDelete : productDelete,
		resultOrder : resultOrder
	};
})();