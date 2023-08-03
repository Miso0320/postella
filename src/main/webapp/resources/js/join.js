$(init);

function init() {
	// input 포커스 이벤트
	var inputFocusYn = $(".member_info input");
	inputFocusYn.focus(inputFocus);
	inputFocusYn.blur(inputBlur);
	
	// 약관동의 체크 이벤트
	// 전체 동의
	$(".all_check").click(checkAll);
	// 마케팅 관련 동의
	$(".marketing_all_check").click(marketingCheckAll);
	
	// submit 이벤트
	var joinForm = $("#join");
	joinForm.submit(checkValidation);
	
}

// input focus in
function inputFocus() {
	// 파란줄 생성
	var blueLine = $((event.target.parentElement).parentElement);
	blueLine.css("border-bottom","2px solid #0073e9");
	
	// 검사조건 생성
	var checkText = ((event.target.parentElement).parentElement).id;
	if(checkText === "member_info_pw") {
		var pwdErr1 = $("#pwdErr1");
		var pwdErr2 = $("#pwdErr2");
		var pwdErr3 = $("#pwdErr3");
		pwdErr1.css("display","block");
		pwdErr2.css("display","block");
		pwdErr3.css("display","block");
	} else if(checkText === "member_info_pw_chk") {
		var pwdErr4 = $("#pwdErr4");
		pwdErr4.css("display","block");
	}
}

// input focus out
function inputBlur() {
	var blueLine = $((event.target.parentElement).parentElement);
	blueLine.css("border-bottom","");
	
	// 유효성검사 실행
	var checkText = ((event.target.parentElement).parentElement).id;
	if(checkText === "member_info_id") {
		checkEmail();
	} else if(checkText === "member_info_name") {
		checkName();
	} else if(checkText === "member_info_phone") {
		checkPhone();
	}
}

//이메일(아이디) 검사
function checkEmail() {
	var email = $("#email").val();
	var redLineEmail = $("#member_info_id");
	var emailErr1 = $("#emailErr1");
	var emailErr2 = $("#emailErr2");
	
	// 이메일 형식 정규식
	var pattern1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var result1 = pattern1.test(email);
	
	if(email === "") {
		isValidation = false;
		emailErr1.css("display","block");
		redLineEmail.css("border-bottom","2px solid red");
	} else if(!result1) {
		isValidation = false;
		emailErr2.css("display","block");
		emailErr1.css("display","none");
		redLineEmail.css("border-bottom","2px solid red");
	} else {
		var blueEmail = $("#blue_check_email");
		blueEmail.css("display","block");
		emailErr1.css("display","none");
		emailErr2.css("display","none");
	}
}

//이름 검사
function checkName() {
	var uname = $("#uname").val();
	var redLineName = $("#member_info_name");
	var unameErr = $("#unameErr");
	
	if(uname === "") {
		isValidation = false;
		
		unameErr.css("display","block");
		redLineName.css("border-bottom","2px solid red");
	} else {
		var blueName = $("#blue_check_name");
		blueName.css("display","block");
		unameErr.css("display","none");
	}
}

//휴대폰 번호 검사
function checkPhone() {
	var phone = $("#phone").val();
	var redLinePhone = $("#member_info_phone");
	// 휴대폰 번호 정규식
	var pattern3 = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	var result3 = pattern3.test(phone);
	var numErr = $("#numErr");
	
	if(phone === "" || (!result3)) {
		isValidation = false;
		numErr.css("display","block");
		redLinePhone.css("border-bottom","2px solid red");
	} else {
		var bluePhone = $("#blue_check_phone");
		bluePhone.css("display","block");
		numErr.css("display","none");
	}
}

//3개 이상 연속 문자/숫자
function pwContinueThree() {
	var cnt = 0;
	var cnt2 = 0;
	var tmp = "";
	var tmp2 = "";
	var tmp3 = "";
	var pwd = $("#pwd1").val();
	
	for(i=0; i < pwd.length; i++) {
		tmp = pwd.charAt(i);
		tmp2 = pwd.charAt(i+1);
		tmp3 = pwd.charAt(i+2);
		
		if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == 1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == 1) {
			cnt = cnt + 1;
		}
		if(tmp.charCodeAt(0) - tmp2.charCodeAt(0) == -1 && tmp2.charCodeAt(0) - tmp3.charCodeAt(0) == -1) {
			cnt2 = cnt2 + 1;
		}
	}
	if(cnt > 0 || cnt2 > 0) {
		return true;
	} else {
		return false;
	}
}

//3개 이상 동일 문자/숫자
function pwSameThree() {
	var tmp = "";
	var cnt = 0;
	var pwd = $("#pwd1").val();
	
	for(i=0; i < pwd.length; i++){
		tmp = pwd.charAt(i);
		if(tmp == pwd.charAt(i+1) && tmp == pwd.charAt(i+2)){
			cnt = cnt + 1;
		}
	}
	
	if(cnt > 0) {
		return true;
	} else {
		return false;
	}
}

// 아이디(이메일) 동일하거나 3자 이상 일치 제외
function pwCompareId() {
	var email = $("#email").val();
	var pwd = $("#pwd1").val();
	var tmp = "";
	var cnt = 0;
	
	for(i=0; i < email.length-2; i++) {
		tmp = email.charAt(i) + email.charAt(i+1) + email.charAt(i+2);
		if(pwd.indexOf(tmp) > -1) {
			cnt = cnt + 1;
		}
	}
	
	if(cnt > 0) {
		return true;
	} else {
		return false;
	}
}

