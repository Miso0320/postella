window.onload = init;

function init() {

	
	var joinForm = document.querySelector("#joinForm");
	joinForm.addEventListener("submit", checkValidation);
}



function checkValidation() {
	let isValidation = true;
	
	//모든 에러 메시지를 보여주지 않도록 초기화
	var errorMsgs = document.querySelectorAll(".errorMsg");
	errorMsgs.forEach(el => el.classList.add("d-none"));
		
	//email 검사
	var email = document.querySelector("#email").value;
	if(email === "") {
		isValidation = false;
		var emailErr1 = document.querySelector("#emailErr1");
		emailErr1.classList.remove("d-none");
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 	var result = pattern.test(email);
	 	if(!result) {
	 		isValidation = false;
	 		var emailErr2 = document.querySelector("#emailErr2");
	 		emailErr2.classList.remove("d-none");
	 	}
	}
 	
 	//pwd 검사
	var pwd = document.querySelector("#pwd").value;
	if(pwd === "") {
		isValidation = false;
		var pwdErr1 = document.querySelector("#pwdErr1");
		pwdErr1.classList.remove("d-none");
	} else if(pwd.length < 8) {
	 		isValidation = false;
	 		var pwdErr2 = document.querySelector("#pwdErr2");
	 		pwdErr2.classList.remove("d-none");
	}

	 
	 //유효성검사가 실패했을 때 폼의 제출기능을 중지
	 if(!isValidation) {
		 event.preventDefault();
	 } 
}