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
<script>
   function openAddAddressPage() {
   	addAdrChild = window.open('addAddress', '_blank', 'width=518, height=666, left=200, top=200');
   	addAdrChild.dataFromParent = "editAddress";
   }
   
   function addAddressClose() {
	addAdrChild.close();
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
	border: 2px solid #0073e9;
}

.address-card__marker--default {
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
	background-color: #fff;
	color: #0073e9;
	border: 1px solid #ccc;
	box-shadow: none;
	transition: box-shadow .25s ease;
	min-width: 68px;
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
	background-color: #0073e9;
	color: #fff;
	border: 0;
	box-shadow: inset 0 -2px 0 rgba(0, 0, 0, 0.38);
	transition: box-shadow .25s ease;
	min-width: 70px;
	font-weight: bold;
	margin-left: 10px;
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
	background-color: #fff;
	color: #0073e9;
	border: 1px solid #ccc;
	box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
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

.address-card__body {
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

.address-card__title {
	font-size: 16px;
	line-height: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	font-weight: bold;
	color: #111;
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
				<div class="address-card address-card--picked">
					<div class="address-card__head">
						<div class="address-card__title">박쥐홍</div>
						<div class="address-card__fresh-mvp2">
							<span class="address-card__marker--default">기본배송지</span>
						</div>
					</div>
					<div class="address-card__body">
						<div class="address-card__text address-card__text--address">서울특별시 종로구 창경궁로 254 402호</div>
						<div class="address-card__text address-card__text--cellphone">010-2353-6621</div>
						<div class="address-card__text address-card__text--delivery-preference">문 앞</div>
					</div>
					<div class="address-card__foot">
						<button class="address-edit-btn" type="submit">
							<span class="addressbook__text">수정</span>
						</button>
						<button class="address-choose-btn" type="submit">
							<span class="addressbook__text">선택</span>
						</button>
					</div>
				</div>
				<div class="addressbook__button-fixer">
					<button type="submit" class="addressbook__button--new _addressBookFormSubmit" onclick="openAddAddressPage()">
						<i class="addressbook__icon--plus"></i> 
						<span class="addressbook__text"> 배송지 추가 </span>
					</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>