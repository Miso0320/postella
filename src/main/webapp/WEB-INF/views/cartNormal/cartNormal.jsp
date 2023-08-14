<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
		<title>장바구니!!!</title>
		
		<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_cyborg.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartNormal.css">
		<script src="${pageContext.request.contextPath}/resources/js/cartNormal.js"></script>
		
	</head>
	<body style="background-color:#F2F2F2;">
		<header class="cartHeader">
			<div>
				<a href="productGroup"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="50px"></img></a>
			</div>
		</header>
		<main class="main-cart" style="background-color:white;">
			<div class="cart-title">
				<h1><img src="${pageContext.request.contextPath}/resources/img/cart/cart-title.png" class="cart-img"></h1>
			</div>
			<div class="cart-contents">
				<div class="cart-part d-flex">
					<span class="normal-cart d-flex justify-content-center">구매목록</span>
					<a class="subscribe-cart d-flex justify-content-center">정기배송</a>
				</div>
				<div class="cart-part table" id="cart-chart">
					<table id="myTable">
						<thead id="thead">
						  <tr>
						    <th class="th1">
						    	<label class="mb-auto">
						    		<input title="모든 상품을 결제상품으로 설정" type="checkbox" name="checkBoxSelectAll" class="checkBoxSelectAll" checked>전체선택
						    	</label>
						    </th>
						    <th class="th2" colspan="2">상품정보</th>
						    <th class="th3"> </th>
						    <th class="th4">상품금액</th> 
						    <th class="th5">배송비</th>
						  </tr>
						  <tr>
						    <td colspan="5" class="cart-product-title">
						    	<span style="font-size:18px; font-weight:bold;">로켓배송 상품</span>
						    	<span><span>무료배송</span></span>
						    </td>
						  </tr>
						</thead>					
						
					  <tbody id="cart-product-contents" class="cart-product-contentes">	
							
					  </tbody>
					  
					  <tbody>
					  	<div id="tbody" class="d-none">
					  		<p class="noItemWarning">장바구니에 담은 상품이 없습니다.</p>
					  	</div>
					  </tbody>
					  
					  <tfoot id="tfoot">
						  <tr class="cart-price-total">
						    <td colspan="6" style="background-color: white; border: 5px solid #f2f2f2;">
						    	<span style="display:flex; justify-content:end;">
						    		주문금액
						    		<span class="orderPrice">0</span>
						    		 원 
						    	</span>
						    </td>
						  </tr>
					  </tfoot>
					</table>
				</div>
				<div class="cart-part1">
					<span>
						<label>
							<input title="모든 상품을 결제상품으로 설정" type="checkbox" name="checkBoxSelectAll" class="checkBoxSelectAll" checked>
							<span>전체선택</span>
							<span class="cart-count-bottom">( <em id='result'>0</em> / <em id='result2'></em> )</span>
							<span>
								<button class="delete btn btn-secondary btn-sm" type="button" onclick="deleteChecked()">선택삭제</button>
							</span>
						</label>
					</span>
				</div>
				<div class="cart-part1">
					<div class="reward-point">
	                    <img class="payment-reward-cash-area__icon" src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png">
	                    <h3 class="payment-reward-cash-area__title" style="font-size:medium;">캐시적립 혜택</h3>
	                  
	                    <span class="payment-reward-cash-area__desc">카드 결제 시 1% 적립</span>
                	</div>
				</div>
				
				<div class="cart-part1">
					<div class="cart-total-price" data-total-price="0" data-discount-price="0">
                <div class="cart-total-price__inner">
                    <div class="price-area">
                        	총 상품가격
                        <em id="finalPrice" class="final-product-price">0</em>원
                        <img src="${pageContext.request.contextPath}/resources/img/cart/cart-plus.gif" class="math-icon">
                       	 총 배송비
                        <em id="finalPrice" class="final-delivery-charge">0</em>원
                        <img src="${pageContext.request.contextPath}/resources/img/cart/cart-equal.gif" class="math-icon">
                        	총 주문금액
                        <em class="final-order-price">
                          0
                        </em>
                        <em>
                        	원
                        </em>
                    </div>
                </div>

            </div>
				</div>
				
				<div class="cart-part1" id="order-buttons">
					<div class="order-buttons">
		                <a id="continueShoopingBtn" class="goShopping logging" href="product.jsp" data-view-type="shoppingCart" data-event-name="continuouslyShoppingClick" data-log-label="cart-p-continuouslyShoppingClick" data-coulog-type="clickEvent" data-listener-event-type="click">계속 쇼핑하기</a>
		                <a href="oderNpayjsp.jsp" class="goPayment" id="btnPay" data-pay-url="/cart/orderV3?isAllChecked=false" style="margin:0px 10px">구매하기</a>
		                <div class="item-disabled" style="display: none;"></div>
		            </div>
				</div>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>