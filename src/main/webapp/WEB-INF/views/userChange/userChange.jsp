<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/userChange.js"></script>

<section class="order_list_container">
	<!-- 전체 내용 -->
	<div class="order_list_wrap" id="order_list_wrap">
		<!-- 네비게이터, 메인 컨테이너 -->
		<div class="upper_my_menu_content">
			<!-- 네비게이터, 메인 -->
			<div class="order_content">
				<!-- 네비게이터 -->
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary my_order_container">
				  <a class="navbar-brand" href="#">MY MENU</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				  <div class="collapse navbar-collapse" id="navbarColor01">
				    <ul class="navbar-nav mr-auto">
				      <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MY 쇼핑</a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="myOrderList">주문목록</a>
				          <a class="dropdown-item" href="#">취소내역</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="#">할인쿠폰</a>
				          <a class="dropdown-item" href="#">적립금</a>
				        </div>
				      </li>
				      <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MY 활동</a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="#">문의하기</a>
				          <a class="dropdown-item" href="#">문의내역 확인</a>
				          <a class="dropdown-item" href="#">리뷰관리</a>
				          <a class="dropdown-item" href="#">찜 리스트</a>
				        </div>
				      </li>
				      <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">MY 정보</a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="#">개인정보수정</a>
				          <a class="dropdown-item" href="#">배송지관리</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="#">문의하기</a>
				        </div>
				      </li>
				    </ul>
				    <form class="form-inline my-2 my-lg-0" action="myOrderList">
				      <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="검색할 상품명 입력" value="${param.keyword}">
				      <input type="hidden" name="requestYear" value="${param.requestYear}">
				      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				    </form>
				  </div>
				</nav>
				<div class="userInfoChange">
					<!-- 회원정보수정 타이틀 -->
					<h3 class="my_order_title my_order_text_color">회원정보수정</h3>
					<div class="userInfo">
						<table>
							<tbody>
								<tr>
									<th>아이디(이메일)</th>
									<td>${users.us_email}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${users.us_name}</td>
								</tr>
								<tr>
									<th>비밀번호 변경</th>
									<td style="padding:0px; border-top: none; border-bottom: none;"><div class="usermodify-password">
									    <table class="usermodify-input-table">
									        <tbody style="border-top: none;">
									        	<tr style="border-top: none;">
										            <th style="border-top: none;"> 현재 비밀번호</th>
										            <td style="border-top: none;">
										                <input type="password" class="usermodify-password-currentpassword-tf member__input-border"><div class="member__input-guide-area"></div>
										            </td>
										        </tr>
										        <tr>
										            <th>새 비밀번호</th>
										            <td>
										                <input type="password" class="usermodify-password-newpassword-tf member__input-border"><div class="member__input-guide-area"></div>
										            </td>
										        </tr>
										        <tr>
										            <th> 비밀번호 다시 입력</th>
										            <td>
										                <input type="password" class="usermodify-password-newpassword-confirm-tf member__input-border"><div class="member__input-guide-area"></div>
										            </td>
										        </tr>
										        <tr>
										            <td></td>
										            <td>
										                <button type="button" class="usermodify-password-submit btn btn-info">비밀번호 변경</button>
										            </td>
										        </tr>
										    </tbody>
									    </table>
									    
									</div>
									</td>
								</tr>
								<tr>
									<th>배송지</th>
									<td>
										<button class="delivery-address__popup-list-button btn btn-info" type="button" onclick="changeAddressOpen()">배송지변경</button>
									</td>
								</tr>
							</tbody>
						</table>	
					</div>				
					<div class="cancel-button">
				        <a href="productGroup" class="btn btn-secondary btn-sm m-2">나가기</a>
				    </div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 우측 사이드 -->
	<article class="order_list_right" id="order_list_right">
		<!-- 장바구니 목록 -->
		<section class="my_view">
			<div class="my_view_cart">
				<a href="cartNormal">
					<em class="cart_count">${totalCartCnt}</em>
				</a>
			</div>
			<div class="recent_viewed_list">
				<ul class="recent_viewed_page">
					<c:forEach var="cart" items="${carts}" varStatus="status">
						<c:if test="${status.index < 4}">
							<li>
								<a class="recent_viewed_item" href="setDetailPage?prdNo=${cart.prd_no}">
									<img class="p_img" src="data:${cart.img_type};base64, ${cart.encodedFile}">
									<span class="p_name">${cart.prd_name}</span>
									<span class="p_price">
										<em class="sale_price">${cart.prd_price}</em>원
									</span>
									<input type="hidden" class="p_prd_no" value="${cart.prd_no}">
								</a>
								<a class="delete_recent" href="deleteCartInOrderList?prd_no=${cart.prd_no}"></a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</section>
		
		<!-- 사이드바(스크롤 내려간 경우에만 나타남) -->
		<aside class="side_bar_grp">
			<a class="sideBtn" id="side_top" onclick="window.scrollTo({top:0, left:0})"></a>
			<a class="sideBtn" id="side_up"></a>
			<a class="sideBtn" id="side_down"></a>
		</aside>
	</article>
</section>		

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
