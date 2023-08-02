<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<title>큐팡!</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		

		
		<link rel="stylesheet" href="/WEB-INF/views/product/product.css"/>
		<!-- <script type="text/javascript">
		function movepage(page) {
		window.document.location.href=page;
		return;
		}
		</script> -->
		
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<div id="container">
			<section>
				<aside>
					<div>
						<input type="checkbox" id="rocket" value="rocket"/>
						<label for="rocket">
							<img id="rk-icon1" src="img/rocket.png" alt="">
						</label>
					</div>
					<div id="rockets" style="background-color: #F2F2F2;">
						<div class="rocket1">
							<input id="rocket11" type="checkbox" value="왈가닥스"/>
								<label for="rocket11"><img id="rk-icon2" src="img/rocket_delivery.png" alt="">만 보기</label>
						</div>
						<div class="rocket1">
							<input id="rocket12" type="checkbox" value="왈가닥스"/>
								<label for="rocket12"><img id="rk-icon3" src="img/rocket_jikgu.png" alt="">만 보기</label>
						</div>
					</div>
						<div class="free-delivery"><input id="free" type="checkbox" value="free-delivery"/><label for="free">무료배송</label></div>
						
						<div>
							<h1 style="font-size:15px; font-weight:bold;">카테고리</h1>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<button class="accordion" style= "cursor : pointer;">엽서
									<input id="arrow1" type="image" src="img/arrow-down.png" width="12px" height="12px"/>
								</button>
								<div class="panel">
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">포토엽서</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">디자인패턴엽서</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">그림/일러스트엽서</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">캘리그라피엽서</label></div>
								</div>
							</div>
						</div> 
								<script>
								var acc = document.getElementsByClassName("accordion");
								var i;
								
								for (i = 0; i < acc.length; i++) {
								  acc[i].addEventListener("click", function() {
								    this.classList.toggle("active");
								    var panel = this.nextElementSibling;
								    if (panel.style.display === "block") {
								      panel.style.display = "none";
								    } else {
								      panel.style.display = "block";
								    }
								  });
								}
								</script>
								
								<script type="text/javascript">
									function movepage(page)
									{
									window.document.location.href=page;
									return;
									}
								</script>

					
					<div>
						<h1 style="font-size:15px; font-weight:bold;">브랜드</h1>
						<div class="brand"><input id="brand1" type="checkbox" value="왈가닥스"/><label for="brand1">왈가닥스</label></div>
						<div class="brand"><input id="brand2" type="checkbox" value="투영디자인"/><label for="brand2">투영디자인</label></div>
						<div class="brand"><input id="brand3" type="checkbox" value="홈엔하비"/><label for="brand3">홈엔하비</label></div>
						<div class="brand"><input id="brand4" type="checkbox" value="왈가닥스"/><label for="brand4">모노라이크</label></div>
						<div class="brand"><input id="brand5" type="checkbox" value="왈가닥스"/><label for="brand5">케이트가든</label></div>
						<div class="brand"><input id="brand6" type="checkbox" value="왈가닥스"/><label for="brand6">핑크풋</label></div>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						      	<button class="accordion1" style= "cursor : pointer;">+더보기
								</button>
								<div class="panel">
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">청현재이</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">마이데일리룸</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">제로퍼제로</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">플라잉웨일즈</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">물가</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">클리니스</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">도나앤데코</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">솔룸</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">언어세상</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">네울나비</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">바보사랑</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">라이트앤</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">후카후카스튜디오</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">모몽</label></div>
								</div>
					    	</div>
						
					</div>
										<script>
											var acc = document.getElementsByClassName("accordion1");
											var i;
											
											for (i = 0; i < acc.length; i++) {
											  acc[i].addEventListener("click", function() {
											    this.classList.toggle("active");
											    var panel = this.nextElementSibling;
											    if (panel.style.display === "block") {
											      panel.style.display = "none";
											    } else {
											      panel.style.display = "block";
											    }
											  });
											}
											</script>
											
											<script type="text/javascript">
												function movepage(page)
												{
												window.document.location.href=page;
												return;
												}
										</script>
					<div>
						<h1 style="font-size:15px; font-weight:bold;">상품상태</h1>
						<div class="state"><input id="state1" type="checkbox" value="왈가닥스"/><label for="state1">새상품</label></div>
						<div class="state"><input id="state2" type="checkbox" value="왈가닥스"/><label for="state2">박스 훼손</label></div>
						<div class="state"><input id="state3" type="checkbox" value="왈가닥스"/><label for="state3">재포장</label></div>
						<div class="state"><input id="state4" type="checkbox" value="왈가닥스"/><label for="state4">반품</label></div>
						<div class="state"><input id="state5" type="checkbox" value="왈가닥스"/><label for="state5">중고</label></div>
					</div>
					<div>
						<h1 style="font-size:15px; font-weight:bold;">엽서 디자인종류</h1>
						<div class="design"><input id="design1" type="checkbox" value="왈가닥스"/><label for="design1">포토</label></div>
						<div class="design"><input id="design2" type="checkbox" value="왈가닥스"/><label for="design2">그림/일러스트</label></div>
						<div class="design"><input id="design3" type="checkbox" value="왈가닥스"/><label for="design3">타이포/캘리그라피</label></div>
						<div class="design"><input id="design4" type="checkbox" value="왈가닥스"/><label for="design4">디자인패턴</label></div>
					</div>
					<div>
						<h1 style="font-size:15px; font-weight:bold;">카드/엽서 메시지</h1>
						<div class="message"><input id="message1" type="checkbox" value="왈가닥스"/><label for="message1">축하/기념일</label></div>
						<div class="message"><input id="message2" type="checkbox" value="왈가닥스"/><label for="message2">사랑/고백</label></div>
						<div class="message"><input id="message3" type="checkbox" value="왈가닥스"/><label for="message3">감사</label></div>
						<div class="message"><input id="message4" type="checkbox" value="왈가닥스"/><label for="message4">사과</label></div>
						<div class="message"><input id="message5" type="checkbox" value="왈가닥스"/><label for="message5">격려</label></div>
						<div class="message"><input id="message6" type="checkbox" value="왈가닥스"/><label for="message6">크리스마스</label></div>
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						      	<button class="accordion2" style= "cursor : pointer;">+더보기
								</button>
								<div class="panel">
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">새해</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView2.jsp');"><label for="category_list">할로윈</label></div>
								</div>
					    	</div>
										<script>
											var acc = document.getElementsByClassName("accordion2");
											var i;
											
											for (i = 0; i < acc.length; i++) {
											  acc[i].addEventListener("click", function() {
											    this.classList.toggle("active");
											    var panel = this.nextElementSibling;
											    if (panel.style.display === "block") {
											      panel.style.display = "none";
											    } else {
											      panel.style.display = "block";
											    }
											  });
											}
										</script>
											
											<script type="text/javascript">
												function movepage(page)
												{
												window.document.location.href=page;
												return;
												}
										</script>
					</div>
					<div>
						<h1 style="font-size:15px; font-weight:bold;">카드 입체여부</h1>
						<div class="dimension"><input id="dimension1" type="checkbox" value="왈가닥스"/><label for="dimension1">평면</label></div>
						<div class="dimension"><input id="dimension2" type="checkbox" value="왈가닥스"/><label for="dimension2">입체</label></div>
					</div>
					<div>
						<h1 style="font-size:15px; font-weight:bold;">별점</h1>
						<a href="detailView2.jsp" class="pproduct">
							<a href="#">별점 전체</a> <br>
							<input type="image" src="img/4star.png" width="100"/><br>
							<input type="image" src="img/3star.png" width="100"/><br>
							<input type="image" src="img/2star.png" width="100"/><br>
							<input type="image" src="img/1star.png" width="100"/>
						</a>
					</div>
					<div>
						<h1 style="font-size:15px; font-weight:bold;">가격</h1>
						<a class="price" href="#">가격 전체</a> <br>
						<a class="price" href="#">5천원 이하</a> <br>
						<a class="price" href="#">5천원~1만원</a> <br>
						<a class="price" href="#">1만원~1만5천원</a> <br>
						<a class="price" href="#">1만5천원~2만원</a> <br>
						<a class="price" href="#">2만원 이상</a> <br>
						<div>
							<span>
								<input type="text" class="minprice" maxlength="10" value style="width: 50px; height:20px" />~
								<input type="text" class="maxprice" maxlength="10" value style="width: 50px; height:20px"/>원 <a href="detailView2.jsp"><input type="button" value="검색" /></a>
							</span>
						</div>	
							
						
					
					</div>
				</aside>
				
				<div class="article">
					<div class="post" style="padding: 15px 0px;">
						<h3>엽서</h3>
					</div>
					<div>
						<div>
							
							<ul id="list" class="list" style="white-space: nowrap;">
								<li><a href="" title="쿠팡랭킹순은 판매실적, 사용자선호도,&#10; 상품정보 충실도 및 검색 정확도 등을&#10; 종합적으로 고려한 순위입니다">쿠팡랭킹순
										<strong>
											<img class="warning" src="img/!.png" alt="" style="width:12px; height:12px;">
										</strong> | 
									</a></li>
								<li><a href="">낮은가격순 | </a></li>
								<li><a href="">높은가격순 | </a></li>
								<li><a href="">판매량순 | </a></li>
								<li><a href="">최신순</a></li>
								
								<ul class="amount-menu">
				                  <li>
				                     <a href="#" style="color:black;"><b>60개씩 보기</b></a>
				                     <ul class="amount-menu2" >
				                        <li><a href="#" style="justify-content: flex-start;"><b>120개씩 보기</b></a>
				                        
				                     </ul>
				                  </li>
				               </ul>
								     
							</ul>
						</div>
					</div>
					
					
					
					<div class="item-list">
					<div class="item-list-4  ">
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img1.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> LAVERTON 인테리어 엽서 자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>64%</span>
									<span class="span">18900</span>
								</div>
								<strong class="real-price">6,670원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(21)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 334원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						
						
						
						
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img2.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> WEHAVE 일러스트 사진엽서 그림엽서 인테리어 캘리그라피 엽서세트시즌1 일러스트엽서</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span><span>
									<span>1%</span>
									<span class="span">7000</span>
								</div>
								<strong class="real-price">6,900원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/4star.png" width="100"/>
								<span class="star-rating">(6)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 345원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img3.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 컬러링 엽서책 2000</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span></span>
									<span></span>
									<span class="span"></span>
								</div>
								<strong class="real-price">1,600원</strong>
								<div class="product-date">
									<span>
										<em></em>
										<em></em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(1)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 80원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img4.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 세상에서 제일 특별한 편지지 OOO안내서 땡땡땡안내서 롤링페이퍼 스승의날 카드 편지 생일파티용품 파자마파티</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span></span>
									<span></span>
									<span class="span"></span>
								</div>
								<strong class="real-price">2,000원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(16)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 100원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
					</div> <hr>
					<div class="item-list-4  ">
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img5.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 나의 사과 애플데이 엽서(봉투 미포함) / 사과데이 학교 행사</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;"></span>
									<span></span>
									<span class="span"></span>
								</div>
								<strong class="real-price">250원</strong>
								<div class="product-date">
									<span>
										<em>6/24(토)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(3)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 13원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img6.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 15장 세트 감성 레트로 명화 영화 포스터 폴라로이드 엽서 벽 꾸미기 홈 월 데코 빈티지 사진 흑백 촬영 소품 피카소 그림</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;"></span>
									<span>20%</span>
									<span class="span">5650</span>
								</div>
								<strong class="real-price">4,490원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(2)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 225원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img7.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 지멋대로 한지엽서(F1호)5장 뚜꺼운한지 캘리그라프지</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>15%</span>
									<span class="span">6500</span>
								</div>
								<strong class="real-price">5,500원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/4star.png" width="100"/>
								<span class="star-rating">(1)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 275원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img8.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 레트로 스타일 음식 포스터 세트 (단면 14장) 벽꾸미기 엽서세트</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>40%</span>
									<span class="span">6000</span>
								</div>
								<strong class="real-price">3,600원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(5)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 180원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
					</div> <hr>
					<div class="item-list-4  " id="item-group3">	
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img9.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> MLab 한국 여행사진 감성 인테리어 서울 포토엽서 ver2 5매세트</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>18%</span>
									<span class="span">5000</span>
								</div>
								<strong class="real-price">4,100원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(5)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 205원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img10.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 왈가닥스 알파벳 포스트카드 엽서</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span></span>
									<span></span>
								</div>
								<strong class="real-price">700원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(1)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 35원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img11.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> LAVERTON 인테리어 엽서 자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함함</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>64%</span>
									<span class="span">18900</span>
								</div>
								<strong class="real-price">6,670원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(21)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 334원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img6.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 15장 세트 감성 레트로 명화 영화 포스터 폴라로이드 엽서 벽 꾸미기 홈 월 데코 빈티지 사진 흑백 촬영 소품 피카소 그림</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;"></span>
									<span>20%</span>
									<span class="span">5650</span>
								</div>
								<strong class="real-price">4,490원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(2)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 225원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
					</div> <hr>
					<div class="item-list-4  ">
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img1.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> LAVERTON 인테리어 엽서 자석고리 골드(후크)+ 30장1세트+양면테이프(50개)+라운드스티커1개(랜덤) 포함</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>64%</span>
									<span class="span">18900</span>
								</div>
								<strong class="real-price">6,670원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(21)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 334원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						
						
						
						
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img2.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> WEHAVE 일러스트 사진엽서 그림엽서 인테리어 캘리그라피 엽서세트시즌1 일러스트엽서</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span><span>
									<span>1%</span>
									<span class="span">7000</span>
								</div>
								<strong class="real-price">6,900원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/4star.png" width="100"/>
								<span class="star-rating">(6)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 345원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img3.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 컬러링 엽서책 2000</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span></span>
									<span></span>
									<span class="span"></span>
								</div>
								<strong class="real-price">1,600원</strong>
								<div class="product-date">
									<span>
										<em></em>
										<em></em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(1)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 80원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img4.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 세상에서 제일 특별한 편지지 OOO안내서 땡땡땡안내서 롤링페이퍼 스승의날 카드 편지 생일파티용품 파자마파티</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span></span>
									<span></span>
									<span class="span"></span>
								</div>
								<strong class="real-price">2,000원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(16)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 100원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
					</div> <hr>
					<div class="item-list-4  ">
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img12.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 나의 사과 애플데이 엽서(봉투 미포함) / 사과데이 학교 행사</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;"></span>
									<span></span>
									<span class="span"></span>
								</div>
								<strong class="real-price">250원</strong>
								<div class="product-date">
									<span>
										<em>6/24(토)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(3)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 13원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img6.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 15장 세트 감성 레트로 명화 영화 포스터 폴라로이드 엽서 벽 꾸미기 홈 월 데코 빈티지 사진 흑백 촬영 소품 피카소 그림</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;"></span>
									<span>20%</span>
									<span class="span">5650</span>
								</div>
								<strong class="real-price">4,490원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(2)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 225원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img7.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 지멋대로 한지엽서(F1호)5장 뚜꺼운한지 캘리그라프지</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>15%</span>
									<span class="span">6500</span>
								</div>
								<strong class="real-price">5,500원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/4star.png" width="100"/>
								<span class="star-rating">(1)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 275원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
						<a href="detailView2.jsp" class="pproduct">
						<div class="product">
							<div class="img">
								<img class="image" src="img/img8.png" alt="">
							</div>
							<div class="text">
								<h1 class="head" style="font-size:15px; font-weight:bold;"> 레트로 스타일 음식 포스터 세트 (단면 14장) 벽꾸미기 엽서세트</h1>
							</div>
							<div class="product-price">
								<div class="product-sale">
									<span id="sale" style="color: #cb1400;">즉시 할인가</span>
									<span>40%</span>
									<span class="span">6000</span>
								</div>
								<strong class="real-price">3,600원</strong>
								<div class="product-date">
									<span>
										<em>모레(금)</em>
										<em>도착 예정</em>
									</span>	
								</div>
							</div>
							<div class="star">
								<input type="image"src="img/5star.png" width="100"/>
								<span class="star-rating">(5)</span>
							</div>
							<div class="point" style="padding-left: 5px;">
	                           	<div class="ppoint">
	                              <img class="coin-img" alt="코인" src="img/point.png" style="width: 14px;"><span
	                                 class="coin-txt" style="padding-left: 5px; color: black; font-size: 11px;">최대 180원 적립</span>
	                           	</div>
                        	</div>
						</div>
						</a>
					</div> 
					
					<div class="page">
						<ul class="pagination">
						    <!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.
						    disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
						    <li class="disabled">
						      <a href="#">
						        <span>«</span>
						      </a>
						    </li>
						    <!-- li태그의 클래스에 active를 넣으면 색이 반전되고 클릭도 되지 않는다.
						    active의 의미는 현재 페이지의 의미이다. -->
						    <li class="plist"><a href="#">1</a></li>
						    <li class="plist"><a href="#">2</a></li>
						    <li class="plist"><a href="#">3</a></li>
						    <li class="plist"><a href="#">4</a></li>
						    <li class="plist"><a href="#">5</a></li>
						    <li class="plist"><a href="#">6</a></li>
						    <li class="plist"><a href="#">7</a></li>
						    <li class="plist"><a href="#">8</a></li>
						    <li class="plist"><a href="#">9</a></li>
						    <li class="plist"><a href="#">10</a></li>
						    
						    <li>
						      <a href="#">
						        <span>»</span>
						      </a>
						    </li>
					 	 </ul>
				 	 </div>
					<hr>
					
					
		
					
					
					
					
					
					
					
					
					
		
<!-- 					<div id="product-paging" class="product-list-paging" style="display: block;">
						<div class="page-wrapper" style="margin: 0 430px;">
							<a class="icon-prevpage" data-page="1">
								<span><img class="arrow-img" alt="코인" src="img/leftarrow.png" style="width: 16px;"></span>
							</a>
							<a class="selected" data-page="1">1</a>
							<a data-page="2">2</a>
							<a data-page="3">3</a>
							<a data-page="4">4</a>
							<a data-page="5">5</a>
							<a data-page="6">6</a>
							<a data-page="7">7</a>
							<a data-page="8">8</a>
							<a data-page="9">9</a>
							<a data-page="10">10</a>
							<a class="icon-nextpage" data-page="11">
								<span><img class="arrow-img" alt="코인" src="img/rightarrow.png" style="width: 16px;"></span>
							</a>
						</div>
					</div> -->
				</div>
			</section> <hr>
		</div>
		<div>		
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</div>
	</body>
</html>

