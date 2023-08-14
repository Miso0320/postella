<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/productGroup.js"></script>

<c:if test="${searchResult}">
	<div id="container">
		<section class="productGroupSection">
			<aside>
				<div>
					<h1 style="font-size:15px; font-weight:bold;">카테고리</h1>
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<button class="accordion" style= "cursor : pointer; font-weight:bolder;">엽서
							<input id="arrow1" type="image" src="${pageContext.request.contextPath}/resources/img/productGroup/arrow-down.png" width="12px" height="12px"/>
						</button>
						<div class="panel">
							<c:forEach var="categoryList" items="${categoryList}">
								<div>
									<a href="productGroup?prd_category=${categoryList.code}&brand=${param.brand}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">${categoryList.codeval}</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div> 
				<div>
					<h1 style="font-size:15px; font-weight:bold;">브랜드</h1>
					<c:forEach var="brandList" items="${brandList}" varStatus="loop">
						<div class="brand">
							<a href="productGroup?prd_category=${param.prd_category}&brand=${brandList.code}&status=${param.status}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${brandList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
				<div>
					<h1 style="font-size:15px; font-weight:bold;">상품상태</h1>
					<c:forEach var="statusList" items="${statusList}" varStatus="loop">
						<div class="state">
							<a href="productGroup?prd_category=${param.prd_category}&brand=${param.brand}&status=${statusList.code}&message=${param.message}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${statusList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
				<div>
					<h1 style="font-size:15px; font-weight:bold;">카드/엽서 메시지</h1>
					<c:forEach var="messageList" items="${messageList}" varStatus="loop">
						<div class="message">
							<a href="productGroup?prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${messageList.code}&kind=${param.kind}&keyword=${param.keyword}&pageNo=1">
								${messageList.codeval}
							</a>
						</div>
					</c:forEach>
				</div>
			</aside>	
			<div class="article">
				<div class="post" style="padding: 15px 0px;">
					<h3>엽서</h3>
				</div>
				<div>
					<div>
						<ul id="list" class="list" style="white-space: nowrap;">
							<div class="list2">
								<li><a href="productGroup?kind=1&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">낮은가격순 | </a></li>
								<li><a href="productGroup?kind=2&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">높은가격순 | </a></li>
								<li><a href="productGroup?kind=3&prd_category=${param.prd_category}&brand=${param.brand}&status=${param.status}&message=${param.message}&keyword=${param.keyword}">최신순</a></li>
							</div> 
						</ul>
					</div>
				</div>
				<div class="item-list">
					<c:forEach var="productGroup" items="${productGroups}">
						<a href="detailView?pg_no=${productGroup.pg_no}" class="pproduct">
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
				<div class="card-body">
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
				</div>					
			</div> 
		</section>
	</div>
</c:if>

<!-- 검색 결과 없는 경우 -->
<c:if test="${!searchResult}">
	<div class="product_not_found_container">
		<div class="product_not_found_img_container">
			<img class="product_not_found_img" src="${pageContext.request.contextPath}/resources/img/productGroup/not_found.png"">
		</div>
		<div>
			<span class="product_not_found_text_1">
				<strong>'${param.keyword}'</strong>에 대한 검색결과가 없습니다.
			</span>
			<span class="product_not_found_text_2">다른 검색어를 입력하거나 철자를 확인해 보세요.</span>
		</div>
	</div>
</c:if>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
