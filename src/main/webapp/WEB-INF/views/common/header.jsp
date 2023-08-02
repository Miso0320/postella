<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
	</head>
	<body>
		<header>
			<!-- 최상단 메뉴 -->
	      	<article id="header_top_bar">
	      		<section>
		      		<menu id="header__menu">
		      			<ul class="header_outer_ul">
		      				<li class="header_list" id="header_login">
		      					<a href="login.jsp">로그인</a>
		      				</li>
		      				<li class="header_list" id="header_join">
		      					<a href="joinForm.jsp">회원가입</a>
		      				</li>
		      				<li class="header_dropdown_list">
		      					<a href="#">고객센터</a>
		      					<ul class="header_enter">
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
		      				<a href="#"><img class="header_category_img" src="${pageContext.request.contextPath}/resources/img/header/category2.png" alt="카테고리"></a>
		      				<ul class="header_enter">
		      					<li><a href="#"><img class="left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/fashion.png" alt="포토엽서">포토엽서</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/beauty.png" alt="디자인패턴엽서">디자인패턴엽서</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/baby.png" alt="그림/일러스트엽서">그림/일러스트엽서</a></li>
		                        <li><a href="#"><img class="left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/fruit.png" alt="캘리그라피엽서">캘리그라피엽서</a></li>
		      				</ul>
	      				</li>
	      			</ul>
	      		</div>
	      		
	      		<!-- 오른쪽 헤더 -->
	      		<div id="header_right_title">
	      			<div class="header_top_title_search">
	      				<!-- 쿠팡 로고 -->
	      				<div id="header_title">
	      					<h1>
		      					<a href="product.jsp"><img class="header_logo" src="${pageContext.request.contextPath}/resources/img/header/coupang.png" alt="쿠팡로고"></a>
		      				</h1>
	      				</div>
	      				
	      				<!-- 검색창 -->
	      				<div class="header_search_product header_every_a_font">
	      					<!-- <select class="select_menu" value="전체">
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
	      					</select> -->
	      					<input type="text" class="header_text_search" placeholder="찾고 싶은 상품을 검색해보세요!"/>
	      					<%-- <a href="#"><img class="header_search_img" src="${pageContext.request.contextPath}/resources/img/header/search_mic.png" alt="음성검색"></a> --%>
	      					<a href="#"><img class="header_search_img" src="${pageContext.request.contextPath}/resources/img/header/search_icon.png" alt="찾기"></a>
	      				</div>
	      				
	      				<!-- 오른쪽 메뉴(마이쿠팡, 장바구니) -->
	      				<div class="header_my_menu header_every_a_font">
	      					<!-- 마이쿠팡 -->
	      					<li class="header_dropdown_list">
		      					<div class="header_right_my_menu_inner">
		      						<a href="myOrderList.jsp">
		      							<span><img class="header_right_menu_icon" src="${pageContext.request.contextPath}/resources/img/header/mycoupang.png" alt="마이쿠팡메뉴"></span>
		      							<span >마이쿠팡</span>
		      						</a>
		      						<ul class="header_enter_bubble">
			      						<li><a href="#">주문목록</a></li>
			      						<li><a href="#">취소/반품</a></li>
			      						<li><a href="#">찜 리스트</a></li>
		      						</ul>
		      					</div>
	      					</li>
	      					
	      					<!-- 장바구니 -->
	      					<li class="header_dropdown_list">
		      					<div class="header_right_my_menu_inner" id="cart">
		      						<a href="cartNormal.jsp">
		      							<span><img class="header_right_menu_icon" src="${pageContext.request.contextPath}/resources/img/header/cart.png" alt="장바구니메뉴"></span>
			      						<span>장바구니</span>
		      						</a>
		      						<ul class="header_enter_bubble">
			      						<li>장바구니에 담긴 상품이 없습니다.</li>
		      						</ul>
		      					</div>
	      					</li>
	      				</div>
	      			</div>
	      		</div>
	      	</section>
		</header>
	</body>
</html>