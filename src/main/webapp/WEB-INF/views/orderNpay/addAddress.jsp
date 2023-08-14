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
			oncomplete : function(data) {
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
.plusDelivery2 {
	border: 1px solid border;
}
</style>
</head>
<body>
	<div class="every_array">
		<form id="join" name="join" action="join" method="post">
			<!-- 가입정보 입력란 -->
			<div class="member_main">
				<div class="member_title">회원정보를 입력해주세요</div>
				<div class="member_insert">
					<!-- 이름 입력 -->
					<div class="insert_content">
						<div class="member_info" id="member_info_name">
							<span class="member_icon"> <img src="${pageContext.request.contextPath}/resources/img/join/member_name.JPG">
							</span> <label for="us_name"> <input type="text" placeholder="이름" id="uname" name="us_name" value="${users.us_name}">
							</label> <img class="blue_check" id="blue_check_name" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
						</div>
						<span id="unameErr" class="errorMsg">이름을 정확히 입력하세요.</span>
					</div>

					<!-- 휴대폰 번호 입력 -->
					<div class="insert_content">
						<div class="member_info" id="member_info_phone">
							<span class="member_icon"> <img src="${pageContext.request.contextPath}/resources/img/join/member_phone.JPG">
							</span> <label for="us_tel"> <input type="text" placeholder="휴대폰 번호" id="phone" name="us_tel" value="${users.us_tel}">
							</label> <img class="blue_check" id="blue_check_phone" src="${pageContext.request.contextPath}/resources/img/join/blue_check.png">
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
					</div>
				</div>
				<div class="agree_btn">
					<input type="submit" value="저장">
				</div>
			</div>
		</form>

	</div>
</body>
</html>