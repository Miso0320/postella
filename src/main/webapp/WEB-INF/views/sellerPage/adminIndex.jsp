<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/sellerPage/header.jsp" %>	

	<!-- 내용시작 -->
	<div class="container-fluid">
	    <!-- Content Row -->
	    <div class="row">
	    	<!-- 전체 판매량 -->
	        <div class="col-xl-3 col-md-6 mb-4">
	            <div class="card border-left-primary shadow h-100 py-2">
	                <div class="card-body">
	                    <div class="row no-gutters align-items-center">
	                        <div class="col mr-2">
	                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">전체 판매량</div>
	                            <div class="h5 mb-0 font-weight-bold text-gray-800">327</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		
	        <!-- 전체 판매액 -->
	        <div class="col-xl-3 col-md-6 mb-4">
	            <div class="card border-left-success shadow h-100 py-2">
	                <div class="card-body">
	                    <div class="row no-gutters align-items-center">
	                        <div class="col mr-2">
	                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">전체 판매액</div>
	                            <div class="h5 mb-0 font-weight-bold text-gray-800">1,539,200</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		
	        <!-- 전체 상품 평균 별점 -->
	        <div class="col-xl-3 col-md-6 mb-4">
	            <div class="card border-left-info shadow h-100 py-2">
	                <div class="card-body">
	                    <div class="row no-gutters align-items-center">
	                        <div class="col mr-2">
	                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">평균별점</div>
	                            <div class="row no-gutters align-items-center">
	                                <div class="col-auto">
	                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">3.83</div>
	                                </div>
	                                <div class="col">
	                                    <div class="progress progress-sm mr-2">
	                                        <div class="progress-bar bg-info" role="progressbar"
	                                            style="width: 65%" aria-valuenow="50" aria-valuemin="0"
	                                            aria-valuemax="100"></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <div class="row">
	        <div class="col-lg-6 mb-4">
	            <!-- 상품개요 -->
	            <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                    <h6 class="m-0 font-weight-bold text-primary">상품별 판매량</h6>
	                </div>
	                <div class="card-body">
	                    <h4 class="small font-weight-bold">미드나잇 블루<span
	                            class="float-right">80%</span></h4>
	                    <div class="progress mb-4">
	                        <div class="progress-bar bg-danger" role="progressbar" style="width: 80%"
	                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
	                    </div>
	                    <h4 class="small font-weight-bold">초롱이 엽서<span
	                            class="float-right">70%</span></h4>
	                    <div class="progress mb-4">
	                        <div class="progress-bar bg-warning" role="progressbar" style="width: 70%"
	                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
	                    </div>
	                    <h4 class="small font-weight-bold">스페이스 퍼플<span
	                            class="float-right">50%</span></h4>
	                    <div class="progress mb-4">
	                        <div class="progress-bar" role="progressbar" style="width: 50%"
	                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
	                    </div>
	                    <h4 class="small font-weight-bold">봉봉이와 친구들<span
	                            class="float-right">40%</span></h4>
	                    <div class="progress mb-4">
	                        <div class="progress-bar bg-info" role="progressbar" style="width: 40%"
	                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
	                    </div>
	                    <h4 class="small font-weight-bold">버블티는 버블버블<span
	                            class="float-right">40%</span></h4>
	                    <div class="progress">
	                        <div class="progress-bar bg-success" role="progressbar" style="width: 40%"
	                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<%@ include file="/WEB-INF/views/sellerPage/footer.jsp" %>	
