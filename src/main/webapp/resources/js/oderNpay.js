$(init);

function init() {
	isValidation = false;
	
	//수정버튼 클릭시 휴대폰 번호 검사
	 submitBtn  = document.querySelector(".edit-btn");
	 submitBtn.addEventListener('click', checkPhone);
	 
	 //결제 방법 라디오 버튼
	 $(".type-selector-radio").click(selectPay);
	 //플래그
	 flag = "none";
	 cashChecked = 0;
	 isFirst = 1;
//	 cashRadio1 = 1;
//	 cashRadio2 = 0;
	 
	 //소득공제, 지출증빙 라디오버튼
	 cashRadio1 = document.getElementById("cashRadio1");
	 cashRadio2 = document.getElementById("cashRadio2");
}

//휴대폰 번호 검사
function checkPhone() {
	   var phone = $(".customer-phone__input-tel").val();
	   // 휴대폰 번호 정규식
	   var pattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	   var result = pattern.test(phone);
	   var numErr = $(".customer-phone__err");
	   var validPhone = $(".customer-phone-auth__root");
	   
	   if(phone === "" || (!result)) {
	      isValidation = false;
	      numErr.css("display","block");
	      validPhone.css("display","none");
	   } else {
	      validPhone.css("display","block");
	      numErr.css("display","none");
	   }
	event.preventDefault();
}

//결제 방법 라디오 버튼
function selectPay(event) {
	var target = $(this).attr('id');
	
	if(isFirst == 1) {
		document.querySelector("#bank").style.display = "none";
		isFirst = 0;
	}
	function visible(string) {
		if(flag !== "none"){
			invisible();
		}
		document.querySelector(string).style.display = "block";
		flag = string;
	}
	function invisible() {
		document.querySelector(flag).style.display = "none";
	}
	
	switch(target) {
	case 'payType8' :
		visible("#bank");
		break;
	case 'payType9' :
		visible("#coupay");
		break;
	case 'payType10' :
		visible("#card");
		break;
	case 'payType1' :
		visible("#card");
		break;
	case 'payType6' :
		visible("#phone");
		break;
	case 'payType7' :
		visible("#virtual");
		break;
	}
}

//은행 유효성 검사
function changebank() {
	var selectedBank = document.getElementById("label_rocketBank_bankList");
	
	if(selectedBank.value == "선택") {
		document.querySelector(".validate-message").style.display = "block";
	} else {
		document.querySelector(".validate-message").style.display = "none";
	}
}

function changebank2() {
	var selectedBank = document.getElementById("depositBank");
	
	if(selectedBank.value == "선택") {
		document.querySelector(".validate-message2").style.display = "block";
	} else {
		document.querySelector(".validate-message2").style.display = "none";
	}
}

//통신사 유효성 검사
function changeMobile() {
	var selectedMobile = document.getElementById("cellphoneTelecom");
	if(selectedMobile.value == "선택") {
		document.querySelector(".payment-cellphone__validate-message").style.display = "block";
	} else {
		document.querySelector(".payment-cellphone__validate-message").style.display = "none";
	}
}

//법인카드 유효성 검사
function changeCard() {
	var selectedCard = document.getElementById("rocketCard-select");
	if(selectedCard.value == "선택") {
		document.querySelector(".validate-message3").style.display = "block";
	} else {
		document.querySelector(".validate-message3").style.display = "none";
	}
}

//체크박스 색 변경
function checked() {
	var cashCheck = document.getElementById("cash-receipt__checkbox");
	var cashText1 = document.getElementById("cash-text1");
	var cashText2 = document.getElementById("cash-text2");
	
	if(cashChecked == 0) {
		cashText1.style.display = "block";
		cashText2.style.display = "block";
		cashCheck.style.backgroundPosition = '-48px -6px';
		cashChecked = 1;
	} else {
		cashText1.style.display = "none";
		cashText2.style.display = "none";
		cashCheck.style.backgroundPosition = '-12px -6px';
		cashChecked = 0;
	}
}

function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}