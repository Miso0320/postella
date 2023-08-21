<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/productGroup.js"></script>

<!-- 대문 사진 -->
<div id="welcomeMainPage">
	<div id="mainPageImageList">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ul>
			
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/resources/img/productGroup/mainPage1.jpg">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/img/productGroup/mainPage4.jpg">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/img/productGroup/mainPage2.jpg">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/img/productGroup/mainPage3.jpg">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/img/productGroup/mainPage5.jpg">
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			  <span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#myCarousel" data-slide="next">
			  <span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
</div>
<!-- 전체 상품목록 페이지 -->
<div id="container">
	<section class="productGroupSection" style="padding: 50px 190px;">
		<!-- 왼쪽 사이드 메뉴 -->
		<%-- <aside>
			<!-- 카테고리 -->
			<div class="left_side_menu_border">
				<a class="accordion">
					<h5 class="left_side_menu_title_font">카테고리</h5>
					<input class="arrow_img" type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/arrow-down.png">
				</a>
				<div class="panel">
					<c:forEach var="categoryList" items="${categoryList}">
						<div class="side_menu_list">
							<a href="productGroup?prd_category=${categoryList.code}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${categoryList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 브랜드 -->
			<div class="left_side_menu_border">
				<a class="accordion">
					<h5 class="left_side_menu_title_font">브랜드</h5>
					<input class="arrow_img" type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/arrow-down.png">
				</a>
				<div class="panel">
					<c:forEach var="brandList" items="${brandList}" varStatus="loop">
						<div class="side_menu_list">
							<a href="productGroup?prd_category=${param.prd_category}&brand=${brandList.code}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${brandList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 상품상태 -->
			<div class="left_side_menu_border">
				<a class="accordion">
					<h5 class="left_side_menu_title_font">상품상태</h5>
					<input class="arrow_img" type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/arrow-down.png">
				</a>
				<div class="panel">
					<c:forEach var="statusList" items="${statusList}" varStatus="loop">
						<div class="side_menu_list">
							<a href="productGroup?prd_category=${param.prd_category}&brand=${param.brand}&status=${statusList.code}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${statusList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 메시지 -->
			<div class="left_side_menu_border">
				<a class="accordion">
					<h5 class="left_side_menu_title_font">메시지</h5>
					<input class="arrow_img" type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/arrow-down.png">
				</a>
				<div class="panel">
					<c:forEach var="messageList" items="${messageList}" varStatus="loop">
						<div class="side_menu_list">
							<a href="productGroup?prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${messageList.code}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${messageList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</aside> --%>
		
		<!-- 상품목록 본문 -->	
		<div>
			<%-- <div>
				<ol class="breadcrumb order_by_list">
				  <li class="breadcrumb-item">
				  	<a href="productGroup?kind=1&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">낮은가격순</a>
				  </li>
				  <li class="breadcrumb-item">
				  	<a href="productGroup?kind=2&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">높은가격순</a>
				  </li>
				  <li class="breadcrumb-item">
				  	<a href="productGroup?kind=3&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">최신순</a>
				  </li>
				  <!-- <li class="breadcrumb-item active">Data</li> -->
				</ol>
			</div> --%>
			<!-- 상품목록 -->
			<div class="item-list">
				<!-- 개별 상품 -->
				<c:forEach var="productGroup" items="${productGroups}">
					<a class="pproduct" href="detailView?pg_no=${productGroup.pg_no}" style="margin: 10px;">
					<div>
						<div><img class="productGroup" src="data:${productGroup.img_type};base64, ${productGroup.encodedFile}"></div>
						<div class="productGroup-name">${productGroup.pg_name}</div>
						<div class="productGroup-orgprice">
							<div>${productGroup.prd_org_price}</div>
							<span>원</span>
						</div>
						<div class="productGroup-prdprice">
							<div>${productGroup.prd_price}</div>
							<span>원</span>
						</div>
					</div>
					</a>
				</c:forEach>
			</div>
			
			<!-- 페이징 -->
			<%-- <div class="card-body">
				<table class="table table-sm table-bordered">
					<tr>
						<td colspan="4" class="text-center" style="background-color: white; border-style: hidden;">
							<div>
								<a class="btn btn-outline-primary btn-sm" href="productGroup?pageNo=1&kind=${param.kind}&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-outline-info btn-sm" href="productGroup?pageNo=${pager.startPageNo-1}&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}">이전</a>
								</c:if>
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm" href="productGroup?pageNo=${i}&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-danger btn-sm" href="productGroup?pageNo=${i}&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}">${i}</a>
									</c:if>
								</c:forEach>
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm" href="productGroup?pageNo=${pager.endPageNo+1}&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}">다음</a>
								</c:if>
								<a class="btn btn-outline-primary btn-sm" href="productGroup?pageNo=${pager.totalPageNo}&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}">맨끝</a>
							</div>
						</td>
					</tr>
				</table>
			</div> --%>					
		</div> 
	</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
