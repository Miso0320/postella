<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
		<title>회원가입</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
		<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
	</head>
	<body>
		<div class="every_array">
			<!-- header -->
			<header class="join_header">
				<a href="productGroup"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="200px"></a>
			</header>
			
			<form id="join" name="join" action="join" method="post" >
				<!-- 가입정보 입력란 -->
				<div class="member_main">
					<div class="member_title">회원정보를 입력해주세요</div>
					<div class="member_insert">
						<!-- 이메일(아이디) 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_id">
								<div class="member_icon">
									<img src="${pageContext.request.contextPath}/resources/img/join/member_email.JPG" >
								</div>
								<label for="us_email">
									<input type="text" placeholder="아이디(이메일)" id="email" name="us_email" value="${users.us_email}">
								</label>
								<img class="blue_check" id="blue_check_email" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
							</div>
							<span id="emailErr1" class="errorMsg">이메일을 입력하세요.</span>
							<span id="emailErr2" class="errorMsg">이메일을 올바르게 입력해주세요.</span>
							<c:if test="${errorEmail != null}">
								<span class="errorMsgDb"> ${errorEmail}</span>
							</c:if>
						</div>
						
						<!-- 비밀번호 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_pw">
								<span class="member_icon">
									<img src="${pageContext.request.contextPath}/resources/img/join/member_pw.JPG">
								</span>
								<label for="us_password">
									<input type="password" placeholder="비밀번호" id="pwd1" name="us_password" value="${users.us_password}">
								</label>
								<img class="blue_check" id="blue_check_pwd" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
							</div>
							<span id="pwdErr1" class="errorMsg gray"><img class="cancel_img" src="${pageContext.request.contextPath}/resources/img/join/cancel_gray.png">영문/숫자/특수문자 2가지 이상 조합 (8~20자)</span>
							<span id="pwdErr2" class="errorMsg gray"><img class="cancel_img" src="${pageContext.request.contextPath}/resources/img/join/cancel_gray.png">3개 이상 연속되거나 동일한 문자/숫자 제외</span>
							<span id="pwdErr3" class="errorMsg gray"><img class="cancel_img" src="${pageContext.request.contextPath}/resources/img/join/cancel_gray.png">아이디(이메일) 제외</span>
						</div>
						
						<!-- 비밀번호 확인 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_pw_chk">
								<span class="member_icon">
									<img src="${pageContext.request.contextPath}/resources/img/join/member_pw_chk.JPG">
								</span>
								<label>
									<input type="password" placeholder="비밀번호 확인" id="pwd2" value="${users.us_password}">
								</label>
								<img class="blue_check" id="blue_check_pwd_chk" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
							</div>
							<span id="pwdErr4" class="errorMsg gray"><img class="cancel_img" src="${pageContext.request.contextPath}/resources/img/join/cancel_gray.png">확인을 위해 새 비밀번호를 다시 입력해주세요.</span>
						</div>
						
						<!-- 이름 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_name">
								<span class="member_icon">
									<img src="${pageContext.request.contextPath}/resources/img/join/member_name.JPG">
								</span>
								<label for="us_name">
									<input type="text" placeholder="이름" id="uname" name="us_name" value="${users.us_name}">
								</label>
								<img class="blue_check" id="blue_check_name" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
							</div>
							<span id="unameErr" class="errorMsg">이름을 정확히 입력하세요.</span>
						</div>
						
						<!-- 휴대폰 번호 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_phone">
								<span class="member_icon">
									<img src="${pageContext.request.contextPath}/resources/img/join/member_phone.JPG">
								</span>
								<label for="us_tel">
									<input type="text" placeholder="휴대폰 번호" id="phone" name="us_tel" oninput="oninputPhone(this)" value="${users.us_tel}">
								</label>
								<img class="blue_check" id="blue_check_phone" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
							</div>
							<span id="numErr" class="errorMsg">휴대폰 번호를 정확하게 입력하세요.</span>
							<c:if test="${errorTel != null}">
								<span class="errorMsgDb"> ${errorTel}</span>
							</c:if>
						</div>
					</div>
						
						
					<hr>
					
					<!-- 약관 동의 -->
					<div class="member_agree_group">
						<div class="agree_all">
							<input type="checkbox" class="all_check" name="all_check"><label for="all_check" style="font-size: 16px; font-weight: bold;"> 모두 확인하였으며 동의합니다.</label>
							<div style="width: 400px;">
								<div class="agree_info">전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며, 개별적으로 동의를 선택하실 수 있습니다. 선택 항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다.</div>
							</div>
							<span id="agreeErr" class="errorMsg"><img class="cancel_img" src="${pageContext.request.contextPath}/resources/img/join/warning_icon.png" >필수 항목에 모두 동의해주세요</span>
						</div>
						<div class="agreement">
							<div class="agree_chk">
								<div class="check_element">
									<div>
										<input type="checkbox" class="chBox requiredAgree" id="requiredAgree1" name="ag_age" ><label for="ag_age"> [필수] 만 14세 이상입니다</label>
									</div>
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="chBox requiredAgree" id="requiredAgree2" name="ag_use"><label for="ag_use"> [필수] 포스텔라 이용약관 동의</label>
									</div>
									<img class="join_right_arrow" src="${pageContext.request.contextPath}/resources/img/join/right_arrow.png">
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="chBox requiredAgree" id="requiredAgree3" name="ag_elec"><label for="ag_elec"> [필수] 전자금융거래 이용약관 동의</label>
									</div>
									<img class="join_right_arrow" src="${pageContext.request.contextPath}/resources/img/join/right_arrow.png">
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="chBox requiredAgree" id="requiredAgree4" name="ag_info"><label for="ag_info"> [필수] 개인정보 수집 및 이용 동의</label>
									</div>
									<img class="join_right_arrow" src="${pageContext.request.contextPath}/resources/img/join/right_arrow.png">
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="chBox requiredAgree" id="requiredAgree5" name="ag_three"><label for="ag_three"> [필수] 개인정보 제3자 제공 동의</label>
									</div>
									<img class="join_right_arrow" src="${pageContext.request.contextPath}/resources/img/join/right_arrow.png">
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="chBox marketing_ck" name="ag_ma"><label for="ag_ma"> [선택] 마케팅 목적의 개인정보 수집 및 이용 동의</label>
									</div>
									<img class="join_right_arrow" src="${pageContext.request.contextPath}/resources/img/join/right_arrow.png">
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="chBox marketing_all_check" name="ag_adv"><label for="ag_adv"> [선택] 광고성 정보 수신 동의</label>
									</div>
									<img class="join_right_arrow" src="${pageContext.request.contextPath}/resources/img/join/right_arrow.png">
								</div>
								<div class="check_element adv_accept">
									<div>
										<input type="checkbox" class="chBox marketing_check" name="ag_sms"><label for="ag_sms"> [선택] 이메일 수신 동의</label>
									</div>
									<div>
										<input type="checkbox" class="chBox marketing_check" name="ag_email"><label for="ag_email"> [선택] SMS, SNS 수신동의</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					
						<div class="agree_btn">
							<input type="submit" value="동의하고 계속하기">
						</div>
					</div>
				</form>
				
				<!-- 판매자회원 안내 -->
				<!-- <div class="join_seller">
					<div>판매자이신가요?</div>
					<a href="#">판매자 회원 가입하기 ></a>
				</div> -->
			</div>
			<!-- footer -->
			<footer class="join_footer">
				<div>©POSTELLA Corp. All rights reserved.</div>
			</footer>
		</div>
	</body>
</html>