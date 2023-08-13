<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/productGroup.js"></script>

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
							<div><a href="productGroup?prd_category=${categoryList.code}">${categoryList.codeval}</a></div>
						</c:forEach>
					</div>
				</div>
			</div> 
			<div>
				<h1 style="font-size:15px; font-weight:bold;">브랜드</h1>
				<div class="brand"><input name="brand" id="brand1" type="checkbox" value="MON"><label for="brand">모노라이크</label></div>
				<div class="brand"><input name="brand" id="brand2" type="checkbox" value="KAT"><label for="brand">케이트가든</label></div>
				<div class="brand"><input name="brand" id="brand3" type="checkbox" value="BAB"><label for="brand">아기고홍</label></div>
				<div class="brand"><input name="brand" id="brand4" type="checkbox" value="SON"><label for="brand">데일리송</label></div>
				<div class="brand"><input name="brand" id="brand5" type="checkbox" value="FOO"><label for="brand">송미풋</label></div>
				<div class="brand"><input name="brand" id="brand6" type="checkbox" value="ROO"><label for="brand">마이데일리룸</label></div>
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<button class="accordion1" style= "cursor : pointer;">+더보기</button>
					<div class="panel">
						<div class="panel-body"><input name="brand" id="brand7" type="checkbox" value="SMI"><label for="brand">스마일리</label></div>
						<div class="panel-body"><input name="brand" id="brand8" type="checkbox" value="APP"><label for="brand">풋사과당</label></div>
						<div class="panel-body"><input name="brand" id="brand9" type="checkbox" value="BBU"><label for="brand">뿌뿌팬시</label></div>
						<div class="panel-body"><input name="brand" id="brand10" type="checkbox" value="HON"><label for="brand">홍홍앤데코</label></div>
					</div>
				</div>
			</div>
			<div>
				<h1 style="font-size:15px; font-weight:bold;">상품상태</h1>
				<c:forEach var="statusList" items="${statusList}" varStatus="loop">
					<div class="state">
						<input name="status" id="status${loop.index}" type="checkbox" value="${statusList.code}"/>
						<label for="status">${statusList.codeval}</label>
					</div>
				</c:forEach>
			</div>
			<div>
				<h1 style="font-size:15px; font-weight:bold;">카드/엽서 메시지</h1>
				<c:forEach var="messageList" items="${messageList}" varStatus="loop">
					<div class="message">
						<input name="message"id="message${loop.index}" type="checkbox" value="${messageList.code}"/>
						<label for="message">${messageList.codeval}</label>
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
							<li><a href="productGroup?kind=1">낮은가격순 | </a></li>
							<li><a href="productGroup?kind=2">높은가격순 | </a></li>
							<li><a href="productGroup?kind=3">최신순</a></li>
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
								<a class="btn btn-outline-primary btn-sm" href="productGroup?pageNo=1&kind=${param.kind}">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-outline-info btn-sm" href="productGroup?pageNo=${pager.startPageNo-1}&kind=${param.kind}">이전</a>
								</c:if>
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm" href="productGroup?pageNo=${i}&kind=${param.kind}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-danger btn-sm" href="productGroup?pageNo=${i}&kind=${param.kind}">${i}</a>
									</c:if>
								</c:forEach>
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm" href="productGroup?pageNo=${pager.endPageNo+1}&kind=${param.kind}">다음</a>
								</c:if>
								<a class="btn btn-outline-primary btn-sm" href="productGroup?pageNo=${pager.totalPageNo}&kind=${param.kind}">맨끝</a>
							</div>
						</td>
					</tr>
				</table>
			</div>					
		</div> 
		</div>
	</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
