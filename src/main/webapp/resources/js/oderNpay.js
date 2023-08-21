$(init);

function init() {
	isValidation = false;
	errorCheck = 0; //오류 체크
	//수정버튼 클릭시 휴대폰 번호 검사
	 submitBtn  = document.querySelector(".edit-btn");
	 submitBtn.addEventListener('click', checkPhone);
	 
	 //결제 방법 라디오 버튼
	 $(".type-selector-radio").click(selectPay);
	 //플래그
	 flag = "none";
	 cashChecked = 0;
	 isFirst = 1;
	 
	 //소득공제, 지출증빙 라디오버튼
	 cashRadio1 = document.getElementById("cashRadio1");
	 cashRadio2 = document.getElementById("cashRadio2");
	 
	 //가격 천 단위로 , 붙이기
	 priceElements = document.querySelectorAll('.op-price');

     priceElements.forEach(function(element) {
	      var priceText = element.textContent;
	      var formattedPrice = numberWithCommas(priceText);
	      element.textContent = formattedPrice;
     });

     $("#paymentBtn").click(function() {
    	 orderSubmit();
     });
     

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

// 숫자에 ','를 추가하는 함수
function numberWithCommas(number) {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//핸드폰 번호에 - 붙이는 함수
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

//제출 전에 모든 정보가 입력되었는지 확인
function orderSubmit() {
        // 폼 제출을 초기에 막음
        event.preventDefault();

        // 이전의 오류 메시지 지움
        $("#error-message").text("");

        // 필수 입력 필드가 비어있는지 확인
        var selectedPayType = $("input[name='payType']:checked").val();
        var recipient = $("#receiver-name").text(); //이름
        var recieveAddress = $("#receiver-address").text(); //배송주소
        var phoneNumber = $("#receiver-tel").text(); //핸드폰 번호
        var request = $("#delivery-request-spot").text(); //배송 요청사항
        var selectedBank = $("#label_rocketBank_bankList").val(); //은행
        var selectedCard = $("#rocketCard-select").val(); //카드
        var selectedMobile = $("#cellphoneTelecom").val(); //통신사
        var selectedVirtualBank = $("#depositBank").val(); //무통장 은행
        var errorCheck = true; // 초기화

        //받는 사람 정보 입력 확인
        if (recipient == ""|| recieveAddress == ""|| phoneNumber == ""|| request == "") {
            $("#address-error").text("받는 사람 정보를 입력하세요.");
            errorCheck = false;
        } 
        
        if (selectedPayType == "ACT" && selectedBank == "선택") {
        	$("#pay-method-error").text("모든 결제 정보를 입력하세요");
        	errorCheck = false;
         } else if(selectedPayType == "CRD" && selectedCard == "선택") {
        	$("#pay-method-error").text("모든 결제 정보를 입력하세요");
        	errorCheck = false;
        } else if(selectedPayType == "PHO" && selectedMobile == "선택") {
        	$("#pay-method-error").text("모든 결제 정보를 입력하세요");
        	errorCheck = false;
        } else if(selectedPayType == "DWP" && selectedVirtualBank == "선택") {
        	$("#pay-method-error").text("모든 결제 정보를 입력하세요");
        	errorCheck = false;
        } 
        
        if(errorCheck === true) {
        	alert("주문이 완료되었습니다.");
        	// 모든 필수 입력란이 채워져 있으면 폼을 제출
        	// 선택된 결제 방법의 라디오 버튼 값
		    var selectedPayType = $("input[name='payType']:checked").val();
		    var usedPoint = parseInt(document.getElementById("pointInput").value, 10);
		    
		    // 서버로 전송할 데이터를 객체로 구성
		    var requestData = {
		        payType: selectedPayType,
		        usedPoint: usedPoint
		    };
		 
	        $.ajax({
	            type: "POST",
	            url: "insertOrder", 
	            data: requestData,
	            success: function(response) {
	                console.log("주문 성공");
	                location.href = "myOrderList";
	            },
	            error: function(xhr, status, error) {
	                console.error("주문 실패", error);
	            }
	        });
        } else {
        	alert("모든 정보를 입력하세요");
        }
}
}
