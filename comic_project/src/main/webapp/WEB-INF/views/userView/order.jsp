<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/userHeader.jsp"%>

<style type="text/css">

.content-wrapper {
   padding-top: 30px;
}

.btn {
   margin: 10px;
}

.orderProduct {
   text-align: center;
}

.container{
border:3px solid #F0C03D;

}

#orderTest {
   padding-top: 10px;
   padding-bottom: 10px;
   text-align: center;
}

h2 {
   padding-top: 15px;
   color: black;
}

table {
   width: 100%;
   border-top: 1px solid #f4e362;
   border-collapse: collapse;
}

th, td {
   border-bottom: #C49F7B;
   padding: 10px;
   text-align: center;
}

th {
   background-color: #F0C03D;
}

td {
   
}
</style>
<body>

   <!-- Header -->
   <div class="main-penal">
      <div class="content-wrapper">
         <div style="background-color: #37363a; height: 150px;">
            <img src="/resources/images/comic_image.png" alt=""
               style="width: 200px; height: 100px; margin-left: 600px; margin-top: 20px; float: left" />
            <div class="content-section-heading text-center" style="width: 500px; height: 100px; margin-top: 30px; float: left; ">
               <br/><h1 style="color: white;">${ roomNum }번방</h1>
            </div><br/><br/>
         </div>
         
         <div style="margin:10px 150px 0 0; width:200x; text-align: center;">
         <h2 class=".h2"><a href="javascript:home()">홈</a> > 상품주문</h2>
         </div>
         <div style="float: left; margin-top:45px;">
            <div style="background-color: #dadfe4; width: 600px; margin-left:250px;">
                  
               <span> <c:forEach items="${ OrderViewVO_List }" var="list">
                     <button class="btn btn-secondary btn-rounded btn-fw"
                        name="categoryButton" value="${ list.orderview_category }">${ list.orderview_category }</button>
                  </c:forEach>
               </span>      
            </div>
               
            <div class="orderProduct" style="border:3px solid #dadfe4; margin-left:250px;">
               <!-- 사이다 등 상세제품이 나온다. -->
            </div>
         
         </div>

         <div class="container" style="float: right; width: 800px; margin: 45px 200px 0 0;">
            <div class="row">
               <div class="col-md-12"  style="text-align: center;"><br/>
                  <h2>주문목록</h2><br/>
                  <table style="width:700px; margin-left:30px;">
                     <thead>
                        <tr>
                           <th style="width: 40%;">상품명</th>
                           <th style="width: 20%;">금액</th>
                           <th style="width: 10%;">수량</th>
                           <th style="width: 30%;">취소</th>
                        </tr>
                     </thead>
                     <tbody id="tableBody">
                     <!-- 클릭한 제품의 상세보기가 생긴다. -->
                     </tbody>
                  </table>
               </div><br/><hr/>
               
               <div class="col-md-12" style="margin-top:50px;">
                  <div style="width:420px; height:200px; margin:20px 0 0 170px;">
                        <div style="float: left;">
                        <h4 style="color:black; font-weight: 600;">&nbsp;총수량</h4>
                        <input id="orderQty" class="form form-control" style="width:200px;" readonly></div>
                        <div style="float: right">
                        <h4 style="color:black; font-weight: 600;">&nbsp;총금액</h4>
                        <input id="finalPrice" class="form form-control" style="width:200px;" readonly></div>
                        
                        <br/><br/><br/><br/><br/>
                        <button class="btn btn-md btn-block btn-secondary" id="resultOrder" 
                              style="margin: 0 100px 0 0;">상품주문</button>
                        <button class="btn btn-md btn-block btn-secondary" onclick="productAllDelete();"
                              style="margin: 10px 100px 0 0;">전체취소</button>
                        
                  </div>
               </div>
            </div>
         </div>
      
      </div>
      <!-- hidden form -->
      <form id="operForm"></form>

      <div class="modal" id="successModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" style="text-align: center;">
                  <h4 class="modal-title" id="myModalLabel">주문이 완료되었습니다.</h4><hr>                  
                  <button type="button" id="OK" class="btn btn-primary">확인</button>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
