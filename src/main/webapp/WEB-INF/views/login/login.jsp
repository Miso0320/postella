<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 테스트 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../../favicon.ico" type="image/x-icon">
		<title>로그인</title>
		
				<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_cyborg.css">
		<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
		<script src="login.js"></script>
	</head>
	<body>
		<div class="main-login" style="margin: 0 auto; max-width: 460px; padding: 0 5px;"> 
			<div class="d-flex justify-content-center login-h m-3">
				<h1>
					<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px" height="50px"></img></a>
				</h1>
			</div>
			<div class="card m-3" style="border:none;">
				<div class="card-body">
				<!-- submit 이벤트를 처리하는 핸들러 지정 -->
					<form id="login" name="login" action="login" method="post" class="mx-3">
						<div class="form-group userIdentity">
							<div class="input_email d-flex">
								<label for="email"></label>
								<input type="email" name="us_email" class="form-control" placeholder="아이디" value="${users.us_email}">
						</div>
						<span id="emailErr1" class="errorMsg text-danger d-none small">이메일은 필수 입력 사항입니다.</span>
						<span id="emailErr2" class="errorMsg text-danger d-none small">이메일 형식이 맞지 않습니다.</span>
						<c:if test="${errorEmail2 != null}">
								<span class="errorMsgDb2" style="color:red;"> ${errorEmail2}</span>
						</c:if>
						</div>
						<div class="form-group pwd">
							<div class="input_pwd d-flex">
								<label for="pwd"></label>
							<div style="width:100%">
								<input type="password" name="us_password" class="form-control" placeholder="비밀번호" value="${users.us_password}" id="pwd" name="pwd">
							</div>
							</div>
						   <span id="pwdErr1" class="errorMsg text-danger d-none small">패스워드는 필수 입력 사항입니다.</span>
						   <span id="pwdErr2" class="errorMsg text-danger d-none small">패스워드는 8자 이상 입력해야 합니다.</span>
						   <c:if test="${errorPassword != null}">
							   <span class="errorMsgDb2" style="color:red;"> ${errorPassword}</span>
						   </c:if>
						</div>
						<div>
							<input type="checkbox" onclick="showPwd()" id="showPassword" style= "margin-bottom:20px;"><label for="showPassword">비밀번호 표시</label>
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
						<div class="buttons">		
						 <input type="submit" class="btn btn-primary" style="width:100%" value="로그인">
						  <hr/>
						 </div>
					</form>
				</div>
			</div>
		</div>		 		
	</body>
</html>
	<footer class="text-center">
		<div><small>첫 방문이신가요?</small></div>
		<div><small>회원가입 후 사용해 보세요.</small></div>
		<div><a href="join"><strong>▽회원가입하기▽</strong></a></div>
		<div>
              	<a href="join">
                      	<img src="${pageContext.request.contextPath}/resources/img/join/welcome.gif" width="96px" height="96px"></img>
              	</a>
		</div>
		<div style="font-size:12px">©Postella Corp. All rights reserved.</div>
	</footer>
	</body>
</html>