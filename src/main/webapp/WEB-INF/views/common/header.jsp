<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<title>POSTELLA</title>
		
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
		<script type="text/javascript" src="js/jquery.js"></script>
		
		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myOrderList.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailView.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productGroup.css"/>

    	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/snowfall.jquery.js"></script>
	</head>
	<body>
		<script type="text/javascript">
		    $(document).ready(function(){
		        $(document).snowfall();
		    });
		</script>
		<header>
			<!-- 최상단 메뉴 -->
	      	<article class="header_top_bar">
	      		<section class="header_top_section">
		      		<menu class="header_menu">
		      			<ul class="header_outer_ul">
		      				<li class="header_list" id="header_login">
		      					<div>
		      						<div>
					                     <c:if test="${userLogin == null}">
									   		<a href="${pageContext.request.contextPath}/login">로그인</a>
									      	</form>
									     </c:if>
									     <c:if test="${userLogin != null}">
									     	<a href="${pageContext.request.contextPath}/logout">로그아웃</a> 
									     	[환영합니다! ${userLogin.us_name}님]
					                     </c:if>	                     
					               </div>
		      					</div>
		      				</li>
		      				<c:if test="${userLogin == null}">
			      				<li class="header_list" id="header_join">
			      					<a href="join">회원가입</a>
			      				</li>
		      				</c:if>
		      				<li class="header_dropdown_list">
		      					<a href="adminIndex">판매자</a>
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
			      				<div class="category_img_container">
			      					<img class="header_category_img" src="${pageContext.request.contextPath}/resources/img/header/category.png" alt="카테고리">
			      				</div>
			      				<div class="header_every_a_font">카테고리</div>
			      				<ul class="header_enter">
			      					<li><a href="productGroup?prd_category=PHO"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard1.png" alt="포토엽서">포토엽서</a></li>
			                        <li><a href="productGroup?prd_category=DES"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard2.png" alt="디자인패턴엽서">디자인패턴엽서</a></li>
			                        <li><a href="productGroup?prd_category=CAL"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard3.png" alt="그림/일러스트엽서">그림/일러스트엽서</a></li>
			                        <li><a href="productGroup?prd_category=ILU"><img class="header_left_category_icon" src="${pageContext.request.contextPath}/resources/img/header/postcard4.png" alt="캘리그라피엽서">캘리그라피엽서</a></li>
			      				</ul>
		      				</li>
		      			</ul>
		      		</div>
		      		
      				<!-- 로고 -->
      				<div class="header_title header_every_a_font">
      					<h1>
	      					<a href="productGroup"><img class="header_logo" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고"></a>
	      				</h1>
      				</div>
      				
      				<!-- 검색창 -->
      				<form action="productGroup" method="get">
	      				<div class="header_search_product header_every_a_font">
	      					<input name="keyword" type="text" class="header_text_search" placeholder="찾고 싶은 상품을 검색해보세요!" value="${param.keyword}"/>
	      					<input type="hidden" name="kind" value="${param.kind}">
	      					<input type="hidden" name="prd_category" value="${param.prd_category}">
	      					<input type="hidden" name="brand" value="${param.brand}">
	      					<input type="hidden" name="status" value="${param.status}">
	      					<input type="hidden" name="message" value="${param.message}">
	      					<input type="hidden" name="pageNo" value="1">
	      					<button class="header_btn_sub" type="submit">
	      						<img class="header_search_img" src="${pageContext.request.contextPath}/resources/img/header/search_icon.png" alt="찾기">
	      					</button>
	      				</div>
      				</form>
   				
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