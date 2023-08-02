<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="header.css">
		<script src="header.js"></script>
	</head>
	<body>
		<header>
			<!-- 최상단 메뉴 -->
	      	<article id="top-bar">
	      		<section>
		      		<menu id="leftmenu">
		      			<ul class="header_outer_ul">
		      				<li class="header_list" id="header_bookmark">
		      					<a href="#">즐겨찾기</a>
		      				</li>
		      				<li class="header_dropdown_list" id="header_entry">
		      					<a href="#">입점신청</a>
		      					<img class="header_entry_img" src="img/header/arrow_down.png" alt="입점신청메뉴">
		      					<ul class="enter">
		      						<li><a href="#">오픈마켓</a></li>
		      						<li><a href="#">여행/티켓</a></li>
		      						<li><a href="#">로켓배송</a></li>
		      						<li><a href="#">제휴마케팅</a></li>
		      					</ul>
		      				</li>
		      			</ul>
		      		</menu>
		      		<menu id="rightmenu">
		      			<ul class="header_outer_ul">
		      				<li class="header_list" id="header_login">
		      					<a href="login.jsp">로그인</a>
		      				</li>
		      				<li class="header_list" id="header_join">
		      					<a href="joinForm.jsp">회원가입</a>
		      				</li>
		      				<li class="header_dropdown_list" id="header_cs_center">
		      					<a href="#">고객센터</a>
		      					<ul class="enter">
		      						<li><a href="#">자주묻는 질문</a></li>
		      						<li><a href="#">1:1 채팅문의</a></li>
		      						<li><a href="#">마음의 소리</a></li>
		      						<li><a href="#">취소 /반품 안내</a></li>
		      					</ul>
		      				</li>
		      			</ul>
		      		</menu>
	      		</section>
	      	</article>
	      	
	      	<!-- 중간 메뉴 -->
	      	<!-- 왼쪽 헤더(카테고리) -->
	      	<section class="top_section">
	      		<div id="left_header">
	      			<ul>
		      			<li class="header_dropdown_list">
		      				<a href="#"><img class="header_category_img" src="img/header/category2.png" alt="카테고리"></a>
		      				<ul class="enter">
		      					<li><a href="#"><img class="left_category_icon" src="img/header/fashion.png" alt="패션/의류잡화">패션/의류잡화</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/beauty.png" alt="뷰티">뷰티</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/baby.png" alt="출산/유아동">출산/유아동</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/fruit.png" alt="식품">식품</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/pot.png" alt="주방용품">주방용품</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/shampoo.png" alt="생활용품">생활용품</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/sofa.png" alt="홈인테리어">홈인테리어</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/camera.png" alt="가전디지털">가전디지털</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/ball.png" alt="스포츠/레저">스포츠/레저</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/car.png" alt="자동차용품">자동차용품</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/book.png" alt="도서/음반/DVD">도서/음반/DVD</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/toy.png" alt="완구/취미">완구/취미</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/pencil.png" alt="문구/오피스">문구/오피스</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="img/header/dog.png" alt="반려동물용품">반려동물용품</a></li>
		                    	<li><a href="#"><img class="left_category_icon" src="img/header/heart_purse.png" alt="헬스/건강식품">헬스/건강식품</a></li>
		      				</ul>
	      				</li>
	      			</ul>
	      		</div>
	      		
	      		<!-- 오른쪽 헤더 -->
	      		<div id="right_title">
	      			<div class="top_title_search">
	      				<!-- 쿠팡 로고 -->
	      				<div id="header_title">
	      					<h1>
		      					<a href="product.jsp"><img class="logo" src="img/header/coupang.png" alt="쿠팡로고"></a>
		      				</h1>
	      				</div>
	      				
	      				<!-- 검색창 -->
	      				<div class="search_product every_a_font">
	      					<select class="select_menu" value="전체">
	      						<option>전체</option>
		      					<option>여성패션</option>
		      					<option>남성패션</option>
		      					<option>남녀 공용 의류</option>
		      					<option>유아동패션</option>
		      					<option>뷰티</option>
		      					<option>출산/유아동</option>
		      					<option>식품</option>
		      					<option>주방용품</option>
		      					<option>생활용품</option>
		      					<option>홈인테리어</option>
		      					<option>가전디지털</option>
		      					<option>스포츠/레저</option>
		      					<option>자동차용품</option>
		      					<option>도서/음반/DVD</option>
		      					<option>완구/취미</option>
		      					<option>문구/오피스</option>
		      					<option>헬스/건강식품</option>
		      					<option>국내여행</option>
		      					<option>장마 준비</option>
		      					<option>로켓설치</option>
		      					<option>공간별 집꾸미기</option>
	      					</select>
	      					<input type="text" class="text_search" placeholder="찾고 싶은 상품을 검색해보세요!"/>
	      					<a href="#"><img class="search_img" src="img/header/search_mic.png" alt="음성검색"></a>
	      					<a href="#"><img class="search_img" src="img/header/search_icon.png" alt="찾기"></a>
	      				</div>
	      				
	      				<!-- 오른쪽 메뉴(마이쿠팡, 장바구니) -->
	      				<div class="right_my_menu every_a_font">
	      					<!-- 마이쿠팡 -->
	      					<li class="header_dropdown_list">
		      					<div class="right_my_menu_inner" id="mycoupang">
		      						<a href="myOrderList.jsp">
		      							<span><img class="right_menu_icon" id="mycoupang_icon" src="img/header/mycoupang.png" alt="마이쿠팡메뉴"></span>
		      							<span >마이쿠팡</span>
		      						</a>
		      						<ul class="enter_bubble">
			      						<li><a href="#">주문목록</a></li>
			      						<li><a href="#">취소/반품</a></li>
			      						<li><a href="#">찜 리스트</a></li>
		      						</ul>
		      					</div>
	      					</li>
	      					
	      					<!-- 장바구니 -->
	      					<li class="header_dropdown_list">
		      					<div class="right_my_menu_inner" id="cart">
		      						<a href="cartNormal.jsp">
		      							<span><img class="right_menu_icon" id="cart_icon" src="img/header/cart.png" alt="장바구니메뉴"></span>
			      						<span>장바구니</span>
		      						</a>
		      						<ul class="enter_bubble">
			      						<li>장바구니에 담긴 상품이 없습니다.</li>
		      						</ul>
		      					</div>
	      					</li>
	      				</div>
	      			</div>
	      			
	      			<!-- 내비게이션 바 -->
	      			<div id="gnb_menu">
	      				<!-- <div>
	      					<img class="menu_img" id="left_move" src="img/header/gnb_left.png" alt="왼쪽이동">
	      				</div> -->
	      				<ul class="every_a_font" id="gnb_menu_list">
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-rocket.png" alt="로켓배송">
	      							<span>로켓배송</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-rocketfresh.png" alt="로켓프레시">
		      						<span>로켓프레시</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
		      						<img class="menu_img" src="img/header/menu-biz.png" alt="쿠팡비즈">
		      						<span>쿠팡비즈</span>
		      					</a>
		      				</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-rocketjikgu.png" alt="로켓직구">
		      						<span>로켓직구</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-blank.png" alt="골드박스">
		      						<span>골드박스</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-blank.png" alt="와우회원할인">
		      						<span>와우회원할인</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-blank.png" alt="이벤트/쿠폰">
		      						<span>이벤트/쿠폰</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-return.png" alt="반품마켓">
		      						<span>반품마켓</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-goodmarket.png" alt="착한상점">
		      						<span>착한상점</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-blank.png" alt="기획전">
		      						<span>기획전</span>
	      						</a>
	      					</li>
	      					<li>
	      						<a href="#">
	      							<img class="menu_img" src="img/header/menu-tripticket.png" alt="여행티켓">
		      						<span>여행티켓</span>
	      						</a>
	      					</li>
	      				</ul>
	      				<!-- <div>
	      					<img class="menu_img" src="img/header/gnb_right.png" alt="오른쪽이동">
	      				</div> -->
	      			</div>
	      		</div>
	      	</section>
	      	
	      	<!-- 카테고리 표시바 -->
	      	<!-- <article id="low-bar">
	      		<div class="every_a_font" id="low_bar_list">
	      			<a href="#">쿠팡 홈</a>
	      			<span>></span>
	      			<a href="#">문구/오피스</a>
	      			<span>></span>
	      			<a href="#">카드/엽서/봉투</a>
	      			<span>></span>
	      			<a href="#">엽서</a>
	      		</div>
	      	</article> -->
	      	
		</header>
	</body>
</html>