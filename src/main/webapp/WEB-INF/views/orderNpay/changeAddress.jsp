<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
		<title>배송지 변경</title>
		
		<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
		<script>
			//선택 버튼 클릭 이벤트
			function setReceiverInfo(button) {
				//선택한 주소 받는 사람 정보에 넣기
				addressCard = button.closest(".address-card");
			    window.opener.document.getElementById("receiver-name").innerText = addressCard.querySelector(".adr-name").innerText;
			    window.opener.document.getElementById("receiver-address").innerText = addressCard.querySelector(".adr-card-address").innerText; 
			    window.opener.document.getElementById("receiver-tel").innerText = addressCard.querySelector(".adr-card-tel").innerText;
			    window.opener.document.getElementById("delivery-request-spot").innerText = addressCard.querySelector(".adr-card-req").innerText;
			    
			    window.close();
			}
		</script>
		<style>
		.content-head {
			margin: 0;
			padding: 0;
			border: 0;
			display: block;
		}
		
		.content-head__title {
			margin: 0;
			border: 0;
			padding: 9px 0;
			color: #111;
			font-size: 16px;
			line-height: 22px;
			text-align: center;
			font-weight: bold;
		}
		
		.address-card.address-card--picked {
			z-index: 1;
			padding: 15px;
			border: 4px solid #0082b4;
		}
		
		.address-card {
			z-index: 1;
			padding: 15px;
			border: 1px solid #60b0ea;
			margin-bottom: 10px;
		}
		
		.default-mark {
			display: inline-block;
			height: 14px;
			margin-left: 2px;
			padding: 4px 4px 0;
			border: 1px solid #555;
			border-radius: 10px;
			font-size: 11px;
			font-family: dotum, sans-serif;
			line-height: 11px;
			vertical-align: middle;
			box-sizing: content-box !important;
			border-color: #555;
			color: #555;
			float: none;
			display: inline-block;
			margin-right: 4px;
		}
		
		.address-card__text {
			font-size: 15px;
			line-height: 19px;
			white-space: normal;
			margin-top: 4px;
			color: #111;
		}
		
		.address-edit-btn {
			filter: chroma(color = #000);
			display: inline-block;
			overflow: hidden;
			margin: 0;
			padding: 0;
			-webkit-border-radius: 2px;
			vertical-align: middle;
			box-sizing: content-box;
			font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
				nanumgothic, dotum, sans-serif;
			transition: box-shadow .25s ease;
			min-width: 68px;
			height: 20px;
		}
		
		.address-card__head {
			display: flex;
		}
		
		.address-choose-btn {
			display: inline-block;
			overflow: hidden;
			margin: 0;
			padding: 0;
			-webkit-border-radius: 2px;
			-moz-border-radius: 2px;
			vertical-align: middle;
			box-sizing: content-box;
			font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
				nanumgothic, dotum, sans-serif;
			transition: box-shadow .25s ease;
			min-width: 70px;
			font-weight: bold;
			margin-left: 10px;
			height: 20px;
		}
		
		.addressbook__button--new {
			overflow: hidden;
			margin: 10px 0px;
			padding: 0;
			-webkit-border-radius: 2px;
			vertical-align: middle;
			box-sizing: content-box;
			font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
				nanumgothic, dotum, sans-serif;
			transition: box-shadow .25s ease;
			display: block;
			text-align: center;
			width: 100%;
			height: 50px;
		}
		
		.address-card__foot {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
		}
		
		.address-card-body {
			margin: 10px 0px;
		}
		
		.addressbook__icon--plus {
			background-image:
				url(https://static.coupangcdn.com/image/static/identity/sprite-identity.x1.20180801.png);
			background-image:
				url(https://static.coupangcdn.com/image/static/identity/sprite-identity.20180801.svg),
				none;
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
			margin-top: -5px;
		}
		
		.content-wrapper {
			width: 500px;
			height: 600px;
			white-space: nowrap;
			padding: 10px;
			display: flex;
			flex-direction: column;
		}
		
		.content-body {
			width: inherit;
		}
		
		.adr-name {
			font-size: 16px;
			line-height: 20px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			display: block;
			font-weight: bold;
			color: #111;
			margin-right: 10px;
		}
		
		#delete-btn {
		    display: inline-block;
		    overflow: hidden;
		    margin: 0;
		    padding: 0;
		    -webkit-border-radius: 2px;
		    vertical-align: middle;
		    box-sizing: content-box;
		    font-family: apple sd gothic neo, malgun gothic, nanumbarungothic, nanumgothic, dotum, sans-serif;
		    transition: box-shadow .25s ease;
		    min-width: 68px;
		    height: 20px;
		 }
		</style>
	</head>
	<body>
		<div class="content-wrapper ">
			<div class="content-head content-head--fixed">
				<h1 class="content-head__title">배송지 선택</h1>
			</div>
			<div class="content-body content-body--fixed">
				<div class="content-body__corset ">
					<c:forEach var="da" items="${daList}" varStatus="status">
						<div class="address-card ${da.da_main == 'Y' ? 'address-card--picked' : ''}">
							<div class="address-card__head">
								<div class="adr-name">${da.da_name}</div>
								<c:if test="${da.da_main == 'Y'}">
									<div class="address-card__fresh-mvp2">
										<span class="default-mark">기본배송지</span>
									</div>
								</c:if>
							</div>
							<div class="address-card-body">
								<div class="adr-card-address">${da.da_adr}${da.da_detail_adr}</div>
								<div class="adr-card-tel">${da.da_tel}</div>
								<div class="adr-card-req">${da.da_req_type}</div>
							</div>
							<div class="address-card__foot">
								<button class="address-edit-btn btn btn-outline-info" type="submit" onclick="location.href='editAddress?da_no=${da.da_no}'">
									<span class="addressbook__text">수정</span>
								</button>
								 <button type="submit" class="addressbook__button--save _addressBookFormSubmit btn btn-outline-danger"  id="delete-btn" name="deliverAddress" onclick="location.href='deleteAddress?da_no=${da.da_no}'">
						            <span class="addressbook__text">삭제</span>
						        </button>
								<button class="address-choose-btn btn btn-info" type="button" onclick="setReceiverInfo(this)">
									<span class="addressbook__text">선택</span>
								</button>
							</div>
						</div>
					</c:forEach>
					<div class="addressbook__button-fixer">
						<button type="submit" class="btn btn-primary btn-lg btn-block addressbook__button--new _addressBookFormSubmit" onclick="location.href='addAddress'">
							<span class="addressbook__text">╋ 배송지 추가 </span>
						</button>
					</div>
				</div>
	
			</div>
		</div>
	</body>
</html>