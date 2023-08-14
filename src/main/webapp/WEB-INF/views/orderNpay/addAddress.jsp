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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<style>
.content-head__title {
    margin: 0;
    padding: 0;
    border: 0;
    padding: 9px 0;
    color: #111;
    font-size: 16px;
    line-height: 22px;
    text-align: center;
}
.icon-text-field__icon--person {
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 20px;
    padding-left: 19px;
    background-position: -1px -1px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -10px;
    margin-top: -10px;
}
.icon-text-field__icon-box {
    margin: 0;
    padding: 0;
    border: 0;
    width: 44px;
    border: 1px solid #ccc;
    background-color: #fafafa;
}
.icon-text-field__input {
    margin: 0;
    padding: 0;
    border: 0;
    background-color: transparent;
    box-shadow: none;
    display: block;
    text-indent: 12px;
    transition: background-color .15s ease;
    margin: -12px 0;
    padding: 12px 0;
    background-color: #fff;
    width: 100%;
    font-size: 14px;
    font-family: dotum,sans-serif;
    font-weight: bold;
    line-height: 20px;
    color: #111;
    box-sizing: border-box;
}
.icon-text-field__placeholder {
    user-select: none;
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    padding: 12px 0;
    font-family: dotum,sans-serif;
    font-size: 14px;
    font-weight: bold;
    line-height: 20px;
    color: #aaa;
    white-space: nowrap;
    text-overflow: ellipsis;
    text-indent: 12px;
}
.icon-text-field__icon-container .icon-text-field__icon-box {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    border-width: 0 1px 0 0;
}
.icon-text-field__icon--map-pin {
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 20px;
    padding-left: 19px;
    background-position: -22px -1px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -10px;
    margin-top: -10px;
}
.icon-text-field__separator {
    margin: 0;
    padding: 0;
    border: 0;
    clear: both;
    display: block;
    width: 100%;
    height: 0;
    border-top: 1px solid #ccc;
    line-height: 0;
    font-size: 0;
}
.icon-text-field.icon-text-field--input-util {
    padding-right: 44px;
}
.icon-text-field__icon--cellphone {
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 20px;
    padding-left: 15px;
    background-position: -43px -1px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -8px;
    margin-top: -10px;
}
.icon-text-field__input-util .icon-text-field__button {
    width: 100%;
    height: 100%;
    border: 1px solid #ccc;
}
.icon-text-field__icon--plus {
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 16px;
    padding-left: 15px;
    background-position: -1px -22px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -8px;
    margin-top: -8px;
}
.icon-text-field__icon--speech-bubble {
    background-image: url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
    background-size: 110px 110px;
    display: inline-block;
    overflow: hidden;
    width: 1px;
    vertical-align: middle;
    white-space: nowrap;
    text-indent: 1px;
    height: 20px;
    padding-left: 19px;
    background-position: -81px -1px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -10px;
}
.save-as-default__label {
    margin: 0;
    padding: 0;
    border: 0;
    float: left;
    display: inline;
    vertical-align: middle;
    color: #555;
    font-size: 12px;
    font-family: dotum,sans-serif;
    line-height: 24px;
}
.addressbook__button--save {
    -webkit-filter: chroma(color=#000);
    filter: chroma(color=#000);
    overflow: visible;
    display: inline-block;
    overflow: hidden;
    margin: 0;
    padding: 0;
    border: 0;
    border-radius: 0;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    vertical-align: middle;
    box-sizing: content-box;
    font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
    background-color: #0073e9;
    color: #fff;
    border: 0;
    box-shadow: inset 0 -2px 0 rgba(0,0,0,0.38);
    transition: box-shadow .25s ease;
    display: block;
    text-align: center;
    width: 100%;
    padding-left: 0;
    padding-right: 0;
    font-weight: bold;
}
.addressbook__button--save .addressbook__text {
    font-size: 16px;
    height: 50px;
    line-height: 49px;
}
.content-block {
    display: table-row;
}
</style>
</head>
<body>
	<div class="content-block">

		<div class="content-head content-head--fixed">
			<h1 class="content-head__title">배송지 추가</h1>
		</div>

		<div class="content-body content-body--fixed">

			<div class="content-body__corset ">
				<form method="post" class="_addressBookSaveForm" action="editAddress" data-native-callback="">
					<div class="icon-text-field__frame-box _addressBookRecipientRoot" data-error-class="icon-text-field__frame-box--error">
						<div class="icon-text-field__icon-container">
							<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
								<i class="icon-text-field__icon--person"></i>
							</div>
							<div class="icon-text-field__input-container">
								<label for="addressbookRecipient" class="icon-text-field__input-area"> 
									<input type="text" class="icon-text-field__input _addressBookRecipientInput" id="addressbookRecipient" name="recipientName" maxlength="40" placeholder="" value=""> 
									<span class="icon-text-field__placeholder _addressBookRecipientPlaceholder" style="">받는 사람</span>
								</label>
							</div>
						</div>
					</div>

					<div class="icon-text-field__input-container _addressBookAddressDetailArea" style="display: none;">
						<i class="icon-text-field__separator"></i> 
						<label for="addressbookAddressDetail" class="icon-text-field__input-area"> 
							<input type="text" class="icon-text-field__input _addressBookAddressDetailInput" id="addressbookAddressDetail" name="addressDetail" placeholder="" value="" maxlength="255"> 
							<span class="icon-text-field__placeholder _addressBookAddressDetailPlaceholder" id="detailAddress">상세주소</span>
						</label>
					</div>
				</div>
			</div>

			<div class="icon-text-field icon-text-field--input-util _addressBookCellphoneAddonStatus">
				<div class="icon-text-field__frame-box _addressBookCellphoneErrorStatus">
					<div class="icon-text-field__icon-container">
						<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
							<i class="icon-text-field__icon--cellphone"></i>
						</div>
						<div class="icon-text-field__input-container">
							<label for="addressbookCellphone" class="icon-text-field__input-area"> 
								<input type="tel" class="icon-text-field__input _addressBookCellphoneInput" id="addressbookCellphone" name="recipientCellphone" placeholder="" value=""> 
								<span class="icon-text-field__placeholder _addressBookCellphonePlaceholder" style="">휴대폰 번호</span>
							</label>
						</div>
					</div>
				</div>

				<div class="icon-text-field__input-util _addressBookCellphoneAddon">
					<button type="button" class="icon-text-field__button _addressBookCellphoneAddonTrigger" title="연락처 추가">
						<i class="icon-text-field__icon--plus">연락처 추가</i>
					</button>
				</div>
			</div>

			<div class="icon-text-field__frame-box _addressBookDeliveryPreferencesErrorStatus">
				<div class="icon-text-field__icon-container">
					<div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
						<i class="icon-text-field__icon--speech-bubble"></i>
					</div>
					<div class="icon-text-field__button-container">
						<a href="#identityIframe" role="button" data-disabled-class="icon-text-field__button--disabled" data-iframe-src="/deliverypreferences/picker?addressBookSeq=new&amp;displayBackButton=false&amp;displayTitle=true&amp;deliveryType=STANDARD&amp;fixHistory=true&amp;returnUrl=https://id.coupang.com/addressbook/deliverypreferences/transfer?checkoutId=1691974634752" data-iframe-title="배송 요청사항" class="icon-text-field__button icon-text-field__button--icon-container _addressBookDeliveryPreferencesTrigger" title="배송 요청사항"> 
							<span class="icon-text-field__text icon-text-field__text--button-label _addressBookDeliveryPreferencesDefaultSummary"> 배송 요청사항 </span> 
							<span class="icon-text-field__text _addressBookDeliveryPreSummaryPrefix" style="display: none">일반 : </span> 
							<span class="icon-text-field__text _addressBookDeliveryPreferencesSummary" style="display: none;"> </span> 
							<i class="icon-text-field__icon--right-arrow"></i>
						</a>
					</div>

					<div class="icon-text-field__button-container _addressBookDawnDeliveryPreferences" style="display: none">
						<i class="icon-text-field__separator"></i> <a href="#identityIframe" role="button" data-disabled-class="icon-text-field__button--disabled" data-iframe-src="/deliverypreferences/dawnPicker?addressBookSeq=new&amp;displayBackButton=false&amp;displayTitle=true&amp;deliveryType=STANDARD&amp;fixHistory=true&amp;returnUrl=https://id.coupang.com/addressbook/deliverypreferences/transfer?checkoutId=1691974634752" data-iframe-title="새벽배송 정보를 선택해 주세요." class="icon-text-field__button icon-text-field__button--icon-container _addressBookDawnDeliveryPreferencesTrigger" title="새벽배송 정보를 선택해 주세요."> 
							<span class="icon-text-field__text icon-text-field__text--button-label _addressBookDawnDeliveryPreferencesDefaultSummary"> 새벽배송 정보를 선택해 주세요. </span> 
							<span class="icon-text-field__text _addressBookDawnDeliveryPreSummaryPrefix" style="display: none;">새벽 : </span> 
							<span class="icon-text-field__text _addressBookDawnDeliveryPreferencesSummary" style="display: none;"> </span> 
								<i class="icon-text-field__icon--right-arrow" ></i>
							</a>
						</div>
					</div>
				</div>

				<div class="save-as-default">
					<label for="_addressBookSaveAsDefault" class="save-as-default__container"> 
						<input id="_addressBookSaveAsDefault" value="true" type="checkbox" class="save-as-default__checkbox _addressBookSaveDefault"> 
						<span class="save-as-default__label">기본 배송지로 선택</span>
					</label>
				</div>

				<div class="addressbook__button-fixer">
					<button type="button" class="addressbook__button--save _addressBookFormSubmit">
						<span class="addressbook__text"> 저장 </span>
					</button>
				</div>
				<input type="hidden" name="defaultAddress" value="false">
			</form>

		</div>

	</div>
</div>
</body>
</html>