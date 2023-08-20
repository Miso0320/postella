<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<title>주문 결제 페이지</title>
		
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/oderNpay.css">
		<script src="${pageContext.request.contextPath}/resources/js/oderNpay.js"></script>
		<script>
			function deliveryRequestOpen() {
				delReqChildWindow = window.open('deliveryRequest', '_blank', 'width=518, height=666, left=200, top=200');
				delReqChildWindow.dataFromParent = "orderNpay";
			}
			
			function changeAddressOpen() {
				changeAddressWindow = window.open('changeAddress', '_blank', 'width=518, height=666, left=200, top=200');
				changeAddressWindow.dataFromParent = "orderNpay";
			}
			
			//적립금 사용시 결제금액 계산
		    function inputPoint() {
		        var inputField = document.getElementById("pointInput"); // 입력된 포인트
		        var usPoint = parseInt("${user.us_point}", 10); // 변환된 사용자 포인트 값
		        var totalPrice = parseInt("${totalPrice}", 10); // 상품 총 가격
		        var shippingFee = parseInt("${shippingFee}", 10); // 배송비
		        
		        var inputValue = parseInt(inputField.value, 10);
		    	
		        // 입력 값이 없거나 0보다 작으면 0으로 설정
		        if (isNaN(inputValue) || inputValue <= 0) {
		            inputValue = 0;
		            inputField.value = 0;
		        }
		        // 입력 값이 사용자 포인트보다 큰 경우 경고 메시지를 표시
		        if (inputValue > usPoint) {
		            alert("보유하신 포인트를 초과해서 사용할 수 없습니다.");
		            inputField.value = usPoint; // 값을 다시 사용자 포인트 값으로 설정
		        }

		        // 계산하여 출력할 총 결제 금액을 계산
		        var totalPayPrice = totalPrice + shippingFee - inputValue;
		        
		        // 총 결제 금액을 페이지에 업데이트
		        var totalPayPriceSpan = document.getElementById("totalPayPrice");
		        totalPayPriceSpan.textContent = totalPayPrice.toLocaleString();
		    }
			
		</script>
	</head>
	
	<body>
		<!-- 주소 목록에서 선택된 주소 카드 정보를 저장 -->
		<header class="cartHeader">
	         <div>
	            <a href="productGroup"><img src="${pageContext.request.contextPath}/resources/img/logo.png" class="cart-coupang-logo"></a>
	         </div>
	     </header>
	     
	     <div id="body">
	     	<div class="oder-title">
	     		<div class="ordTitle">
					<h3 class="title">주문/결제</h3>
					<span class="steps">
			           <em>주문결제 &gt;</em>주문완료
					</span>
				</div>
	     	</div>
	     	
	     	<div class="oder-customer-info">
	     		<div class="customer__root">
				    <h2 class="customer__h2">구매자정보</h2>
				    <table class="customer__table">
				        <tbody>
					        <tr>
					            <td class="customer__col customer__col--1">이름</td>
					            <td class="customer__col customer__col--2">${user.us_name}</td>
					        </tr>
					        <tr>
					            <td class="customer__col customer__col--1">이메일</td>
					            <td class="customer__col customer__col--2">${user.us_email}</td>
					        </tr>
					        <tr>
					            <td class="customer__col customer__col--1">휴대폰 번호</td>
					            <td class="customer__col customer__col--2">
					                <div data-component="customer-phone">
					                	<div class="customer-phone__root">
									    	<div class="customer-phone__root_upper">
												<form>
													<div>
														<input type="text" class="customer-phone__input-tel " oninput="oninputPhone(this)" maxlength="14" value="${user.us_tel}" />
														<button type="submit" class="edit-btn btn btn-info">수정</button>
														<span class="customer-phone__tel-desc">쿠폰/티켓정보는 구매한
															분의 번호로 전송됩니다.</span>
													</div>
													<p class="customer-phone__err">전화번호 형식이 올바르지 않습니다.</p>
												</form>
											</div>
											<div>
												<p class="customer-phone__noti">
											    	* 인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.
												</p>
											</div>
											<div class="customer-phone-auth__root">
												<p class="customer-phone-auth__noti ">입력하신 휴대폰 번호로 인증번호가
													발송 되었습니다.</p>
												<div class="customer-phone-auth__form">
													<form data-customer-phone--form-auth="">
														<div>
															<input type="tel" class="customer-phone-auth__input "
																data-customer-phone--input-auth="" value="">
															<button type="submit" class="customer-phone__submit">
																인증완료</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
					            </td>
					        </tr>
					    </tbody>
				    </table>
				</div>
	     	</div>
	     	
	     	<div class="oder-receiver-info">
	     		<div data-component="deliveryAddress">    
	     			<h2 class="delivery-address__caption-header">
					        받는사람정보
					    <button class="delivery-address__popup-list-button btn btn-info" type="button" onclick="changeAddressOpen()">배송지변경</button>
					</h2>
				    <table class="delivery-address">
				        <tbody>
					        <tr>
					            <th class="delivery-address__th">이름</th>
					            <td class="delivery-address__td">
					                <span class="delivery-address__name" id="receiver-name">${basicDa.da_name}</span>
					                <c:if test="${basicDa.da_main} == 'Y'">
					                	<span class="delivery-address__type-label">기본배송지</span>
					                </c:if>
					            </td>
					        </tr>
					        <tr>
					            <th class="delivery-address__th">배송주소</th>
					            <td class="delivery-address__td" id="receiver-address">${basicDa.da_adr} ${basicDa.da_detail_adr}</td>
					        </tr>
					        <tr>
					            <th class="delivery-address__th delivery-address__th--no-line">연락처</th>
					            <td class="delivery-address__td delivery-address__td--no-line" id="receiver-tel">${basicDa.da_tel}</td>
					        </tr>
					        <tr>
						        <th class="delivery-address__th"  id="delivery-request">
						            <span>배송 요청사항</span>
						        </th>
						        <td class="delivery-address__td">
						            <span class="delivery-request-spot" id="delivery-request-spot">${basicDa.da_req_type}</span>
						            <button class="delivery-request-message__popup-list-button btn btn-info" type="button" onclick="deliveryRequestOpen()">변경</button>
						        </td>
						    </tr>
				        </tbody>
				    </table>
				</div>
	     	</div>
	     	
	     	<div class="oder-delivery">
	     		<div class="bundle-info__retail">
					<div data-bundle-info__simple-warning-message-box__wrapper=""></div>
			        <div class="bundle-info__pdd-group-title">배송 총 ${totalCnt}건</div>
			        <div class="bundle-info__pdd-group-box">
			              <div class="bundle-info__expected-delivery-date-box">
			                  <span class="bundle-info__expected-delivery-info">
		                          <strong class="deliverDayNum">${deliverDay}</strong>
		                          <span class="bundle-info__guaranty">도착 보장</span>
			                  </span>
			              </div>
			              <div class="bundle-info__item-list ">
				              <c:forEach var="product" items="${products}">
			                   	<div class="bundle-info__vendor-item-box ">
			                        <div class="bundle-info__vendor-item">
			                            <p>${product.pg_name} - </p>
			                            <p class="option-name-bold">${product.prd_name}</p>
			                        </div>
			                        <div class="bundle-info__item-description">수량 ${product.quantity}개</div>
			                        <div class="pricePerOption"><span class="op-price">${product.prd_price * product.quantity}</span><span>원</span></div>
			                    </div>
				            </c:forEach>
			            </div>
			        </div>
				</div>
	     	</div>
	     	
	     	<div class="oder-pay-info">
	     		<h2 class="checkout__h2">결제정보</h2>
	     		<table class="pay-price">
					<tbody>
						<tr class="payOrder-wrap">
							<th class="wrap-title" scope="row">총상품가격</th>
							<td>
								<div class="payOrder">
									<strong class="price">
				                    	<span id="totalPriceDisp" class="use-calculation-for-totalprice op-price">${totalPrice}</span>
				                    	<span class="unit">원</span>
									</strong>
								</div>
							</td>
						</tr>
						
						<tr>
							<th class="wrap-title" scope="row">배송비</th>
							<td class="delivery-total-price">
								<div class="price"><strong><span class="op-price" id="shipFee">${shippingFee}</span><span>원</span></strong></div>
							</td>
						</tr>
						<tr class="payCoupangCash">
							<th class="wrap-title" scope="row">적립금</th>
							<td>
								<div class="price"><strong><input id="pointInput" class="op-price" onchange="inputPoint()" value="0"/><span>원</span></strong></div>
								<div class="selected-coupon">
									<span class="usable">보유 : <strong><span class="op-price">${user.us_point}</span><span>원</span></span>
								</div>
							</td>
						</tr>
						<tr>
							<th class="wrap-title">총결제금액</th>
							<td>
								<div class="payPrice"><strong><span class="op-price" id="totalPayPrice">${totalPrice + shippingFee}</span><span>원</span></strong></div>
							</td>
						</tr>
						<tr>
							<th class="wrap-title">결제방법</th>
							<td>
								<div class="select-pay">
									<ul id="payTypeList" class="type-selector-list">
							            <li id="rocketPayBox" class="type-selector-li selected-pay-type">
							                <input class="type-selector-radio" type="radio" name="payType" id="payType8" value="BANK" checked="checked">
							                <label class="type-selector-label type-selector-label--bank" for="payType8" style="font-weight: bold;">
							                    <span class="type-selector-label__text">계좌이체</span>
							                </label>
							            </li>
						                <li id="rocketPayCardBox" class="type-selector-li">
						                    <input class="type-selector-radio" type="radio" name="payType" id="payType10" value="CARD">
						                    <label class="type-selector-label type-selector-label--card" for="payType10" style="font-weight: normal;">
						                        <span class="type-selector-label__text">신용/체크카드</span>
						                        <img class="rpay-badge rpay-icon-instant-discount" src="//image7.coupangcdn.com/image/rocketpay/order/icon_ccid_v2.png" width="66" height="14" alt="즉시 할인혜택">
						                    </label>
						                </li>
					                    <li id="phonePayBox" class="type-selector-li">
					                        <input class="type-selector-radio" type="radio" name="payType" id="payType6" value="PHONE">
					                        <label class="type-selector-label" for="payType6" style="font-weight: normal;">
					                            <span class="type-selector-label__text">휴대폰</span>
					                        </label>
					                    </li>
						                <li id="virtualAccountPayBox" class="type-selector-li">
						                    <input class="type-selector-radio" type="radio" name="payType" id="payType7" value="VIRTUALACCOUNT">
						                    <label class="type-selector-label" for="payType7" style="font-weight: normal;">
						                        <span class="type-selector-label__text">무통장입금(가상계좌)</span>
						                    </label>
						                </li>
							        </ul>
								</div>
								<div class="pay-type-content" id="bank" style="display: block;">
									<ul class="pay-type-sections">
										<li class="pay-type-section"><label
											for="label_rocketBank_bankList" class="line-title">은행선택</label>
											<div class="line-data">
												<select id="label_rocketBank_bankList" onchange="changebank()">
													<option value="선택" selected="selected">선택</option>
													<option value="카카오뱅크">카카오뱅크</option>
													<option value="농협은행">농협은행</option>
													<option value="국민은행">국민은행</option>
													<option value="신한은행">신한은행</option>
													<option value="우리은행">우리은행</option>
													<option value="기업은행">기업은행</option>
													<option value="하나은행">하나은행</option>
													<option value="새마을금고">새마을금고</option>
													<option value="우체국">우체국</option>
													<option value="제일은행">SC제일은행</option>
													<option value="대구은행">대구은행</option>
													<option value="부산은행">부산은행</option>
													<option value="경남은행">경남은행</option>
													<option value="광주은행">광주은행</option>
													<option value="신협">신협</option>
													<option value="협은행">수협은행</option>
													<option value="산업은행">산업은행</option>
													<option value="전북은행">전북은행</option>
													<option value="제주은행">제주은행</option>
													<option value="씨티은행">씨티은행</option>
													<option value="케이뱅크">케이뱅크</option>
													<option value="토스뱅크">토스뱅크</option>
												</select>
											</div>
											<div class="validate-message" style="display: none;">은행을
												선택해주세요</div></li>
									</ul>
								</div>
								<div class="pay-type-content" id="card">
									<ul class="pay-type-sections">
										<li class="pay-type-section">
											<label for="rocketCard-select" class="line-title">카드선택</label>
											<div class="line-data">
												<select name="rocketCardCode" id="rocketCard-select" class="rocketpay-card__cardList"  onchange="changeCard()">
													<option value="선택">선택</option>
													<option value="KB">KB국민카드</option>
													<option value="LOTTE">롯데카드</option>
													<option value="SHINHAN">신한카드</option>
													<option value="HANA_SK">하나카드</option>
													<option value="BC">BC카드</option>
													<option value="SAMSUNG">삼성카드</option>
													<option value="HYUNDAI">현대카드</option>
													<option value="WOORI">우리카드</option>
													<option value="NH">NH농협카드</option>
													<option value="CITY">씨티카드</option>
													<option value="KakaoBank">카카오뱅크카드</option>
													<option value="TOSSBANK">토스뱅크카드</option>
													<option value="ETC">기타(은행/증권)카드</option>
												</select> 
											</div>
											<div class="validate-message3">카드종류를
												선택해주세요</div>
										</li>
										<li class="pay-type-section last-section">
											<label for="rocketCard-select" class="line-title">할부기간</label>
											<div class="line-data">
												<select name="quota" id="rocketCard-quota-select" class="rocketpay-card__quotaList">
													<option value="00">일시불</option>
													<option value="02">2개월 (무이자)</option>
													<option value="03">3개월 (무이자)</option>
													<option value="04">4개월 (무이자)</option>
													<option value="05">5개월 (무이자)</option>
													<option value="06">6개월 (무이자)</option>
													<option value="07">7개월</option>
													<option value="08">8개월</option>
													<option value="09">9개월</option>
													<option value="10">10개월 (부분무이자)</option>
													<option value="11">11개월</option>
													<option value="12">12개월 (부분무이자)</option>
													<option value="13">13개월</option>
													<option value="14">14개월</option>
													<option value="15">15개월</option>
													<option value="16">16개월</option>
													<option value="17">17개월</option>
													<option value="18">18개월</option>
													<option value="19">19개월</option>
													<option value="20">20개월</option>
													<option value="21">21개월</option>
													<option value="22">22개월</option>
													<option value="23">23개월</option>
													<option value="24">24개월</option>
												</select>
												<span id="rocketCard-installment-notice" class="note-install">
												* 할부는 50,000원 이상만 가능합니다
												</span>
											</div>
										</li>
									</ul>
								</div>
								<div class="cellphone-payment pay-type-content" id="phone">
									<ul class="pay-type-sections">
										<li class="pay-type-section">
											<label for="cellphoneTelecom" class="payment-cellphone__line-title">통신사 종류</label>
											<div class="payment-cellphone__line-data">
												<select name="cellphoneTelecom" id="cellphoneTelecom" class="payment-cellphone__select" onchange="changeMobile()">
													<option value="선택" selected="">선택</option>
													<option value="SKT">SKT</option>
													<option value="KT">KT</option>
													<option value="CJH">헬로모바일</option>
													<option value="KCT">KCT</option>
												</select>
											</div>
											<p class="payment-cellphone__validate-message">통신사 정보를 추가해주세요</p>
										</li>
									</ul>
								</div>
								<div class="virtual-account-payment pay-type-content" id="virtual">
									<ul class="pay-type-sections">
										<li class="deposit-bank-wrap pay-type-section">
											<label for="depositBank" class="line-title">입금은행</label>
											<div class="line-data">
												<select id="depositBank" class="" name="depositBank" onchange="changebank2()">
													<option value="선택" selected="">선택</option>
													<option value="NH">농협은행</option>
													<option value="KB">국민은행</option>
													<option value="SHINHAN">신한은행</option>
													<option value="WOORI">우리은행</option>
													<option value="HANA">KEB하나은행</option>
													<option value="IBK">기업은행</option>
													<option value="DAEGU">대구은행</option>
													<option value="BUSAN">부산은행</option>
													<option value="POST_OFFICE">우체국</option>
													<option value="KYONGNAM">경남은행</option>
													<option value="KWANGJU">광주은행</option>
													<option value="SC">SC제일은행</option>
													<option value="SUHYUB">수협은행</option>
												</select>
											</div>
											<div class="validate-message2" style="display: none;">은행을
												선택해주세요</div>
										</li>
										<li class="payBox-section  pay-type-section">
											<span class="line-title">입금기한</span>
											<div class="line-data">
												<span class="depositDueTxt">2023년 07월 11일 12시 04분까지</span>
											</div>
										</li>
										<li class="pay-type-explain">
											<p class="cash-receipt-explain">
											* 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</p>
										</li>
									</ul>
								</div>
								<div class="savePaymentOption">
									<input class="savePaymentOption-checkbox" type="checkbox" id="savePaymentOption" checked=""> 
									<label class="savePaymentOption-message" for="savePaymentOption">기본 결제 수단으로 사용</label>
								</div>
							</td>
						</tr>
					</tbody>     		
	     		</table>
	     	</div>
	
			<div class="confirm-agreements-message">
	            	위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및 제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.
	        </div>
			<div class="oder-pay">
				<div class="agreeBtn" id="btn_all">
					<button class="btn btn-info" type="button" id="paymentBtn">결제하기</button>
				</div>
			</div>
		</div>
	    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>











