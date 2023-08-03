<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="icon" href="../favicon.ico" type="image/x-icon">
   <title>쿠팡! | 홀로그램 엽서</title>

   <!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>      
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>      
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <link rel="stylesheet" href="header.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailView.css">
   <script src="${pageContext.request.contextPath}/resources/js/detailView.js"></script>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   <main id="contents" class="contents_product">

      <!-- 상품 상세페이지 윗부분 -->
      <div class="prod-btop">
         <div class="prod-btop-main">
            <div class="prod-image">
               <!-- 왼쪽 썸네일들 -->
               <div class="prod-image-container">
                  <ul class="thum-list">
                  	<c:forEach var="thmImg" items="${thmImgs}">
		                     <li class="prod-image__item">
		                        <img class="thum-list-img" src="data:${thmImg.img_type};base64, ${thmImg.encodedFile}" alt="썸네일 리스트">
		                     </li>
					</c:forEach>
                  </ul>
                  <div class="thumbnail-container">
                     <div class="thumbnail-wrapper">
                        <img class="thumbnail_img" src="data:${thumnail.img_type};base64, ${thumnail.encodedFile}" alt="썸네일">
                        <span class="inner-frame"></span>
                     </div>
                  </div>
                  <div class="zoomed-div"></div>
               </div>
            </div>
            
            <!-- 썸네일 옆 상품정보 -->
            <div class="prod-top-right-detail">
               <div class="prod-buy-header">
                  <div class="title-star-rev">
                     <h2 class="prod-title">TITLE</h2>
                     <div class="prod-header-star-rev">
                        <%-- <c:forEach var="star" items="${stars}">
                        	<span class="rating-star">★</span> 
                        </c:forEach> --%>
                        <a class="rev-cnt" href="#">2개 상품평</a>
                     </div>
                  </div>
                  <div class="like-share-btn">
                     <div class="prod-favorite">
                        <button class="prod-favorite-btn" id="prod-favorite-btn">
                        </button>
                     </div>

                     <div class="prod-share">
                        <button class="prod-share-btn" id="prod-share-btn"></button>
                        <div class="prod-share-layer" id="prod-share-layer">
                            <ul>
                                <li class="prod-share__item">
                                   <img class="share_mini_img" alt="트위터" src="${pageContext.request.contextPath}/resources/img/detailView/twitter.png">
                                </li>
                                <li class="prod-share__item">
                                   <img class="share_mini_img" alt="메일" src="${pageContext.request.contextPath}/resources/img/detailView/mail.png">
                                </li>
                                <li class="prod-share__item">
                                   <img class="share_mini_fb" alt="페북" src="${pageContext.request.contextPath}/resources/img/detailView/good.png">
                                </li>
                            </ul>
                            <a class="prod-share-close" id="share-exit" onclick="shareWindow();">X</a>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="prod-author"></div>

               <div class="prod-price-container">
                  <div class="prod-origin-price">
                     <span class="disrev-cnt-rate" style="font-size: 14px;">64%</span>
                     <a class="origin-price" href="#"> 
                        <span id="basic-price">18900</span>
                        <span>원</span>
                        <img alt="워닝" src="${pageContext.request.contextPath}/resources/img/detailView/warning.png" style="width: 14px; height: 14px;"/>
                     </a>
                  </div>

                  <div class="prod-coupang-price">
                    
                  <div class="prod-coupon-price price-align major-price-coupon">
                     <span class="total-price" style="color: #cb1400;"> 
                     <strong id="final-price">6670</strong>
                     <strong>원</strong>
                     </span> <span class="price-krtext" style="color: #cb1400;">포스텔라 할인가</span>
                  </div>

                  <div class="reward-badge" style="padding-left: 5px;">
                     <img class="reward-cash-ico" alt="코인" src="${pageContext.request.contextPath}/resources/img/detailView/coin.png"
                        style="width: 14px; margin-bottom: 5px;"><span class="reward-cash-txt"
                        style="padding-left: 5px;">최대 334원 적립</span>
                  </div>
               </div>

               <!--배송 정보-->
               <div class="prod-top-shipping-fee">
                  <div class="prod-shipping-fee-message">
                     <span> <em class="shipping-text"
                        style="font-weight: bold; font-style: normal;">무료배송</em> <em
                        class="shipping-condition" style="font-style: normal;">(같은
                           판매자 상품 9,800원 이상 구매 시)</em></span>
                  </div>

                  <div class="prod-arrival-container">
                     <em class="arrival-day" style="font-style: normal;">모레(금)
                        6/23</em> <em class="arrival-text" style="font-style: normal;">
                        도착 예정</em>
                  </div>
               </div>

               <div class="prod-vendor-container">
                  <div class="vendor-name">
                     판매자: <a class="vendor-name-text" style="color: #346aff;" href="#">
                        <span>아기 고양이 </span>
                        <img class="prod-seller-link-coach" alt="판매자"
                        src="https://img1a.coupangcdn.com/image/dragonstone/sdp/new-coach-mark.png" style="height: 22px; margin-bottom: 5px">
                     </a>
                  </div>
               </div>

               <!--상품옵션-->

               <div class="prod-option">
                  <button class="prod-option-btn" id="prod-option-btn">
                     <div class="op_btn_left_right">
                        <div class="op_btn_text">
                           <div class="title" style="text-align: left;">색상 × 수량</div>
                           <div class="op_btn_set">
                              <span class="value " style="width: auto; padding: 2px;">
                                 01.Like It Carrot 라이크잇 캐롯 묶음 × 2세트 </span>
                           </div>
                        </div>
                        <div class="op_btn_imgset">
                           <span class="op_img"> 
                                 <img class="thumbnail" id="op-thumbnai" alt="상품사진" src="${pageContext.request.contextPath}/resources/img/detailView/post_list2.PNG" style="width: 38px; height: 38px; padding-right: 2px"/>
                                 <img class="dropdown-icon" alt="아래화살표" src="${pageContext.request.contextPath}/resources/img/detailView/arrow_down.png"/>
                           </span>
                        </div>
                     </div>
                  </button>
                  <div class="op-btn-list" id="op-btn-list">
                     <a class="op-list-content" id="op1">
                        <div class="prod-option-dropdown-item-left">
                                     <img src="${pageContext.request.contextPath}/resources/img/detailView/p2.jpg" width="38px" height="38px">
                                 </div>
                               <div class="prod-option-dropdown-item-right">
                                  <div class="prod-option__dropdown-item-title"><strong>네온블루 × 1세트</strong></div>
                                  <div class="prod-option__dropdown-item-price">
                                       <strong><span class="price-label">16,900</span> 원</strong>
                                  </div>
                                  <div class="prod-option-dropdown-item-delivery">
                                     <em class="dropdown-item-delivery-text">내일(목) 7/6</em><em class="dropdown-item-delivery-text"> 도착 보장</em>
                                  </div>
                               </div>
                     </a>
                     <a class="op-list-content" id="op2">
                        <div class="prod-option-dropdown-item-left">
                                     <img src="${pageContext.request.contextPath}/resources/img/detailView/p6.jpg" width="38px" height="38px">
                                 </div>
                               <div class="prod-option-dropdown-item-right">
                                  <div class="prod-option__dropdown-item-title"><strong>파스텔 × 1세트</strong></div>
                                  <div class="prod-option__dropdown-item-price">
                                       <strong><span class="price-label">12,000</span> 원</strong>
                                  </div>
                                  <div class="prod-option-dropdown-item-delivery">
                                     <em class="dropdown-item-delivery-text">내일(목) 7/6</em><em class="dropdown-item-delivery-text"> 도착 보장</em>
                                  </div>
                               </div>
                     </a>
                     <a class="op-list-content" id="op3">
                        <div class="prod-option-dropdown-item-left">
                                     <img src="${pageContext.request.contextPath}/resources/img/detailView/p1.jpg" width="38px" height="38px">
                                 </div>
                               <div class="prod-option-dropdown-item-right">
                                  <div class="prod-option__dropdown-item-title"><strong>그레이 × 1세트</strong></div>
                                  <div class="prod-option__dropdown-item-price">
                                       <strong><span class="price-label">10,900</span> 원</strong>
                                  </div>
                                  <div class="prod-option-dropdown-item-delivery">
                                     <em class="dropdown-item-delivery-text">내일(목) 7/6</em><em class="dropdown-item-delivery-text"> 도착 보장</em>
                                  </div>
                               </div>
                     </a>
                     <a class="op-list-content" id="op4">
                        <div class="prod-option-dropdown-item-left">
                                     <img src="${pageContext.request.contextPath}/resources/img/detailView/p5.jpg" width="38px" height="38px">
                                 </div>
                               <div class="prod-option-dropdown-item-right">
                                  <div class="prod-option__dropdown-item-title"><strong>오렌지 × 1세트</strong></div>
                                  <div class="prod-option__dropdown-item-price">
                                       <strong><span class="price-label">11,500</span> 원</strong>
                                  </div>
                                  <div class="prod-option-dropdown-item-delivery">
                                     <em class="dropdown-item-delivery-text">내일(목) 7/6</em><em class="dropdown-item-delivery-text"> 도착 보장</em>
                                  </div>
                               </div>
                     </a>
                  </div>
               </div>

               <!--수량,장바구니,바로구매-->
               <div class="prod-quantity-cart-buy">
                  <div class="prod-quantity-form">
                     <input type="text" value="1" class="prod-quantity-input"
                        style="width: 60px;">
                     <div class="updown-btn">
                        <button class="prod-cnt-btn" id="cnt-plus" type="button">
                           <img alt="" src="${pageContext.request.contextPath}/resources/img/detailView/up.png">
                        </button>
                        <button class="prod-cnt-btn" id="cnt-minus" type="button">
                           <img alt="" src="${pageContext.request.contextPath}/resources/img/detailView/down.png">
                        </button>
                     </div>
                  </div>
                  <div class="cart-buy-btn">
                     <button class="cart-btn">장바구니 담기</button>
                     <button class="buy-btn">바로구매 ></button>
                  </div>
               </div>

            </div>
         </div>
      </div>
      <div class="prod-bbottom">
         <div id="bprod_detail_all" class="prod_detail">
            <div>
               <ul class="tab-titles">
                  <li><a href="#bprod_detail_all">상품상세</a></li>
                  <li><a href="#review-tab-container">상품평<span>(21)</span></a></li>
                  <li><a href="#recommendation-good">상품문의</a></li>
                  <li><a href="#etc-info-set">배송/교환/반품 안내</a></li>
               </ul>
            </div>
            <div class="tab-contents">
               <div id="itemBrief" class="product-essential-info">
                  <div class="product-item__table">
                     <p class="table-title">필수 표기정보</p>
                     <table class="prod_info_table">
                        <colgroup>
                           <col width="150px">
                           <col width="340px">
                           <col width="150px">
                           <col width="*">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th>품명 및 모델명</th>
                              <td>상세페이지 참조</td>
                              <th>인증/허가 사항</th>
                              <td>상세페이지 참조</td>
                           </tr>
                           <tr>
                              <th>제조국(원산지)</th>
                              <td>상세페이지 참조</td>
                              <th>제조자(수입자)</th>
                              <td>상세페이지 참조</td>
                           </tr>
                           <tr>
                              <th>소비자상담 관련 전화번호</th>
                              <td colspan="3">상세페이지 참조</td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="warning-banner">
                  <span class="warning-banner-icon"><img alt="워닝"
                     src="${pageContext.request.contextPath}/resources/img/detailView/red_warning.png" style="height: 16px;"></span> <span
                     class="warning-banner-txt"> 판매자가 현금거래를 요구하면 거부하시고 즉시 사기 거래
                     신고센터 (02-2621-4699)에 신고하시기 바랍니다. </span>
               </div>
               <div class="prod-detail-aco show-preview" id="prod-detail-aco">
                  <div class="prod-detail-img">
                     <img alt="상세정보" src="${pageContext.request.contextPath}/resources/img/detailView/prod_detail.jpg">
                  </div>
                  
               </div>
               <div class="product-detail-seemore" id="seemore-layer">
                        <button class="product-detail-seemore-btn" id="seemore-btn">
                           <span id="seemore-text">상품정보 더보기</span>
                           <span id="seemore-arrow"></span>
                        </button>
                    </div>
               <div id="recommendation-howabout" class="recommendation">
                  <div class="recommendation-header">
                     <div class="recommendation-header-title">이런 상품은 어때요?</div>
                  </div>
                  <div class="recommendation-inner">
                     <ul class="recommendation-list">
                        <li><a href="img/p1.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p1.jpg" alt="엽서1">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">LAVERTON 인테리어 엽서
                                       자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p2.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p2.jpg" alt="엽서2">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">컬러링 엽서책 2000</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">1,600</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(15)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p3.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p3.jpg" alt="엽서3">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">[비츨] 인테리어 빈티지 페이퍼
                                       20종+원형스티커 세트 - 스카이블루 / 촬영소품 카페 감성 엽서 일러스트 벽장식</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">9,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(12)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p4.jpeg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p4.jpeg" alt="엽서4">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">알폰스무하 베르메르 뭉크 폴세잔
                                       윈슬로호머 존싱어사전트 30장 엽서셋트 명화 엽서</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">6,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p5.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p5.jpg" alt="엽서5">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">모노라이크 버스데이 파티 엽서 24종
                                       세트</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">4,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(11)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p6.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p6.jpg" alt="엽서6">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">열두진주문 칭찬카드 100매</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,500</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(18)</span>
                                 </div>
                              </div>
                        </a></li>
                     </ul>
                  </div>
               </div>
               <div id="recommendation-together" class="recommendation">
                  <div class="recommendation-header">
                     <div class="recommendation-header-title">다른 고객이 함께 본 상품</div>
                  </div>
                  <div class="recommendation-inner">
                     <ul class="recommendation-list">
                        <li><a href="img/p1.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p1.jpg" alt="엽서1">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">LAVERTON 인테리어 엽서
                                       자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p2.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p2.jpg" alt="엽서2">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">컬러링 엽서책 2000</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">1,600</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(15)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p3.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p3.jpg" alt="엽서3">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">[비츨] 인테리어 빈티지 페이퍼
                                       20종+원형스티커 세트 - 스카이블루 / 촬영소품 카페 감성 엽서 일러스트 벽장식</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">9,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(12)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p4.jpeg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p4.jpeg" alt="엽서4">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">알폰스무하 베르메르 뭉크 폴세잔
                                       윈슬로호머 존싱어사전트 30장 엽서셋트 명화 엽서</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">6,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p5.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p5.jpg" alt="엽서5">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">모노라이크 버스데이 파티 엽서 24종
                                       세트</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">4,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(11)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p6.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p6.jpg" alt="엽서6">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">열두진주문 칭찬카드 100매</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,500</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(18)</span>
                                 </div>
                              </div>
                        </a></li>
                     </ul>
                  </div>
               </div>

               <div class="review-list-container">
                  <div class="review-tab-container" id="review-tab-container">
                     <div class="review-rule">상품평 운영원칙</div>
                     <h4 class="review-title">상품평</h4>
                     <div class="review-guide">동일한 상품에 대해 작성된 상품평으로, 판매자는 다를 수
                        있습니다.</div>
                     <div class="review-info-starset">
                        <div class="review-info-starimg">
                           <img alt="별점" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" style="width: 245px;">
                        </div>
                        <div class="review-info-star-cnt">21</div>
                        <div class="review-info-detail-look">
                           <span class="review-info-detail-link"> 자세히보기 ></span>
                        </div>
                     </div>
                  </div>
                  <section class="review-list-section1">
                     <div class="review-sort">
                        <button class="sort-best">베스트순</button>
                        <div class="sort-text-bar">|</div>
                        <button class="sort-date">최신순</button>
                     </div>
                     <div class="review-search">
                        <input class="review-search-Input" type="text"
                           placeholder="상품평을 검색해보세요." maxlength="30">
                        <div class="review-search-star">
                           <button>모든 별점 보기</button>
                        </div>
                     </div>
                  </section>
                  <section class="review-list-section2">
                     <article class="review-article">
                        <div class="review-article-info">
                           <div class="review-article-info-top">
                              <span class="review-writer-profile"> <img
                                 class="review-writer-profile-img" alt=""
                                 src="${pageContext.request.contextPath}/resources/img/detailView/profile.png">
                              </span>
                              <div class="review-name-star-date">
                                 <div class="review-writer-name">
                                    <span>김*소</span>
                                 </div>
                                 <div class="review-writer-content">
                                    <span class="review-content-star"> <img alt=""
                                       src="${pageContext.request.contextPath}/resources/img/detailView/star1.png" class="review-content-starimg">
                                    </span> <span class="review-content-date">2023.06.21</span>
                                 </div>
                              </div>
                           </div>
                           <div class="review-content-seller">판매자: 아기 고양이</div>
                           <div class="review-content-product-info">키티 엽서 1매</div>
                        </div>
                        <div class="review-content-text">
                           판매자님 정말 진심으로 <br> 판매하시는게 느껴집니다!!!<br>
                        </div>
                        <div class="do-report">
                           <button class="do-report-btn">신고하기</button>
                        </div>
                     </article>
                     <article class="review-article">
                        <div class="review-article-info">
                           <div class="review-article-info-top">
                              <span class="review-writer-profile"> <img
                                 class="review-writer-profile-img" alt=""
                                 src="${pageContext.request.contextPath}/resources/img/detailView/profile.png">
                              </span>
                              <div class="review-name-star-date">
                                 <div class="review-writer-name">
                                    <span>박*홍</span>
                                 </div>
                                 <div class="review-writer-content">
                                    <span class="review-content-star"> <img alt=""
                                       src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" class="review-content-starimg">
                                    </span> <span class="review-content-date">2023.06.22</span>
                                 </div>
                              </div>
                           </div>
                           <div class="review-content-seller">판매자: 아기 고양이</div>
                           <div class="review-content-product-info">귀염뽀짝 고양이 엽서 100매</div>
                        </div>
                        <div class="review-content-text">엽서에 저를 닮은 고양이가 있어서 너무 마음에
                           들어요!!</div>
                        <div class="do-report">
                           <button class="do-report-btn">신고하기</button>
                        </div>
                     </article>
                  </section>
               </div>
               <div id="recommendation-good" class="recommendation">
                  <div class="recommendation-header">
                     <div class="recommendation-header-title">
                        <span class="recommendation-4points">4점 이상</span> <span
                           class="recommendation-4points-text">리뷰가 좋은 상품</span>
                     </div>
                  </div>
                  <div class="recommendation-inner">
                     <ul class="recommendation-list">
                        <li><a href="img/p1.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p1.jpg" alt="엽서1">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">LAVERTON 인테리어 엽서
                                       자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p2.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p2.jpg" alt="엽서2">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">컬러링 엽서책 2000</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">1,600</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(15)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p3.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p3.jpg" alt="엽서3">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">[비츨] 인테리어 빈티지 페이퍼
                                       20종+원형스티커 세트 - 스카이블루 / 촬영소품 카페 감성 엽서 일러스트 벽장식</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">9,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(12)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p4.jpeg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p4.jpeg" alt="엽서4">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">알폰스무하 베르메르 뭉크 폴세잔
                                       윈슬로호머 존싱어사전트 30장 엽서셋트 명화 엽서</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">6,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p5.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p5.jpg" alt="엽서5">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">모노라이크 버스데이 파티 엽서 24종
                                       세트</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">4,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(11)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p6.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p6.jpg" alt="엽서6">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">열두진주문 칭찬카드 100매</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,500</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(18)</span>
                                 </div>
                              </div>
                        </a></li>
                     </ul>
                  </div>
               </div>
               <div class="prod-inquiry-list">
                  <div class="prod-inquiry-header">
                     <h4 class="prod-inquiry-list-title">상품문의</h4>

                     <a class="prod-inquiry-list-write-btn" href="javascript:;">문의하기</a>
                  </div>

                  <div class="prod-inquiry-list-notice">
                     <ul>
                        <li>구매한 상품의 <em style="font-style: normal;">취소/반품은
                              마이쿠팡 구매내역에서 신청</em> 가능합니다.
                        </li>
                        <li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
                        <li><em style="font-style: normal;">가격, 판매자, 교환/환불 및
                              배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기</em>를 이용해주세요.</li>
                        <li><em style="font-style: normal;">"해당 상품 자체"와 관계없는
                              글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수
                              있습니다.</em></li>
                        <li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
                     </ul>
                  </div>

                  <div class="prod-inquiry-qna">
                     <div class="prod-inquiry-items">
                        <div class="prod-inquiry-item">
                           <div class="prod-inquiry-qpname-set">
                              <em class="prod-inquiry-item-q">질문</em>
                              <div class="prod-inquiry-item-option">1세트 | PC-02 키티엽서</div>
                           </div>
                           <div class="prod-inquiry-item-text">재입고 언제 되나요?</div>

                           <div class="prod-inquiry-item-date">2023/06/16 00:52:18</div>
                           <hr class="sep-line" />
                           <div class="prod-inquiry-qpname-set">
                              <img alt="" src="${pageContext.request.contextPath}/resources/img/detailView/pointer.png"
                                 style="width: 20px; height: 20px;"> <em
                                 class="prod-inquiry-item-a">답변</em>
                              <div class="prod-inquiry-item-option">아기 고양이</div>
                           </div>
                           <div class="prod-inquiry-item-text">안녕하세요 아기고양이입니다. 재입고
                              안합니다.</div>

                           <div class="prod-inquiry-item-date">2023/06/26 00:52:18</div>
                           <hr class="sep-line" />
                        </div>
                     </div>
                  </div>
                  <div class="prod-report">
                     <p class="prod-report__text">판매 부적격 상품 또는 허위과장광고 및 지식재산권을
                        침해하는 상품의 경우 신고하여 주시기 바랍니다.</p>
                     <a href="javascript:;" class="prod-report__button"
                        id="productReport" title="신고하기">신고하기</a>
                  </div>
               </div>
               <div class="etc-info-set" id="etc-info-set">
                  <div class="etc-info-group">
                     <h5 class="etc-info-title">배송정보</h5>
                     <table class="prod-delivery-return-policy-table">
                        <colgroup>
                           <col width="150px">
                           <col width="340px">
                           <col width="150px">
                           <col width="*">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th>배송방법</th>
                              <td class="return-policy-delivery-method">순차배송</td>
                              <th rowspan="2">배송비</th>
                              <td rowspan="2">3,000원<br>- 9,800원 이상 구매 시 무료배송<br>·
                                 도서산간 추가 배송비<br>- 제주 지역: 4,000원<br>- 도서산간 지역: 4,000원
                              </td>
                           </tr>
                           <tr>
                              <th>배송사</th>
                              <td>CJ 대한통운</td>
                           </tr>
                           <tr>
                              <th>묶음배송 여부</th>
                              <td colspan="3">가능</td>
                           </tr>
                           <tr class="return-policy-optional-info" style="">
                              <th>배송기간</th>
                              <td colspan="3">ㆍ도서산간 지역 등은 배송에 3-5일이 더 소요될 수 있습니다.<br>
                                 &nbsp;&nbsp;- 천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해
                                 부탁드립니다.
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <div class="etc-info-group">
                     <h5 class="etc-info-title">교환/반품 안내</h5>
                     <ul class="prod-delivery-return-policy-legal-notice">
                        <li>ㆍ교환/반품에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다. <br>다만,
                           판매자의 제시사항이 관계법령보다 소비자에게 유리한 경우에는 판매자 제시사항이 적용됩니다.
                        </li>
                     </ul>
                     <table class="prod-delivery-return-policy-table">
                        <colgroup>
                           <col width="160px">
                           <col width="*">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th>교환/반품 비용<br>(왕복비용)
                              </th>
                              <td>6,000원<br>- 단, 고객 변심의 경우에만 발생<br>- 도서산간 및
                                 일부 지역 추가비용 발생<br>- 부분반품 시, 남은금액이 무료배송 조건을 유지하면 편도 배송비용만
                                 부과
                              </td>
                           </tr>
                           <tr>
                              <th>교환/반품 신청 기준일</th>
                              <td>
                                 <p>ㆍ단순변심에 의한 교환/반품은 제품 수령 후 7일 이내까지, 교환/반품 제한사항에 해당하지 않는
                                    경우에만 가능 (배송비용과 교환/반품 비용 왕복배송비 고객부담)</p>
                                 <p>
                                    ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는
                                    알 수 있었던 날부터<br> <span
                                       class="prod-delivery-return-policy__limit-list__indent">30일
                                       이내에 청약철회 가능</span>
                                 </p>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <div class="etc-info-group">
                     <h5 class="etc-info-title">교환/반품 제한사항</h5>
                     <ul class="prod-inquiry-list-notice" style="margin-left: 0px;">
                        <li>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
                        <li>ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한
                           포장 개봉의 경우는 예외)</li>
                        <li>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
                        <li>ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한
                           경우</li>
                        <li>ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을
                           무료로 요청하는 경우</li>
                        <li>ㆍ제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
                     </ul>
                     <p class="prod-delivery-return-policy__limit-text">※ 각 상품별로
                        아래와 같은 사유로 취소/반품이 제한될 수 있습니다.</p>
                     <table class="prod-delivery-return-policy-table">
                        <colgroup>
                           <col width="150px">
                           <col width="*">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th>의류/잡화/수입명품</th>
                              <td>
                                 <p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된
                                    경우</p>
                              </td>
                           </tr>
                           <tr>
                              <th>계절상품/식품/화장품</th>
                              <td>
                                 <p>ㆍ신선/냉장/냉동 상품의 단순변심의 경우</p>
                                 <p>
                                    ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br> <span
                                       class="prod-delivery-return-policy__limit-list__indent">진료
                                       확인서 및 소견서 등을 증빙하면 환불이 가능 (제반비용 고객부담)</span>
                                 </p>
                              </td>
                           </tr>
                           <tr>
                              <th>전자/가전/설치상품</th>
                              <td>

                                 <p>ㆍ설치 또는 사용하여 재판매가 어려운 경우</p>
                                 <p>ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이
                                    적힌 PMP)</p>
                                 <p>ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우
                                    (노트북, 데스크탑 PC 등)</p>
                              </td>
                           </tr>
                           <tr>
                              <th>자동차용품</th>
                              <td>
                                 <p>ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우</p>
                              </td>
                           </tr>
                           <tr>
                              <th>CD/DVD/GAME/<br>BOOK
                              </th>
                              <td><span>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</span></td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <div class="etc-info-group">
                     <div class="product-item__table product-seller">
                        <p class="etc-info-title">판매자 정보</p>
                        <table class="prod-delivery-return-policy-table">
                           <colgroup>
                              <col width="150px">
                              <col width="340px">
                              <col width="150px">
                              <col width="*">
                           </colgroup>
                           <tbody>
                              <tr>
                                 <th>
                                    <div>상호/대표자</div>
                                 </th>
                                 <td>아기고양이/박재홍</td>
                                 <th>
                                    <div>사업장 소재지</div>
                                 </th>
                                 <td>서울시 종로구</td>
                              </tr>

                              <tr>
                                 <th>
                                    <div>e-mail</div>
                                 </th>
                                 <td>kitty@naver.com</td>
                                 <th>
                                    <div>연락처</div>
                                 </th>
                                 <td>010-7777-7777</td>
                              </tr>

                              <tr>
                                 <th>
                                    <div>통신판매업 신고번호</div>
                                 </th>
                                 <td>2020-서울-2023</td>
                                 <th>
                                    <div>사업자번호</div>
                                 </th>
                                 <td>114-112-00000</td>
                              </tr>

                              <tr>
                                 <th>
                                    <div>구매안전 서비스</div>
                                 </th>
                                 <td colspan="3">
                                    <p>
                                       02-006-00042 <a class="service-join__btn">서비스 가입사실 확인 </a>
                                    </p>

                                    <p class="escrow-policy">본 판매자는 고객님의 안전거래를 위해 관련 법률에
                                       의거하여 쿠팡페이의 구매안전서비스를 적용하고 있습니다.</p>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                     <div class="etc-info-group">
                        <p class="prod-minor-notice">미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우
                           본인 또는 법정대리인이 취소할 수 있습니다. 쿠팡은 통신판매중개자로서 통신판매의 당사자가 아니며,
                           광고,&nbsp;고시정보, 상품 주문, 배송 및 환불의 의무와 책임은 각 판매자에 있습니다.</p>
                     </div>
                  </div>
               </div>
               <div id="recommendation-see" class="recommendation">
                  <div class="recommendation-header">
                     <div class="recommendation-header-title">다른 고객이 함께 구매한 상품</div>
                  </div>
                  <div class="recommendation-inner">
                     <ul class="recommendation-list">
                        <li><a href="img/p1.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p1.jpg" alt="엽서1">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">LAVERTON 인테리어 엽서
                                       자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p2.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p2.jpg" alt="엽서2">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">컬러링 엽서책 2000</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">1,600</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(15)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p3.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p3.jpg" alt="엽서3">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">[비츨] 인테리어 빈티지 페이퍼
                                       20종+원형스티커 세트 - 스카이블루 / 촬영소품 카페 감성 엽서 일러스트 벽장식</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">9,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(12)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p4.jpeg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p4.jpeg" alt="엽서4">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">알폰스무하 베르메르 뭉크 폴세잔
                                       윈슬로호머 존싱어사전트 30장 엽서셋트 명화 엽서</strong>>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">6,670</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(21)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p5.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p5.jpg" alt="엽서5">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">모노라이크 버스데이 파티 엽서 24종
                                       세트</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">4,900</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star5.png" width="70px">
                                    <span class="star-rating">(11)</span>
                                 </div>
                              </div>
                        </a></li>
                        <li><a href="img/p6.jpg">
                              <div class="product">
                                 <div class="img">
                                    <img class="rec-item-image" src="${pageContext.request.contextPath}/resources/img/detailView/p6.jpg" alt="엽서6">
                                 </div>
                                 <div class="rec-item-text">
                                    <strong class="rec-item-title">열두진주문 칭찬카드 100매</strong>
                                 </div>
                                 <div class="rec-item-price">
                                    <span><em style="font-style: normal;">2,500</em>원</span>
                                 </div>
                                 <div class="rec-item-review">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/img/detailView/star4.png" width="70px">
                                    <span class="star-rating">(18)</span>
                                 </div>
                              </div>
                        </a></li>
                     </ul>
                  </div>
               </div>
            </div>
   </main>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>