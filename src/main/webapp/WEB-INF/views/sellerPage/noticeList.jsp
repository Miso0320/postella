<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/sellerPage/header.jsp" %>	
<!-- 전체 페이지 -->
<div class="container-fluid">
    <!-- 상품목록 타이틀 -->
    <h1 class="h3 mb-2 text-gray-800">공지사항 관리</h1>
    <p class="mb-4">공지사항을 작성, 수정 및 삭제 할 수 있습니다.</p>

    <!-- 상품목록  -->
        <div class="card shadow mb-4">
        	<!-- 타이틀 및 정렬순 -->
            <div class="card-header py-3" style="display: flex; justify-content: space-between;">
                <h6 class="m-0 font-weight-bold text-primary">전체</h6>
                <div class="dropdown no-arrow mb-4">
                    <button class="btn btn-secondary dropdown-toggle" type="button"
                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        게시판 종류
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="noticeList?bo_kind=1">자주묻는질문</a>
                        <a class="dropdown-item" href="noticeList?bo_kind=2">공지사항</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
	                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
	                	<!-- 상품목록데이터 -->
	                	<div class="row">
	                		<div class="col-sm-12">
			                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                        <thead>
			                            <tr>
			                                <th>게시글 번호</th>
			                                <th>게시판 종류</th>
			                                <th>게시물 제목</th>
			                                <th>작성일</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <c:forEach var="BoardGroups" items="${BoardGroups}">
				                        	<tr>
				                                <td>${BoardGroups.bo_no}</td>
				                                <td>${BoardGroups.bo_kind}</td>
				                                <td>${BoardGroups.bo_title}</td>
				                                <td><fmt:formatDate value="${BoardGroups.bo_date}" pattern="yyyy.MM.dd"/></td>
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