<script src="/resources/js/userOrderManeger.js?after"></script>
<script src="/resources/js/orderWebsocket.js"></script>  
<script type="text/javascript">
   var roomNum = "<c:out value='${roomNum}'/>";
   var memberid = "<c:out value='${memberid}' />";  
   
   function home(){
      var operForm = $("#operForm");
   
      operForm.append("<input type='hidden' name='roomNum' value='" + roomNum + "'>");
      operForm.attr("method", "post");
      operForm.attr("action","/userView/main");
      operForm.submit();
   }
   $(document)
         .ready(
               function() {
                  var categoryValue = "";
                  var orderProduct = $(".orderProduct");

                  $("button[name = categoryButton]").on("click",
                        function(e) {
                           categoryValue = $(this).attr('value');
                           orderProductShow(categoryValue);
                        });

                  function numberWithCommas(x) {
                     return x.toString().replace(
                           /\B(?=(\d{3})+(?!\d))/g, ",");
                  }

                  //상품 카테고리
                  function orderProductShow(category) {
                     orderProductService
                           .getList(
                                 category,
                                 function(data) {
                                    var str = "";

                                    if (data.length == 0) {
                                       str += " ";
                                       orderProduct.html(str);
                                       return;
                                    }
                                    str += '<div class="row order-list" style="width:600px;">';
                                    for (var i = 0, len = data.length || 0; i < len; i++) {
                                       var fileCallPath = encodeURIComponent(data[i].ORDERVIEW_UPLOADPATH
                                             + "/"
                                             + data[i].ORDERVIEW_UUID
                                             + "_"
                                             + data[i].ORDERVIEW_FILENAME);
                                       str += "<div class='col-lg-4' id='orderTest'>";
                                       str += "<br/>";
                                       str += "<img onclick='userProductBtn("
                                             + data[i].PRODUCT_NUM
                                             + ",\""
                                             + data[i].PRODUCT_NAME
                                             + "\","
                                             + data[i].PRODUCT_PRICE
                                             + ");' src='/userOrderManager/display?fileName="
                                             + fileCallPath
                                             + "' width='150' height='200'/>";
                                       str += "<br/>";
                                       str += ""
                                             + data[i].PRODUCT_NAME;
                                       str += "<br/>";
                                       str += ""
                                             + numberWithCommas(data[i].PRODUCT_PRICE);
                                       str += "</div>";
                                    }
                                    str += "</div>";

                                    orderProduct.html(str);
                                 });
                  }

                  var orderArray = {};
                  var qty = 0;
                  var index = 0;
                  var tableBody = $("#tableBody");
                  var finalPrice = $("#finalPrice");
                  var orderQty = $("#orderQty");

                  window.userProductBtn = function(productNum,
                        productName, productPrice) {
                     for (key in orderArray) {
                        if (orderArray[key].productNum == productNum) {
                           orderArray[key].qty = (orderArray[key].qty + 1);
                           orderArray[key].finalPrice = (orderArray[key].qty * orderArray[key].productPrice);
                           console.log(orderArray);
                           showUserProduct();
                           return;
                        }
                     }
                     orderArray[index] = {
                        productNum : productNum,
                        qty : 1,
                        productName : productName,
                        productPrice : productPrice,
                        finalPrice : productPrice
                     };
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
                     if (orderArray[key].qty <= 0) {
                        delete orderArray[key];
                     }
                     console.log(orderArray);
                     showUserProduct();
                  }

                  //주문목록
                  function showUserProduct() {
                     var finalPriceSum = 0;
                     var qtySum = 0;
                     str = "";

                     for (key in orderArray) {
                        finalPriceSum += orderArray[key].finalPrice;
                        qtySum += orderArray[key].qty;
                        str += "<tr style='border:1px solid #dadfe4'>"
                        str += "<td>" + orderArray[key].productName
                              + "</td>";
                        str += "<td>" + orderArray[key].finalPrice
                              + "</td>";
                        str += "<td>" + orderArray[key].qty + "</td>";
                        str += "<td><a href='#' onclick='productAdd("
                              + key + ");'><button class='btn btn-sm btn-outline-dark' style='width:50px;'>+</button></a>  ";
                        str += "<a href='#' onclick='productSub(" + key
                              + ");'><button class='btn btn-sm btn-outline-dark' style='width:50px;'>-</button></a></td>";
                        str += "</tr>";
                     }
                     finalPrice.val(finalPriceSum);
                     orderQty.val(qtySum)
                     tableBody.html(str);
                  }

                  window.productAllDelete = function() {
                     for (key in orderArray) {
                        delete orderArray[key];
                     }
                     showUserProduct()
                  }

                  $("#resultOrder").on("click", function() {
              	    console.log(orderArray);
              	    if($("#orderQty").val() == "") {
              		      alert("상품이 없습니다.");
              		      return false;
              		}
              	    orderProductService.resultOrder(orderArray, function(e) {
              	       productAllDelete();
              	       $("#successModal").modal("show");
              	       socket.send(roomNum + ",주문," + memberid);
              	    });
              	   });  

                  $("#OK").on("click", function() {
                     $("#successModal").modal("hide");
                  });   
               });
</script>
</html>