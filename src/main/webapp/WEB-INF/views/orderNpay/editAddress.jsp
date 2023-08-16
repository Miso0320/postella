<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
<title>배송지 수정</title>

<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addAddress.css">
<script>
	function kakaopost() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("recieveAddress").value = addr + " [" + data.zonecode + "]";
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
	
	function openDeliveryRequestPage() {
		delReqChild = window.open('deliveryRequest', '_blank', 'width=518, height=666, left=200, top=200');
		delReqChild.dataFromParent = "editAddress";
	}

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>

</head>
<body>
	<div class="content-head content-head--fixed">
		<h1 class="content-head__title">배송지 수정</h1>
	</div>


	<div class="content-body__corset">
		<form action="addAddress" method="post" class="_addressBookSaveForm" accept-charset="UTF-8">

			<!-- 받는 사람 입력 -->
			<div class="icon-text-field__frame-box _addressBookRecipientRoot">
				<div class="icon-text-field__icon-container">
					<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
						<i class="icon-text-field__icon--person"></i>
					</div>
					<div class="icon-text-field__input-container">
						<label for="addressbookRecipient" class="icon-text-field__input-area"> 
							<input type="text" class="icon-text-field__input _addressBookRecipientInput" id="addressbookRecipient" name="shippingName" maxlength="40" placeholder="받는 사람" value="">
						</label>
					</div>
				</div>
			</div>

			<!-- 받을 주소 입력 -->
			<div class="icon-text-field__frame-box _addressBookAddressErrorStatus">
				<div class="icon-text-field__icon-container">
					<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
						<i class="icon-text-field__icon--map-pin"></i>
					</div>
					<div class="icon-text-field__input-container">
						<label for="recieveAddress" class="icon-text-field__input-area">
							<input type="text" class="icon-text-field__input _addressBookRecipientInput" id="recieveAddress"  onclick="kakaopost()" name="shippingAddress" maxlength="40" placeholder="받을 주소" value="">
							<input type="text" class="icon-text-field__input _addressBookRecipientInput" id="detailAddress" name="shippingAddress" maxlength="40" placeholder="상세 주소" value="">
						</label>
					</div>
				</div>
			</div>

			<!-- 연락처 입력 -->
			<div class="icon-text-field icon-text-field--input-util _addressBookCellphoneAddonStatus">
				<div class="icon-text-field__frame-box _addressBookCellphoneErrorStatus">
					<div class="icon-text-field__icon-container">
						<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
							<i class="icon-text-field__icon--cellphone"></i>
						</div>
						<div class="icon-text-field__input-container">
							<label for="addressbookCellphone" class="icon-text-field__input-area"> 
								<input type="tel" class="icon-text-field__input _addressBookCellphoneInput" id="addressbookCellphone" name="receiverTel" placeholder="연락처" value="" oninput="oninputPhone(this)">
							</label>
						</div>
					</div>
				</div>
			</div>

			<!-- 배송 요청사항 입력-->
			<div class="icon-text-field__frame-box _addressBookDeliveryPreferencesErrorStatus">
				<div class="icon-text-field__icon-container">
					<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
						<i class="icon-text-field__icon--speech-bubble"></i>
					</div>
					<div class="icon-text-field__button-container">
						<button id="askDeliveryPreference" onclick="openDeliveryRequestPage()" type="button" role="button" class="icon-text-field__button icon-text-field__button--icon-container _addressBookDeliveryPreferencesTrigger">
							<span class="icon-text-field__text icon-text-field__text--button-label _addressBookDeliveryPreferencesDefaultSummary" id="editRequest">배송 요청사항</span>
						</button>
						<label id="getDeliveryPreference" for="addressbookPreference" class="icon-text-field__input-area" style="display: none;"> 
							<input type="text" class="icon-text-field__input _addressBookCellphoneInput" id="addressbookPreference" name="shippingPreference" value="">
						</label>
					</div>
				</div>
			</div>

			<!-- 저장 버튼 -->
			<div class="addressbook__button-fixer">
				<button type="submit" class="addressbook__button--save _addressBookFormSubmit">
					<span class="addressbook__text">저장</span>
				</button>
			</div>
		</form>
	</div>
</body>
</html>