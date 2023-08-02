<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon">
		<title>큐팡!</title>
		
		<!-- script : 작성된 자바스크립트 가져올 때(외부, 내부 모두 가능) -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="myOrderList.css">
		<script src="myOrderList.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<section class="order_list_container" id="order_list_container">
			<!-- 전체 내용 -->
			<div class="order_list_wrap" id="order_list_wrap">
				<!--  왼쪽 마이쿠팡 메뉴 -->
				<div class="left_my_menu" id="left_my_menu">
					<!-- 마이쿠팡 로고 -->
					<div class="my_menu_logo" id="my_menu_logo">
						<span>MY쿠팡</span>
					</div>
					
					<!-- 마이쿠팡 좌측 메뉴 -->
					<div class="my_menu" id="my_menu">
						<!-- MY 쇼핑 -->
						<div class="my_inner_menu" id="my_shopping">
							<div class="my_inner_title">MY 쇼핑</div>
							<div class="my_inner_small_menu">
								<ul>
									<li>주문목록/배송조회</li>
									<li>취소/반품/교환/환불내역</li>
									<li>와우 멤버십</li>
									<li>로켓프레시 프레시백</li>
									<li>정기배송관리</li>
									<li>영수중 조회/출력</li>
								</ul>
							</div>
						</div>
						<!-- MY 혜택 -->
						<div class="my_inner_menu" id="my_benefit">
							<div class="my_inner_title">MY 혜택</div>
							<div class="my_inner_small_menu">
								<ul>
									<li>할인쿠폰</li>
									<li>쿠팡캐시/기프트카드</li>
								</ul>
							</div>
						</div>
						<!-- MY 활동 -->
						<div class="my_inner_menu" id="my_act">
							<div class="my_inner_title">MY 활동</div>
							<div class="my_inner_small_menu">
								<ul>
									<li>문의하기</li>
									<li>문의내역 확인</li>
									<li>리뷰관리</li>
									<li>찜 리스트</li>
								</ul>
							</div>
						</div>
						<!-- MY 정보 -->
						<div class="my_inner_menu" id="my_info">
							<div class="my_inner_title">MY 정보</div>
							<div class="my_inner_small_menu">
								<ul>
									<li>개인정보확인/수정</li>
									<li>결제수단·쿠페이 관리</li>
									<li>배송지 관리</li>
								</ul>
							</div>
						</div>
					</div>
					
					<!-- 좌측 하단 고객메뉴 -->
					<div class="custom_left_menu" id="custom_left_menu">
						<ul>
							<!-- 쿠팡문의 -->
							<li>
								<a class="customer_menu_a">
									<span class="customer_menu_icon" id="coupang_inquiry">
									
									</span>
								</a>
							</li>
							<!-- 고객의 소리 -->
							<li>
								<a class="customer_menu_a">
									<span class="customer_menu_icon" id="customer_vos">
									
									</span>
								</a>
							</li>
							<!-- 취소/반품 안내 -->
							<li>
								<a class="customer_menu_a">
									<span class="customer_menu_icon" id="order_cancel_info">
									
									</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				
				<!-- 상단 마이쿠팡 메뉴 및 내용 -->
				<div class="upper_my_coupang_content">
					<!-- 상단 마이쿠팡 메뉴 -->
					<div class="upper_my_coupang_wrap">
						<ul class="upper_my_coupang">
							<li class="mycoupang_menu_select">
								<strong>미사용티켓</strong>
								<div class="mycoupang_font_grp">
									<a>
										<span>
											<span class="mycoupang_cnt">0</span>
											<span class="mycoupang_unit">장</span>
										</span>
									</a>
								</div>
							</li>
							<li class="mycoupang_menu_select">
								<strong>배송중</strong>
								<div class="mycoupang_font_grp">
									<a>
										<span>
											<span class="mycoupang_cnt">0</span>
											<span class="mycoupang_unit">개</span>
										</span>
									</a>
								</div>
							</li>
							<li class="mycoupang_menu_select">
								<strong>할인쿠폰</strong>
								<div class="mycoupang_font_grp">
									<a>
										<span>
											<span class="mycoupang_cnt">0</span>
											<span class="mycoupang_unit">장</span>
										</span>
									</a>
								</div>
							</li>
							<li class="coupang_money">
								<div class="mycoupang_money_font_grp">
									<strong>쿠페이 머니</strong>
									<a>
										<span class="mycoupang_money_cnt">0</span>
										<span class="mycoupang_money_unit">원</span>
									</a>
								</div>
								<div class="mycoupang_money_font_grp">
									<strong>쿠팡캐시</strong>
									<a>
										<span class="mycoupang_money_cnt">0</span>
										<span class="mycoupang_money_unit">원</span>
									</a>
								</div>
							</li>
						</ul>
					</div>
					
					<!-- 주문목록 내용 -->
					<div class="order_content">
						<!-- 주문목록 타이틀 -->
						<div class="order_title">
							<span>주문목록</span>
						</div>
					
						<!-- 검색창, 날짜 -->
						<div class="order_search_total">
							<!-- 검색창 -->
							<div>
								<div class="order_search">
									<div class="order_search_input">
										<input type="text" placeholder="주문한 상품을 검색할 수 있어요!">
									</div>
									<div class="order_search_img">
										<img alt="검색" src="img/myCoupang/find_icon.png">
									</div>
								</div>
							</div>
							<!-- 날짜별 보기 -->
							<div class="classification_date_wrap">
								<div class="classification_date">
									<div class="order_date_range order_date_range_select" id="recent_six_month">최근 6개월</div>
									<div class="order_date_range">2023</div>
									<div class="order_date_range">2022</div>
									<div class="order_date_range">2021</div>
									<div class="order_date_range">2020</div>
									<div class="order_date_range">2019</div>
									<div class="order_date_range">2018</div>
								</div>
							</div>
						</div>
						
						<!-- 상품별 분류 메뉴 -->
						<div class="product_classification_wrap">
							<div class="product_classification">
								<div class="product_classification_menu product_classification_menu_select" id="product_classification_total">전체</div>
								<div class="product_classification_menu" id="product_classification_delivery">배송상품</div>
								<div class="product_classification_menu" id="product_classification_travel">여행상품</div>
								<div class="product_classification_menu" id="product_classification_ticket">티켓상품</div>
							</div>
						</div>
						
						<!-- 주문내역(날짜별) -->
						<div id="order_list_for_date">
							<div class="order_content_date">
								<!-- 날짜 분류 -->
								<div class="order_date_grp">
									<div class="order_date">2023. 6. 30 주문</div>
									<div class="order_date_detail">
										<span>주문 상세보기</span>
										<img alt="주문상세보기" src="img/myCoupang/righr_arrow.png">
									</div>
								</div>
								
								<!-- 주문내역 -->
								<div class="order_list">
									<div class="order_list_content">
										<div class="order_list_content_title">
											<div class="order_list_content_inner_title">
												<span class="order_status_title">배송완료</span>
												<span class="order_status_date">7/1(토) 도착</span>
											</div>
											<div>
												<div>
													<button class="more_menu_btn">
														<div class="more_menu_btn_el"></div>
														<div class="more_menu_btn_el"></div>
														<div class="more_menu_btn_el"></div>
													</button>
												</div>
											</div>
										</div>
										
										<div class="order_list_content_item">
											<div class="content_item_img">
												<a>
													<img alt="상품사진" src="img/myCoupang/item_thumnail.jpg">
												</a>
											</div>
											<div class="content_item_title">
												<a>
													<img alt="로켓배송아이콘" src="img/myCoupang/rocket_icon.png">
													<span>프롬비 사일런트 스톰 저소음 휴대용 미니 선풍기, FA135B, 에어리블루</span>
												</a>
												<div class="content_item_info">
													<div class="content_item_price_qty">
														<span>16,800원</span>
														<span>1 개</span>
													</div>
													<div>
														<button class="cart_btn">장바구니 담기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="order_item_button_wrap">
										<div class="order_item_button">
											<button class="blue_button">배송조회</button>
											<button class="normal_button">교환, 반품 신청</button>
											<button class="normal_button">리뷰 작성하기</button>
										</div>
									</div>
								</div>
								
							</div>
							<!-- 목록 버튼 -->
							<div class="list_btn_wrap">
								<button>< 이전</button>
								<button>다음 ></button>
							</div>
						</div>
						
						<!-- 배송상품 주문 안내 -->
						<div class="product_guide_wrap">
							<!-- 배송상품 주문상태 안내 -->
							<div class="product_delivery_guide">
								<div class="product_delivery_guide_title">
									<div class="product_delivery_guide_title_text">
										<h4>배송상품 주문상태 안내</h4>
									</div>
									<div class="product_delivery_guide_title_detail">
										<a>자세한 내용 더보기 ></a>
									</div>
								</div>
								<!-- 결제완료 -->
								<div class="product_delivery_guide">
									<div class="product_delivery_guide_contents">
										<i class="product_delivery_guide_content next_arrow" id="product_delivery_guide_content_1"></i>
										<div class="product_delivery_guide_content_txt">
											<span>
												<span style="color: #111;">주문,결제,확인</span>
												<br>
												<span>이 완료되었습니다.</span>
											</span>
										</div>
									</div>
									<!-- 상품준비중 -->
									<div class="product_delivery_guide_contents">
										<i class="product_delivery_guide_content next_arrow" id="product_delivery_guide_content_2"></i>
										<div class="product_delivery_guide_content_txt">
											<span>
												<span>판매자가 발송할</span>
												<br>
												<span style="color: #111;">상품을 준비중</span>
												<span>입니다.</span>
											</span>
										</div>
									</div>
									<!-- 배송시작 -->
									<div class="product_delivery_guide_contents next_arrow">
										<i class="product_delivery_guide_content" id="product_delivery_guide_content_3"></i>
										<div class="product_delivery_guide_content_txt">
											<span>
												<span>상품준비가 완료되어</span>
												<br>
												<span>곧</span>
												<span style="color: #111;">배송</span>
												<span>될 </span>
												<span style="color: #111;">예정</span>
												<span>입니다.</span>
											</span>
										</div>
									</div>
									<!-- 배송중 -->
									<div class="product_delivery_guide_contents next_arrow">
										<i class="product_delivery_guide_content" id="product_delivery_guide_content_4"></i>
										<div class="product_delivery_guide_content_txt">
											<span>
												<span>상품이 고객님께</span>
												<br>
												<span style="color: #111;">배송중</span>
												<span>입니다.</span>
											</span>
										</div>
									</div>
									<!-- 배송완료 -->
									<div class="product_delivery_guide_contents">
										<i class="product_delivery_guide_content" id="product_delivery_guide_content_5"></i>
										<div class="product_delivery_guide_content_txt">
											<span>
												<span>상품이 주문자에게</span>
												<br>
												<span style="color: #111;">전달완료</span>
												<span>되었습니다.</span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<!-- 취소/반품/교환 신청 안내 -->
							<div class="cancel_guide_wrap">
								<div class="cancel_guide_title">
									<b>
										<img src="img/myCoupang/warning.png">
										<span style="color: #e52628;">취소/반품/교환 신청</span>
										<span>전 확인해주세요!</span>
									</b>
								</div>
								<div class="guide_cancel_title">
									<strong>취소</strong>
								</div>
								<div class="guide_cancel_content">-
									<span>여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,</span><br>
									<span style="margin-left: 7px;">취소 수수료를 확인하여 2일 이내(주말, 공휴일 제외) 처리 결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)</span><br>
									<span">- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다</span>
								</div>
								<div class="guide_cancel_title">
									<strong>반품</strong>
								</div>
								<div class="guide_cancel_content">
									<span>- 상품 수령 후 7일 이내 신청하여 주세요.</span><br>
									<span>- 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</span><br>
									<span>- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다.</span>
									<a style="color: #333333;">1:1문의하기></a>
								</div>
								<div class="guide_cancel_title">
									<strong>교환</strong>
								</div>
								<div class="guide_cancel_content">
									<span>- 상품의 교환 신청은 고객센터로 문의하여 주세요.</span>
									<a style="color: #333333;">1:1문의하기></a>
								</div>
							</div>
						</div>
						
						<!-- 하단광고영역 -->
						<div class="bottom_ad_wrap">
							<div class="bottom_ad">
								<img alt="검색" src="img/myCoupang/ad.jpg">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 우측 사이드 기능 -->
			<article class="order_list_right" id="order_list_right">
				<!-- 광고  -->
				<div class="right_side_ad">
					<a>
						<img alt="쿠팡only 광고" src="//image7.coupangcdn.com/image/displayitem/displayitem_8ad9b5e0-fd76-407b-b820-6494f03ffc31.jpg">
					</a>
				</div>
				<div class="right_side_ad">
					<a>
						<img alt="와우회원 여행할인 광고" src="//image8.coupangcdn.com/image/displayitem/displayitem_47593472-8835-4934-8336-8b167506a82c.jpg">
					</a>
				</div>
				<div class="right_side_ad">
					<a>
						<img alt="금주의 특가왕광고" src="//image9.coupangcdn.com/image/displayitem/displayitem_ad84783d-4811-49c6-99e8-79a1085b0d8b.png">
					</a>
				</div>
						
				<!-- 최근 본 상품 -->
				<section class="my_view">
					<div class="my_view_cart">
						<a>
							<em class="cart_count">1</em>
						</a>
					</div>
					<div class="my_view_product">
						<a>
							<em class="cart_count">20</em>
						</a>
					</div>
					<div class="recent_viewed_list">
						<ul class="recent_viewed_page">
							<li>
								<a class="recent_viewed_item">
									<img class="p_img" src="//thumbnail8.coupangcdn.com/thumbnails/remote/120x120ex/image/retail/images/893966166889831-9a771868-6b23-4510-bd40-16832fe15e4e.jpg">
									<span class="p_name">프롬비 사일런트 스톰 저소음 휴대용 미니 선풍기</span>
									<span class="p_price">
										<em class="sale_price">15,780</em>원
									</span>
								</a>
								<a class="delete_recent" href="#"></a>
							</li>
							<li>
								<a class="recent_viewed_item">
									<img class="p_img" src="//thumbnail8.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/c47d/54f86cfc64f5c878a94edc6207977d475259e8b85e131f6c030934671797.jpg">
									<span class="p_name">[천삼백케이] [아이스타일] [istyle]Korean Minhwa Postcard Set-정(Still)</span>
									<span class="p_price">
										<em class="sale_price">1,000</em>원
									</span>
								</a>
								<a class="delete_recent" href="#"></a>
							</li>
							<li>
								<a class="recent_viewed_item">
									<img class="p_img" src="//thumbnail9.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/c17a/f2c7600d98b0f2cef4f7a804e2441d21e1bb3e4250391b55c9f8b1e94545.jpg">
									<span class="p_name">일리 클라시코 미디움 플로우팩 캡슐커피, 6.7g</span>
									<span class="p_price">
										<em class="sale_price">64,500</em>원
									</span>
								</a>
								<a class="delete_recent" href="#"></a>
							</li>
							<li>
								<a class="recent_viewed_item">
									<img class="p_img" src="//thumbnail9.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/03ee/c22c163e5ea89841a77ec4682282e5dbaa1a783aecad75bfc714b8ad12d0.jpg">
									<span class="p_name">공룡 슬리퍼 Q-032 실내</span>
									<span class="p_price">
										<em class="sale_price">12,530</em>원
									</span>
								</a>
								<a class="delete_recent" href="#"></a>
							</li>
						</ul>
						<p class="recent_viewed_paging">
							<span>
								<strong>1</strong>/<em>5</em>
							</span>
							<span class="paging_btn_grp">
								<a class="paging_btn prev_btn"></a>
								<a class="paging_btn next_btn"></a>
							</span>
						</p>
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
	</body>
</html>