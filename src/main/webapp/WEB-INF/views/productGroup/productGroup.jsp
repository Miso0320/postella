<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/hi.png" type="image/x-icon">
		<title>큐팡!</title>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		

		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productGroup.css"/>
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
							<img id="rk-icon1" src="${pageContext.request.contextPath}/resources/img/product/rocket.png" alt="">
						</label>
					</div>
					<div id="rockets" style="background-color: #F2F2F2;">
						<div class="rocket1">
							<input id="rocket11" type="checkbox" value="왈가닥스"/>
								<label for="rocket11"><img id="rk-icon2" src="${pageContext.request.contextPath}/resources/img/product/rocket_delivery.png" alt="">만 보기</label>
						</div>
						<div class="rocket1">
							<input id="rocket12" type="checkbox" value="왈가닥스"/>
								<label for="rocket12"><img id="rk-icon3" src="${pageContext.request.contextPath}/resources/img/product/rocket_jikgu.png" alt="">만 보기</label>
						</div>
					</div>
						<div class="free-delivery"><input id="free" type="checkbox" value="free-delivery"/><label for="free">무료배송</label></div>
						
						<div>
							<h1 style="font-size:15px; font-weight:bold;">카테고리</h1>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<button class="accordion" style= "cursor : pointer;">엽서
									<input id="arrow1" type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/arrow-down.png" width="12px" height="12px"/>
								</button>
								<div class="panel">
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">포토엽서</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">디자인패턴엽서</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">그림/일러스트엽서</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">캘리그라피엽서</label></div>
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
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">청현재이</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">마이데일리룸</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">제로퍼제로</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">플라잉웨일즈</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">물가</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">클리니스</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">도나앤데코</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">솔룸</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">언어세상</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">네울나비</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">바보사랑</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">라이트앤</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">후카후카스튜디오</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">모몽</label></div>
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
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">새해</label></div>
					          		<div class="panel-body"><input type="checkbox" id="category_list" onclick="movepage('detailView.jsp');"><label for="category_list">할로윈</label></div>
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
						<a href="detailView.jsp" class="pproduct">
							<a href="#">별점 전체</a> <br>
							<input type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/4star.png" width="100"/><br>
							<input type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/3star.png" width="100"/><br>
							<input type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/2star.png" width="100"/><br>
							<input type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/1star.png" width="100"/>
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
								<input type="text" class="maxprice" maxlength="10" value style="width: 50px; height:20px"/>원 <a href="detailView.jsp"><input type="button" value="검색" /></a>
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
											<img class="warning" src="${pageContext.request.contextPath}/resources/img/productGroup/!.png" alt="" style="width:12px; height:12px;">
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
						<c:forEach var="productGroup" items="${productGroups}">
									<a href="detailView" class="pproduct">
											<tr>
												<img class="productGroup" src="data:${productGroup.img_type};base64, ${productGroup.encodedFile}">
												<td>${productGroup.pg_no}</td>
												<td>${productGroup.pg_name}</td>
											</tr>
									</a>
						</c:forEach>
					</div>
					
					<td colspan="4" class="text-center">
						<div>
							<div class="pager">
								<a class="btn btn-outline-primary btn-sm" href="productGroup?pageNo=1">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-outline-info btn-sm" href="productGroup?pageNo=${pager.startPageNo-1}">이전</a>
								</c:if>
								
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm" href="productGroup?pageNo=${i}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-primary btn-sm" href="productGroup?pageNo=${i}">${i}</a>
									</c:if>
								</c:forEach>
								
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm" href="productGroup?pageNo=${pager.endPageNo+1}">다음</a>
								</c:if>
								<a class="btn btn-outline-primary btn-sm" href="productGroup?pageNo=${pager.totalPageNo}">맨끝</a>
							</div>
						</div>
					</td>
					
				</div> 
					<hr>
					
					
		
					
					
					
					
					
					
					
					
					
		
<!-- 					<div id="product-paging" class="product-list-paging" style="display: block;">
						<div class="page-wrapper" style="margin: 0 430px;">
							<a class="icon-prevpage" data-page="1">
								<span><img class="arrow-img" alt="코인" src="${pageContext.request.contextPath}/resources/img/product/leftarrow.png" style="width: 16px;"></span>
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
								<span><img class="arrow-img" alt="코인" src="${pageContext.request.contextPath}/resources/img/product/rightarrow.png" style="width: 16px;"></span>
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

