<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../../favicon.ico" type="image/x-icon">
		<title>로그인!!!</title>
		
				<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<script src="login.js"></script>
	</head>
	
	<!-- window의 load 이벤트가 발생했을 때 실행할 핸들러(처리 함수) 지정 //모든 리소스를 다 다운받고 난뒤 load이벤트가 발생-->
	<body>
		<div class="main-login" style="margin: 0 auto; max-width: 460px; padding: 0 5px;"> 
			 <div class="d-flex justify-content-center login-h m-3">
					<h1>
						<img src="img/coupang.png" width="200px" height="50px"></img>
					</h1>
			 </div>
			 <div class="card m-3" style="border:none;">
			 	<div class="card-body">
			 	<!-- submit 이벤트를 처리하는 핸들러 지정 -->
			 	<form id="joinForm" name="joinForm" action="product_final2.jsp" class="mx-3" novalidate action="#" method="post">
				  <div class="form-group userIdentity">
				  	<div class="input_email d-flex">
					    <label for="email"></label>
					    <div class="member_icon">
							<img src="img/member_email.JPG" width="20px">
						</div>
					    <input type="email" class="form-control" placeholder="아이디(이메일)" id="email" name="email">
					</div>
				    <span id="emailErr1" class="errorMsg text-danger d-none small">이메일은 필수 입력 사항입니다.</span>
				    <span id="emailErr2" class="errorMsg text-danger d-none small">이메일 형식이 맞지 않습니다.</span>
				  </div>
				  <div class="form-group pwd">
					  <div class="input_pwd d-flex">
					    <label for="pwd"></label>
					    <div class="member_icon">
							<img src="img/member_pw.JPG" width="20px">
						</div>
					    <div style="width:100%">
					    <input type="password" class="form-control" placeholder="비밀번호" id="pwd" name="pwd">
							<input type="checkbox" onclick="showPwd()">비밀번호 표시
							
							<script>
							function showPwd() {
							  var x = document.getElementById("pwd");
							  if (x.type === "password") {
							    x.type = "text";
							  } else {
							    x.type = "password";
							  }
							}
							</script>
					    </div>
					  </div>
					    <span id="pwdErr1" class="errorMsg text-danger d-none small">패스워드는 필수 입력 사항입니다.</span>
					    <span id="pwdErr2" class="errorMsg text-danger d-none small">패스워드는 8자 이상 입력해야 합니다.</span>
				  </div>
				  <div class="d-flex justify-content-between">
				  	<label for="autoLogin" class="autoBar">
				  			<input id="autoLogin" type="checkbox" value=/>
                                    <span class="member__checkbox__label">자동로그인</span>
                        </label>
	                        <a href="#" class="id-pwd-find d-flex justify-content-end">
	                        	<small>아이디, 비밀번호 찾기</small>
	                        	<img src="img/arrow-right.png" width="16px" height="16px"></img>
	                        </a>
				  </div>
				  <div class="buttons">		
					  <button type="submit" class="btn btn-primary" style="width:100%">로그인</button>
					  <hr/>
					  <button type="submit" class="btn btn-primary bg-light text-dark btn-outline-light"  onclick="location.href='joinForm.jsp'"
							style="width:100%">회원가입</button>
				  </div>
				</form>
			 	</div>
			 </div>
		</div>		 		
	</body>
</html>
			<footer class="text-center">
				<div><small>법인 고객이신가요?</small></div>
				<div><small>사업자 회원으로 전용 특가 혜택을 누려보세요.</small></div>
				<div>
                	<a href="#" class="id-pwd-find">
                        <small>쿠팡비즈 간편가입</small>
                        	<img src="img/arrow-right.png" width="16px" height="16px"></img>
                	</a>
				</div>
				<div style="font-size:12px">©Coupang Corp. All rights reserved.</div>
			</footer>
		</div>
	</body>
</html>