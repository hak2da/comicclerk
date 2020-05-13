<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>order</h1>

	<div>
		<ul>
			<c:forEach items="${ OrderViewVO_List }" var="list">
				<li><button name="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button></li>
			</c:forEach>
		</ul>
	</div>
	<hr>
	<div class="orderProduct">
		
	</div>
	<hr> 주문목록 <br>
	<table>
		<thead>
			<tr>
				<th>상품명</th>
				<th>금액</th>
				<th>수량</th> <!-- + - 기능추가 삭제기능 -->
				<th>취소</th>
			</tr>
		</thead>
		<tbody id="tableBody">
		</tbody>
	</table>
	<hr>
	<label>총금액</label>
	<input id="finalPrice" readonly>
	<label>총수량</label>
	<input id="orderQty" readonly>
	<button onclick="productAllDelete();">전체취소</button>
	<button id="resultOrder">상품주문</button>
</body>
<script src="/resources/js/order.js?after"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var categoryValue = "";
		var orderProduct = $(".orderProduct");
		
		$("button[name = categoryButton]").on("click", function (e) {
			categoryValue = $(this).attr('value');
			orderProductShow(categoryValue);
		});

		function orderProductShow(category) {
			orderProductService.getList(category, function(data) {
				var str = "";
				
				if(data.length == 0 ) {
					str += " ";
					orderProduct.html(str);
					return;
				}
				str += "<ul>"; 
				for(var i = 0, len = data.length || 0; i < len; i++) {
					str += "<li>";
					str += "<button onclick='userProductBtn(" + data[i].PRODUCT_NUM + ",\"" + data[i].PRODUCT_NAME + "\"," +data[i].PRODUCT_PRICE + ");'>";
					str += "" + data[i].PRODUCT_NAME + " | 가격: " + data[i].PRODUCT_PRICE;
					str += "</button>";
					str += "</li>";
				}
				str += "</ul>";

				orderProduct.html(str); 
			});
		}

		var orderArray = {};
		var qty = 0;
		var index = 0;
		var tableBody = $("#tableBody");
		var finalPrice = $("#finalPrice");
		var orderQty = $("#orderQty");

		window.userProductBtn = function(productNum, productName, productPrice) {
			for(key in orderArray) {
				if(orderArray[key].productNum == productNum) {
					orderArray[key].qty = (orderArray[key].qty + 1);
					orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
					console.log(orderArray);
					showUserProduct();
					return;
				}
			}
			orderArray[index] = {productNum: productNum, qty : 1, productName : productName, productPrice : productPrice, finalPrice: productPrice};
			index += 1;
			console.log(orderArray);
			showUserProduct();
			
		};

		window.productAdd = function(key) {
			orderArray[key].qty = (orderArray[key].qty + 1);
			orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
			showUserProduct();
		}

		window.productSub = function(key) {
			orderArray[key].qty = (orderArray[key].qty - 1);
			orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
			if(orderArray[key].qty <= 0) {
				delete orderArray[key];
			}
			console.log(orderArray);
			showUserProduct();
		}
 
		function showUserProduct(){
			var finalPriceSum = 0;
			var qtySum = 0;
			str = "";

			for(key in orderArray) {
				finalPriceSum += orderArray[key].finalPrice;
				qtySum += orderArray[key].qty;
				str += "<tr>"
				str += "<td>" + orderArray[key].productName + "</td>";
				str += "<td>" + orderArray[key].finalPrice + "</td>";
				str += "<td>" + orderArray[key].qty + "</td>";
				str += "<td>[ <a href='#' onclick='productAdd(" + key + ");'>+</a> , ";
				str += "<a href='#' onclick='productSub(" + key + ");'>-</a> ] </td>";
				str += "</tr>";
			}
			finalPrice.val(finalPriceSum);
			orderQty.val(qtySum)
			tableBody.html(str); 	
		}

		window.productAllDelete = function(){
			for(key in orderArray) {
				delete orderArray[key];
			}
			showUserProduct()
		}

		$("#resultOrder").on("click", function(){
			console.log(orderArray);
			orderProductService.resultOrder(orderArray, function(e) {
				productAllDelete();
			}); 
		}); 
	});
</script>
</html>