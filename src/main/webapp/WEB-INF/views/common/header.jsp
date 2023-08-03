<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
	</head>
	<body>
		<header>
			<!-- 최상단 메뉴 -->
	      	<article class="header_top_bar">
	      		<section class="header_top_section">
		      		<menu class="header_menu">
		      			<ul class="header_outer_ul">
		      				<li class="header_list" id="header_login">
		      					<a href="login">로그인</a>
		      				</li>
		      				<li class="header_list" id="header_join">
		      					<a href="join">회원가입</a>
		      				</li>
		      				<li class="header_dropdown_list">
		      					<a href="#">고객센터</a>
		      					<!-- <ul class="header_enter">
		      						<li><a href="#">자주묻는 질문</a></li>
		      						<li><a href="#">1:1 채팅문의</a></li>
		      						<li><a href="#">마음의 소리</a></li>
		      						<li><a href="#">취소 /반품 안내</a></li>
		      					</ul> -->
		      				</li>
		      			</ul>
		      		</menu>
	      		</section>
	      	</article>
	      	
	      	<!-- 중간 메뉴 -->
	      	<section class="header_middle_section">
	      		<div class="header_content">
			      	<!-- 카테고리 -->
		      		<div class="header_category">
		      			<ul>
			      			<li class="header_dropdown_list">
			      				<a href="#"><img class="header_category_img" src="${pageContext.request.contextPath}/resources/img/header/category2.png" alt="카테고리"></a>
			      				<ul class="header_enter">
			      					<li><a href="product"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard1.png" alt="포토엽서">포토엽서</a></li>
			                        <li><a href="product"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard2.png" alt="디자인패턴엽서">디자인패턴엽서</a></li>
			                        <li><a href="product"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard3.png" alt="그림/일러스트엽서">그림/일러스트엽서</a></li>
			                        <li><a href="product"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard4.png" alt="캘리그라피엽서">캘리그라피엽서</a></li>
			      				</ul>
		      				</li>
		      			</ul>
		      		</div>
		      		
      				<!-- 로고 -->
      				<div class="header_title">
      					<h1>
	      					<a href="product"><img class="header_logo" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고"></a>
	      				</h1>
      				</div>
      				
      				<!-- 검색창 -->
      				<div class="header_search_product header_every_a_font">
      					<input type="text" class="header_text_search" placeholder="찾고 싶은 상품을 검색해보세요!"/>
      					<a href="product"><img class="header_search_img" src="${pageContext.request.contextPath}/resources/img/header/search_icon.png" alt="찾기"></a>
      				</div>
   				
   					<!-- 마이메뉴 -->
   					<div class="header_my_menu header_every_a_font">
   						<a class="header_my_a" href="myOrderList">
   							<span><img class="header_my_icon" src="${pageContext.request.contextPath}/resources/img/header/my.png" alt="마이메뉴"></span>
   							<span>마이메뉴</span>
   						</a>
   					</div>
      					
   					<!-- 장바구니 -->
   					<div class="header_my_cart header_every_a_font">
   						<a class="header_my_a" href="cartNormal">
   							<span><img class="header_my_icon" src="${pageContext.request.contextPath}/resources/img/header/cart.png" alt="장바구니메뉴"></span>
    						<span>장바구니</span>
   						</a>
   					</div>
   				</div>
		      		
	      	</section>
		</header>
	</body>
</html>