<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/sellerPage/header.jsp" %>	
<!-- 전체 페이지 -->
<div class="container-fluid">
    <!-- 상품목록 타이틀 -->
    <h1 class="h3 mb-2 text-gray-800">상품 조회</h1>
    <p class="mb-4">등록한 상품을 조회할 수 있습니다.</p>

    <!-- 상품목록  -->
        <div class="card shadow mb-4">
        	<!-- 타이틀 및 정렬순 -->
            <div class="card-header py-3" style="display: flex; justify-content: space-between;">
                <h6 class="m-0 font-weight-bold text-primary">전체</h6>
                <div>
                	<a href="adminProductList?kind=3">최근등록순</a> |
                	<a href="adminProductList?kind=1">낮은 가격순</a> |
                	<a href="adminProductList?kind=2">높은 가격순</a>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
	                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
	                	<!-- 검색창 -->
	                	<div class="row">
	                		<div class="col-sm-12 col-md-6">
		                		<form action="adminProductList" method="get">
		                			<div id="dataTable_filter" class="dataTables_filter">
		                				<label>
		                					Search:
		                					<input type="search" name="keyword" class="form-control form-control-sm" placeholder aria-controls="dataTable" value="${param.keyword}">
		                					<input type="hidden" name="pageNo" value="1">
		                					<input type="hidden" name="kind" value="${param.kind}">
		                				</label>
		                			</div>
		                		</form>
	                		</div>
	                	</div>
	                	
	                	<!-- 상품목록데이터 -->
	                	<div class="row">
	                		<div class="col-sm-12">
			                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                        <thead>
			                            <tr>
			                                <th>상품명</th>
			                                <th>카테고리</th>
			                                <th>상품판매가</th>
			                                <th>배송비</th>
			                                <th>상품등록일</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <c:forEach var="productGroup" items="${productGroups}">
				                        	<tr>
				                                <td>${productGroup.prd_name}</td>
				                                <td>${productGroup.prd_category}</td>
				                                <td>${productGroup.prd_price}</td>
				                                <td>${productGroup.prd_ship_fee}</td>
				                                <td><fmt:formatDate value="${productGroup.prd_date}" pattern="yyyy.MM.dd"/></td>
				                            </tr>
			                        	</c:forEach>
			                        </tbody>
			                    </table>
	                		</div>
	                	</div>
	                	
	                	<!-- 페이징 -->
	                	<div class="row">
	                		<div class="col-sm-12 col-md-9">
	                			<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
	                				Showing ${pager.pageNo} to ${pager.pagesPerGroup} of ${pager.totalRows} entries
	                			</div>
	                		</div>
	                		<div class="col-sm-12 col-md-3">
	                			<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
	                				<ul class="pagination">
	                					<li class="paginate_button page-item previous" id="dataTable_previous">
	                						<a href="adminProductList?pageNo=1&kind=${param.kind}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">FIRST</a>
	                					</li>
	                					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		                					<c:if test="${pager.pageNo == i}">
			                					<li class="paginate_button page-item active">
			                						<a href="adminProductList?pageNo=${i}&kind=${param.kind}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
			                					</li>
		                					</c:if>
		                					<c:if test="${pager.pageNo != i}">
			                					<li class="paginate_button page-item">
			                						<a href="adminProductList?pageNo=${i}&kind=${param.kind}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
			                					</li>
		                					</c:if>
	                					</c:forEach>
	                					<li class="paginate_button page-item next" id="dataTable_next">
	                						<a href="adminProductList?pageNo=${pager.totalPageNo}&kind=${param.kind}&keyword=${param.keyword}" aria-controls="dataTable" data-dt-idx="${pager.endPageNo}" tabindex="0" class="page-link">LAST</a>
	                					</li>
	                				</ul>
	                			</div>
	                		</div>
	                	</div>
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/sellerPage/footer.jsp" %>	