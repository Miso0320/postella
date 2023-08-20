<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/sellerPage/header.jsp" %>	
<!-- 전체 페이지 -->
<div class="container-fluid">
    <!-- 상품목록 타이틀 -->
    <h1 class="h3 mb-2 text-gray-800">상품 조회</h1>
    <p class="mb-4">등록한 상품을 조회할 수 있습니다.</p>

    <!-- 상품목록  -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">전체</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
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
                            <tr>
                                <td>미드나잇 블루</td>
                                <td>포토 엽서</td>
                                <td>4800</td>
                                <td>3000</td>
                                <td>2023/08/03</td>
                            </tr>
                            <tr>
                                <td>선셋 오렌지</td>
                                <td>포토 엽서</td>
                                <td>3800</td>
                                <td>3000</td>
                                <td>2023/08/03</td>
                            </tr>
                            <tr>
                                <td>스페이스 퍼플</td>
                                <td>포토 엽서</td>
                                <td>4500</td>
                                <td>3000</td>
                                <td>2023/08/03</td>
                            </tr>
                            <tr>
                                <td>무디 그레이</td>
                                <td>포토 엽서</td>
                                <td>2500</td>
                                <td>3000</td>
                                <td>2023/08/03</td>
                            </tr>
                            <tr>
                                <td>방귀대장뿡뿡이</td>
                                <td>디자인패턴 엽서</td>
                                <td>4200</td>
                                <td>3000</td>
                                <td>2023/08/04</td>
                            </tr>
                            <tr>
                                <td>방귀대장봉봉이</td>
                                <td>디자인패턴 엽서</td>
                                <td>4800</td>
                                <td>23</td>
                                <td>2023/08/04</td>
                            </tr>
                            <tr>
                                <td>아기고양이의 모험</td>
                                <td>그림/일러스트 엽서</td>
                                <td>4300</td>
                                <td>3000</td>
                                <td>2023/08/04</td>
                            </tr>
                            <tr>
                                <td>아기고양이의 친구</td>
                                <td>그림/일러스트 엽서</td>
                                <td>4900</td>
                                <td>3000</td>
                                <td>2023/08/04</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/sellerPage/footer.jsp" %>	