<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon">
		<title>회원가입</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="joinForm.css">
		<script src="joinFrom.js"></script>
	</head>
	<body>
		<div class="every_array">
			<!-- header -->
			<header>
				<a href="#"><img src="img/joinForm/coupang_logo.svg" width="200px"></a>
			</header>
			
			<!-- 가입정보 입력란 -->
			<div class="member_main">
				<div class="member_title">회원정보를 입력해주세요</div>
				<form id="joinForm" name="joinForm" action="#" method="post" >
					<div class="member_insert">
						<!-- 이메일(아이디) 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_id">
								<div class="member_icon">
									<img src="img/joinForm/member_email.JPG" >
								</div>
								<label for="email">
									<input type="text" placeholder="아이디(이메일)" id="email" name="email">
								</label>
								<img class="blue_check" id="blue_check_email" src="img/joinForm/blue_check.png">
							</div>
							<span id="emailErr1" class="errorMsg">이메일을 입력하세요.</span>
							<span id="emailErr2" class="errorMsg">이메일을 올바르게 입력해주세요.</span>
						</div>
						
						<!-- 비밀번호 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_pw">
								<span class="member_icon">
									<img src="img/joinForm/member_pw.JPG">
								</span>
								<label for="pwd1">
								<input type="text" placeholder="비밀번호" id="pwd1" name="pwd1">
								</label>
								<img class="blue_check" id="blue_check_pwd" src="img/joinForm/blue_check.png">
							</div>
							<span id="pwdErr1" class="errorMsg gray"><img class="cancel_img" src="img/joinForm/cancel_gray.png">영문/숫자/특수문자 2가지 이상 조합 (8~20자)</span>
							<span id="pwdErr2" class="errorMsg gray"><img class="cancel_img" src="img/joinForm/cancel_gray.png">3개 이상 연속되거나 동일한 문자/숫자 제외</span>
							<span id="pwdErr3" class="errorMsg gray"><img class="cancel_img" src="img/joinForm/cancel_gray.png">아이디(이메일) 제외</span>
						</div>
						
						<!-- 비밀번호 확인 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_pw_chk">
								<span class="member_icon">
									<img src="img/joinForm/member_pw_chk.JPG">
								</span>
								<label for="pwd2">
									<input type="text" placeholder="비밀번호 확인" id="pwd2" name="pwd2">
								</label>
								<img class="blue_check" id="blue_check_pwd_chk" src="img/joinForm/blue_check.png">
							</div>
							<span id="pwdErr4" class="errorMsg gray"><img class="cancel_img" src="img/joinForm/cancel_gray.png">확인을 위해 새 비밀번호를 다시 입력해주세요.</span>
						</div>
						
						<!-- 이름 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_name">
								<span class="member_icon">
									<img src="img/joinForm/member_name.JPG">
								</span>
								<label for="uname">
									<input type="text" placeholder="이름" id="uname" name="uname">
								</label>
								<img class="blue_check" id="blue_check_name" src="img/joinForm/blue_check.png">
							</div>
							<span id="unameErr" class="errorMsg">이름을 정확히 입력하세요.</span>
						</div>
						
						<!-- 휴대폰 번호 입력 -->
						<div class="insert_content">
							<div class="member_info" id="member_info_phone">
								<span class="member_icon">
									<img src="img/joinForm/member_phone.JPG">
								</span>
								<label for="phone">
									<input type="text" placeholder="휴대폰 번호" id="phone" name="phone">
								</label>
								<img class="blue_check" id="blue_check_phone" src="img/joinForm/blue_check.png">
							</div>
							<span id="numErr" class="errorMsg">휴대폰 번호를 정확하게 입력하세요.</span>
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
							<span id="agreeErr" class="errorMsg"><img class="cancel_img" src="img/joinForm/warning_icon.png" >필수 항목에 모두 동의해주세요</span>
						</div>
						<div class="agreement">
							<div class="agree_chk">
								<div class="check_element">
									<div>
									<input type="checkbox" class="requiredAgree" id="requiredAgree1" name="checkBox"><label for="checkbox"> [필수] 만 14세 이상입니다</label>
									</div>
								</div>
								<div class="check_element agree_img">
									<div>
										<input type="checkbox" class="requiredAgree" id="requiredAgree2" name="checkBox"><label for="checkbox"> [필수] 쿠팡 이용약관 동의</label>
									</div>
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzIxMkIzNiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNS4xODEgMi4yMWMuMjMzLS4yNDguNjEtLjI3OC44NzgtLjA4MmwuMDY1LjA1MyA1LjY2NiA1LjMzNGMuMjYuMjQ0LjI3OC42NDUuMDU2LjkxMWwtLjA1Ni4wNi01LjY2NiA1LjMzM2MtLjI2OS4yNTItLjY5LjI0LS45NDMtLjAyOS0uMjMzLS4yNDctLjI0LS42MjYtLjAyOS0uODgxbC4wNTgtLjA2MUwxMC4zNiA4IDUuMjEgMy4xNTJjLS4yNDgtLjIzMy0uMjc4LS42MS0uMDgyLS44NzhsLjA1My0uMDY0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcxMTUgLTgxNikgdHJhbnNsYXRlKDcxMTUgODE2KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxNkwxNiAxNiAxNiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MTE1IC04MTYpIHRyYW5zbGF0ZSg3MTE1IDgxNikiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
								</div>
								<div class="check_element agree_img">
									<div>
									<input type="checkbox" class="requiredAgree" id="requiredAgree3" name="checkBox"><label for="checkbox"> [필수] 전자금융거래 이용약관 동의</label>
									</div>
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzIxMkIzNiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNS4xODEgMi4yMWMuMjMzLS4yNDguNjEtLjI3OC44NzgtLjA4MmwuMDY1LjA1MyA1LjY2NiA1LjMzNGMuMjYuMjQ0LjI3OC42NDUuMDU2LjkxMWwtLjA1Ni4wNi01LjY2NiA1LjMzM2MtLjI2OS4yNTItLjY5LjI0LS45NDMtLjAyOS0uMjMzLS4yNDctLjI0LS42MjYtLjAyOS0uODgxbC4wNTgtLjA2MUwxMC4zNiA4IDUuMjEgMy4xNTJjLS4yNDgtLjIzMy0uMjc4LS42MS0uMDgyLS44NzhsLjA1My0uMDY0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcxMTUgLTgxNikgdHJhbnNsYXRlKDcxMTUgODE2KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxNkwxNiAxNiAxNiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MTE1IC04MTYpIHRyYW5zbGF0ZSg3MTE1IDgxNikiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
								</div>
								<div class="check_element agree_img">
									<div>
									<input type="checkbox" class="requiredAgree" id="requiredAgree4" name="checkBox"><label for="checkbox"> [필수] 개인정보 수집 및 이용 동의</label>
									</div>
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzIxMkIzNiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNS4xODEgMi4yMWMuMjMzLS4yNDguNjEtLjI3OC44NzgtLjA4MmwuMDY1LjA1MyA1LjY2NiA1LjMzNGMuMjYuMjQ0LjI3OC42NDUuMDU2LjkxMWwtLjA1Ni4wNi01LjY2NiA1LjMzM2MtLjI2OS4yNTItLjY5LjI0LS45NDMtLjAyOS0uMjMzLS4yNDctLjI0LS42MjYtLjAyOS0uODgxbC4wNTgtLjA2MUwxMC4zNiA4IDUuMjEgMy4xNTJjLS4yNDgtLjIzMy0uMjc4LS42MS0uMDgyLS44NzhsLjA1My0uMDY0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcxMTUgLTgxNikgdHJhbnNsYXRlKDcxMTUgODE2KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxNkwxNiAxNiAxNiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MTE1IC04MTYpIHRyYW5zbGF0ZSg3MTE1IDgxNikiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
								</div>
								<div class="check_element agree_img">
									<div>
									<input type="checkbox" class="requiredAgree" id="requiredAgree5" name="checkBox"><label for="checkbox"> [필수] 개인정보 제3자 제공 동의</label>
									</div>
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzIxMkIzNiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNS4xODEgMi4yMWMuMjMzLS4yNDguNjEtLjI3OC44NzgtLjA4MmwuMDY1LjA1MyA1LjY2NiA1LjMzNGMuMjYuMjQ0LjI3OC42NDUuMDU2LjkxMWwtLjA1Ni4wNi01LjY2NiA1LjMzM2MtLjI2OS4yNTItLjY5LjI0LS45NDMtLjAyOS0uMjMzLS4yNDctLjI0LS42MjYtLjAyOS0uODgxbC4wNTgtLjA2MUwxMC4zNiA4IDUuMjEgMy4xNTJjLS4yNDgtLjIzMy0uMjc4LS42MS0uMDgyLS44NzhsLjA1My0uMDY0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcxMTUgLTgxNikgdHJhbnNsYXRlKDcxMTUgODE2KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxNkwxNiAxNiAxNiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MTE1IC04MTYpIHRyYW5zbGF0ZSg3MTE1IDgxNikiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
								</div>
								<div class="check_element agree_img">
									<div>
									<input type="checkbox" class="marketing_all_check" name="checkBox"><label for="checkbox"> [선택] 마케팅 목적의 개인정보 수집 및 이용 동의</label>
									</div>
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzIxMkIzNiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNS4xODEgMi4yMWMuMjMzLS4yNDguNjEtLjI3OC44NzgtLjA4MmwuMDY1LjA1MyA1LjY2NiA1LjMzNGMuMjYuMjQ0LjI3OC42NDUuMDU2LjkxMWwtLjA1Ni4wNi01LjY2NiA1LjMzM2MtLjI2OS4yNTItLjY5LjI0LS45NDMtLjAyOS0uMjMzLS4yNDctLjI0LS42MjYtLjAyOS0uODgxbC4wNTgtLjA2MUwxMC4zNiA4IDUuMjEgMy4xNTJjLS4yNDgtLjIzMy0uMjc4LS42MS0uMDgyLS44NzhsLjA1My0uMDY0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcxMTUgLTgxNikgdHJhbnNsYXRlKDcxMTUgODE2KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxNkwxNiAxNiAxNiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MTE1IC04MTYpIHRyYW5zbGF0ZSg3MTE1IDgxNikiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
								</div>
								<div class="check_element agree_img">
									<div>
									<input type="checkbox" class="marketing_all_check" name="checkBox"><label for="checkbox"> [선택] 광고성 정보 수신 동의</label>
									</div>
									<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzIxMkIzNiIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNS4xODEgMi4yMWMuMjMzLS4yNDguNjEtLjI3OC44NzgtLjA4MmwuMDY1LjA1MyA1LjY2NiA1LjMzNGMuMjYuMjQ0LjI3OC42NDUuMDU2LjkxMWwtLjA1Ni4wNi01LjY2NiA1LjMzM2MtLjI2OS4yNTItLjY5LjI0LS45NDMtLjAyOS0uMjMzLS4yNDctLjI0LS42MjYtLjAyOS0uODgxbC4wNTgtLjA2MUwxMC4zNiA4IDUuMjEgMy4xNTJjLS4yNDgtLjIzMy0uMjc4LS42MS0uMDgyLS44NzhsLjA1My0uMDY0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcxMTUgLTgxNikgdHJhbnNsYXRlKDcxMTUgODE2KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxNkwxNiAxNiAxNiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MTE1IC04MTYpIHRyYW5zbGF0ZSg3MTE1IDgxNikiLz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
								</div>
								<div class="check_element adv_accept">
									<div>
										<input type="checkbox" class="marketing_check" name="checkBox"><label for="checkAll"> [선택] 광고성 정보 수신 동의</label>
									</div>
									<div>
										<input type="checkbox" class="marketing_check" name="checkBox"><label for="checkAll"> [선택] 광고성 정보 수신 동의</label>
									</div>
									<div>
										<input type="checkbox" class="marketing_check" name="checkBox"><label for="checkAll"> [선택] 광고성 정보 수신 동의</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="agree_btn">
						<input type="submit" value="동의하고 계속하기">
					</div>
				</form>
				
				<!-- 비즈회원 안내 -->
				<div class="member_biz">
					<div>법인 고객이신가요?</div>
					<div>사업자 회원으로 전용 특가 혜택을 누려보세요.</div>
					<a href="#">쿠팡비즈 간편가입 ></a>
				</div>
			</div>
			<!-- footer -->
			<footer>
				<div>©Coupang Corp. All rights reserved.</div>
			</footer>
		</div>
	</body>
</html>