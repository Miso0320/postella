<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
		<title>Insert title here</title>
		
				<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<script>
			function fun1() {
				$.ajax({
					url: "cart_content.jsp",
					method: "get",
					success: function(data) {
						console.log(data);
						let html = "";
						  data.forEach((item,index) => {
							   if(index == 0) {
								  html += '<table id="myTable">';
							  }						 
		  							  
							  html += '<tr class="table">';
							  html += '  <td>';
							  html += '  	<input type="checkbox" name="checkBox" class="checkBox" >';
							  html += '  </td>';
							  html += '  <td class="cart-item-img">';
							  html += '  	<a href="#">';
							  html += '  		<img src="img/cart/' + item.img + '" width="78" height="78">';
							  html += '  	</a>';
							  html += '  </td>';
							  html += '  <td>';
							  html += '  	<div class="cart-product-name">';
							  html += '  		<a href="">' + item.title + '</a>';
							  html += '  	</div>';
							  html += '  	<div class="cart-product-option">';
							  html += '  		<div class="cart-product-option-info1">';	
							  html += '  		</div>';
							  html += '  		<span class="cart-product-option-info1-2">(밤 12시 전 주문 시)</span>;'
							  html += '  		<div class="cart-product-option-price">';
							  html += '  			<span></span>';
							  html += '  			<span></span>';
							  html += '  			<span></span>';
							  html += '  			<a href></a>';
							  html += '  		</div>';
							  html += '  	</div>';
							  html += '  	<div class="badge-list">';
							  html += '  	</div>';
							  html += '  </td>';
							  html += '  <td>';
							  html += '  	<div class="cart-product-price">' + item.price + '</div>';
							  html += '  	<img class="cart-rocket" src="img/cart/cart-rocket-delivery.png" alt="로켓배송">';
							  html += '  </td>';
							  html += '  <td>' + item.delivery + '</td>';
							  html += '</tr>';
			  
								
							   if(index == (data.length-1)) {
								  html += '</table>';
							  } 
						  });
						  $("#cart-product-contents").html(html);
					},
					error: function(error) {
						console.log(error.status);
					}
				});
			}
		</script>
	</head>
</html>