// 약관동의 전체 체크
function checkAll() {
	if($(event.target).is(':checked')) {
		$("input[name=checkBox]").prop("checked", true);
		$(".all_check").prop("checked", true);
	} else {
		$("input[name=checkBox]").prop("checked", false);
		$(".all_check").prop("checked", false);
	}
	$(document).on("click", "input:checkbox[name=checkBox]", function(e) {
		var chks = document.getElementsByName("checkBox");
		var chksChecked = 0;
			      
		for(var i=0; i < chks.length; i++) {
			var checkBox = chks[i];
				         
			if(checkBox.checked) {
				chksChecked++;
			}
		}
			      
		if(chks.length == chksChecked){
			$(".all_check").prop("checked", true);
		}else{
			$(".all_check").prop("checked",false);
		}     
	});
}

//약관동의 마케팅동의 체크
function marketingCheckAll() {
	if($(event.target).is(':checked')) {
		$(".marketing_check").prop("checked", true);
		$(".marketing_all_check").prop("checked", true);
	} else {
		$(".marketing_check").prop("checked", false);
		$(".marketing_all_check").prop("checked", false);
	}
}


// 유효성 검사
function checkValidation() {
	let isValidation = false;
	
	//이메일(아이디) 검사
	checkEmail();

	// 비밀번호 검사
	var pwd1 = $("#pwd1").val();
	var pwd2 = $("#pwd2").val();
	var redLinePwd = $("#member_info_pw");
	
	// 영문/숫자/특수문자 2가지 이상 조합 (8~20자)
	var pattern2 = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
	var result2 = pattern2.test(pwd1);
	var pwdErr1 = $("#pwdErr1");
	var pwdErr2 = $("#pwdErr2");
	var pwdErr3 = $("#pwdErr3");
	
	if(pwd1 === "") {
		isValidation = false;
		pwdErr1.css("display","block");
		pwdErr1.removeClass("gray");
		$("#pwdErr1 .cancel_img").attr("src","resources/img/join/cancel_red.png");
		pwdErr2.css("display","block");
		pwdErr2.removeClass("gray");
		$("#pwdErr2 .cancel_img").attr("src","resources/img/join/cancel_red.png");
		pwdErr3.css("display","block");
		pwdErr3.removeClass("gray");
		$("#pwdErr3 .cancel_img").attr("src","resources/img/join/cancel_red.png");
		redLinePwd.css("border-bottom","2px solid red");
	} else if(!result2) {
		isValidation = false;
		pwdErr1.css("display","block");
		pwdErr1.removeClass("gray");
		$("#pwdErr1 .cancel_img").attr("src","resources/img/join/cancel_red.png");
		redLinePwd.css("border-bottom","2px solid red");
		// 3개 이상 연속되거나 동일한 문자/숫자 제외
	} else if(pwContinueThree() || pwSameThree()) {
			isValidation = false;
			pwdErr2.css("display","block");
			pwdErr2.removeClass("gray");
			$("#pwdErr2 .cancel_img").attr("src","resources/img/join/cancel_red.png");
			redLinePwd.css("border-bottom","2px solid red");
			
		// 아이디(이메일) 제외
	} else if(pwCompareId()) {
			isValidation = false;
			pwdErr3.css("display","block");
			pwdErr3.removeClass("gray");
			$("#pwdErr3 .cancel_img").attr("src","resources/img/join/cancel_red.png");
			redLinePwd.css("border-bottom","2px solid red");
	} else {
		var bluePwd = $("#blue_check_pwd");
		bluePwd.css("display","block");
		pwdErr1.css("display","none");
		pwdErr2.css("display","none");
		pwdErr3.css("display","none");
	}

	
	// 비밀번호 확인 검사
	var redLinePwdChk = $("#member_info_pw_chk");
	var pwdErr4 = $("#pwdErr4");
	
	if(pwd2 === "") {
		pwdErr4.css("display","block");
		pwdErr4.removeClass("gray");
		$("#pwdErr4 .cancel_img").attr("src","resources/img/join/cancel_red.png");
		redLinePwdChk.css("border-bottom","2px solid red");
	// 비밀번호와 비밀번호 확인 동일 여부
	} else if(pwd1 != pwd2) {
		isValidation = false;
		pwdErr4.css("display","block");
		pwdErr4.removeClass("gray");
		$("#pwdErr4 .cancel_img").attr("src","resources/img/join/cancel_red.png");
		redLinePwdChk.css("border-bottom","2px solid red");
	} else {
		var bluePwdChk = $("#blue_check_pwd_chk");
		bluePwdChk.css("display","block");
		pwdErr4.css("display","none");
	}
	
	// 이름 검사
	checkName();
	
	// 휴대폰 번호 검사
	checkPhone();
	
	// 약관동의 필수 항목 검사
	// 체크된 필수항목 개수
	var cnt = 0;
	// 유효성 검사 일치하지 않을 경우 띄울 태그
	var agreeErr = $("#agreeErr");
	
	for(var i = 1; i <= $('.requiredAgree').length; i++) {
		var chkYn = $('#requiredAgree' + i).is(':checked');
		
		if(!chkYn) {
			isValidation = false;
			agreeErr.css("display","block");
		} else {
			cnt++;
		}
	}
	
	if(cnt === 5) {
		agreeErr.css("display","none");
	}
	
	// 유효성 검사가 실패되었을 때 폼의 제출 기능을 중지
	/*if(!isValidation) {
		event.preventDefault();
	}*/
}












