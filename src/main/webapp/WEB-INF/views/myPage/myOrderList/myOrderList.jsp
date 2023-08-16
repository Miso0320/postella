<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/myOrderList.js"></script>

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
				
				<!-- 주문목록 타이틀 -->
				<h5 class="my_order_title my_order_text_color">주문목록</h5>
			
				<!-- 날짜별 분류 -->
				<div class="classification_date_wrap">
					<div class="classification_date" data-request-year="${param.requestYear}">
						<div class="order_date_range" id="recent_six_month">
							<c:set var="yearLink" value="myOrderList?requestYear=recent6Month"/>
							<c:if test="${not empty param.keyword}">
							    <c:set var="yearLink" value="${yearLink}&amp;keyword=${param.keyword}"/>
							</c:if>
							<a href="${yearLink}">최근 6개월</a>
						</div>
						<div class="order_date_range" id="2023year">
							<c:set var="yearLink" value="myOrderList?requestYear=2023year"/>
							<c:if test="${not empty param.keyword}">
							    <c:set var="yearLink" value="${yearLink}&amp;keyword=${param.keyword}"/>
							</c:if>
							<a href="${yearLink}">2023</a>
						</div>
						<div class="order_date_range" id="2022year">
							<c:set var="yearLink" value="myOrderList?requestYear=2022year"/>
							<c:if test="${not empty param.keyword}">
							    <c:set var="yearLink" value="${yearLink}&amp;keyword=${param.keyword}"/>
							</c:if>
							<a href="${yearLink}">2022</a>
						</div>
						<div class="order_date_range" id="2021year">
							<c:set var="yearLink" value="myOrderList?requestYear=2021year"/>
							<c:if test="${not empty param.keyword}">
							    <c:set var="yearLink" value="${yearLink}&amp;keyword=${param.keyword}"/>
							</c:if>
							<a href="${yearLink}">2021</a>
						</div>
						<div class="order_date_range" id="2020year">
							<c:set var="yearLink" value="myOrderList?requestYear=2020year"/>
							<c:if test="${not empty param.keyword}">
							    <c:set var="yearLink" value="${yearLink}&amp;keyword=${param.keyword}"/>
							</c:if>
							<a href="${yearLink}">2020</a>
						</div>
					</div>
				</div>
				
				<!-- 주문내역  -->
				<div id="order_list_for_date">
				    <c:forEach var="order" items="${orders}" varStatus="status">
				        <c:set var="prevIndex" value="${status.index - 1}" />
				        <c:set var="currentDate" value="${order.od_date}" />
				        <c:set var="prevDate" value="${orders[prevIndex].od_date}" />
				        
				        <c:if test="${currentDate != prevDate}">
				            <div class="order_content_date">
				                <!-- 날짜 분류 -->
				                <div class="order_date_grp">
				                    <div class="order_date">
				                        <fmt:formatDate value="${order.od_date}" pattern="yyyy.MM.dd"/> 주문
				                    </div>
				                    <%-- <div class="order_date_detail">
				                        <span>주문 상세보기</span>
				                        <img alt="주문상세보기" src="${pageContext.request.contextPath}/resources/img/myOrderList/righr_arrow.png">
				                    </div> --%>
				                </div>
				                
				                <!-- 주문내역 -->
				                <c:forEach var="orderList" items="${orders}" varStatus="subStatus">
				                    <c:if test="${subStatus.index > prevIndex && orderList.od_date == currentDate}">
				                        <div class="order_list">
				                            <div class="order_list_content">
				                                <div class="order_list_content_title">
				                                    <div class="order_list_content_inner_title">
				                                        <span class="order_status_title">${orderList.od_status}</span>
				                                    </div>
				                                </div>
				                                
				                                <div class="order_list_content_item">
				                                    <div class="content_item_img" data-prd-no="${orderList.prd_no}" data-us-no="${orderList.us_no}">
				                                        <a href="setDetailPage?prdNo=${orderList.prd_no}">
				                                       		<img alt="상품사진" src="data:${orderList.img_type};base64, ${orderList.encodedFile}">
				                                        </a>
				                                    </div>
				                                    <div class="content_item_title">
				                                        <a href="setDetailPage?prdNo=${orderList.prd_no}">
				                                            <span>${orderList.prd_name}</span>
				                                        </a>
				                                        <div class="content_item_info">
				                                            <div class="content_item_price_qty">
				                                                <span>${orderList.od_detail_price}원</span>
				                                                <span>${orderList.od_detail_qty} 개</span>
				                                            </div>
				                                            <!-- <div>
				                                                <button class="cart_btn" onclick="javascript:addCart()">장바구니 담기</button>
				                                            </div> -->
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="order_item_button_wrap">
				                                <div class="order_item_button">
				                                    <a href="#" class="btn btn-primary btn_size modal_txt">배송조회</a>
				                                    <a href="#" class="btn btn-outline-primary btn_size">교환, 반품 신청</a>
				                                    <a href="#" class="btn btn-outline-primary btn_size">리뷰 작성하기</a>
				                                    <a href="#" class="btn btn-outline-primary btn_size" data-toggle="modal" data-target="#deleteCk" data-od-detail-no="${orderList.od_detail_no}">주문내역 삭제</a>
				                                	<!-- 모달 -->
													<div class="modal" id="deleteCk" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title">주문내역 삭제</h5>
													        <a class="close" data-dismiss="modal" aria-label="Close">
													          <span aria-hidden="true">&times;</span>
													        </a>
													      </div>
													      <div class="modal-body">
													        <p class="modal_body_txt">정말 삭제하시겠습니까?</p>
													      </div>
													      <div class="modal-footer">
													        <a href="#" class="btn btn-primary modal_txt">삭제</a>
													        <a class="btn btn-secondary " data-dismiss="modal">취소</a>
													      </div>
													    </div>
													  </div>
													</div>
						                        </div>
			                                </div>
			                            </div>
				                    </c:if>
				                </c:forEach>
				            </div>
				        </c:if>
				    </c:forEach>
  						
				    <!-- 목록 버튼 -->
				    <div>
					  <ul class="pagination list_btn_wrap">
					    <li class="page-item">
					      <a class="page-link" href="myOrderList?pageNo=1&keyword=${param.keyword}&requestYear=${param.requestYear}">&laquo;</a>
					    </li>
					    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					    	<c:if test="${pager.pageNo != i}">
						    	<li class="page-item">
							      <a class="page-link" href="myOrderList?pageNo=${i}&keyword=${param.keyword}&requestYear=${param.requestYear}">${i}</a>
							    </li>
					    	</c:if>
					    	<c:if test="${pager.pageNo == i}">
						    	<li class="page-item active">
							      <a class="page-link" href="myOrderList?pageNo=${i}&keyword=${param.keyword}&requestYear=${param.requestYear}">${i}</a>
							    </li>
					    	</c:if>
					    </c:forEach>
					    <li class="page-item">
					      <a class="page-link" href="myOrderList?pageNo=${pager.totalPageNo}&keyword=${param.keyword}&requestYear=${param.requestYear}">&raquo;</a>
					    </li>
					  </ul>
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
								<img src="${pageContext.request.contextPath}/resources/img/myOrderList/warning.png">
								<span style="color: #e52628;">취소/반품/교환 신청</span>
								<span>전 확인해주세요!</span>
							</b>
						</div>
						<div class="guide_cancel_title">
							<strong>취소</strong>
						</div>
						<div class="guide_cancel_content">-
							<span style="margin-left: 7px;">- 취소 수수료를 확인하여 2일 이내(주말, 공휴일 제외) 처리 결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)</span><br>
							<span">- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다</span>
						</div>
						<div class="guide_cancel_title">
							<strong>반품</strong>
						</div>
						<div class="guide_cancel_content">
							<span>- 상품 수령 후 7일 이내 신청하여 주세요.</span><br>
							<span>- 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</span><br>
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
				
			</div>
		</div>
	</div>
	
	<!-- 우측 사이드 -->
	<article class="order_list_right" id="order_list_right">
		<!-- 장바구니 목록 -->
		<section class="my_view">
			<div class="my_view_cart">
				<a>
					<em class="cart_count">1</em>
				</a>
			</div>
			<div class="recent_viewed_list">
				<ul class="recent_viewed_page">
					<li>
						<a class="recent_viewed_item" href="detailView">
							<img class="p_img" src="//thumbnail8.coupangcdn.com/thumbnails/remote/120x120ex/image/retail/images/893966166889831-9a771868-6b23-4510-bd40-16832fe15e4e.jpg">
							<span class="p_name">프롬비 사일런트 스톰 저소음 휴대용 미니 선풍기</span>
							<span class="p_price">
								<em class="sale_price">15,780</em>원
							</span>
						</a>
						<a class="delete_recent" href="#"></a>
					</li>
					<li>
						<a class="recent_viewed_item" href="detailView">
							<img class="p_img" src="//thumbnail8.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/c47d/54f86cfc64f5c878a94edc6207977d475259e8b85e131f6c030934671797.jpg">
							<span class="p_name">[천삼백케이] [아이스타일] [istyle]Korean Minhwa Postcard Set-정(Still)</span>
							<span class="p_price">
								<em class="sale_price">1,000</em>원
							</span>
						</a>
						<a class="delete_recent" href="#"></a>
					</li>
					<li>
						<a class="recent_viewed_item" href="detailView">
							<img class="p_img" src="//thumbnail9.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/c17a/f2c7600d98b0f2cef4f7a804e2441d21e1bb3e4250391b55c9f8b1e94545.jpg">
							<span class="p_name">일리 클라시코 미디움 플로우팩 캡슐커피, 6.7g</span>
							<span class="p_price">
								<em class="sale_price">64,500</em>원
							</span>
						</a>
						<a class="delete_recent" href="#"></a>
					</li>
					<li>
						<a class="recent_viewed_item" href="detailView">
							<img class="p_img" src="//thumbnail9.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/03ee/c22c163e5ea89841a77ec4682282e5dbaa1a783aecad75bfc714b8ad12d0.jpg">
							<span class="p_name">공룡 슬리퍼 Q-032 실내</span>
							<span class="p_price">
								<em class="sale_price">12,530</em>원
							</span>
						</a>
						<a class="delete_recent" href="#"></a>
					</li>
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
