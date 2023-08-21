<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
	    <title>POSTELLA SELLER</title>
	
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	    
		<!-- CSS -->		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css">
	</head>

	<body id="page-top">
	
	    <!-- 전체페이지 -->
	    <div id="wrapper">
			<!-- 사이드바 -->	
	        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	            <!-- 사이드바 타이틀 -->
	            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminIndex">
	                <div class="sidebar-brand-icon rotate-n-15">
	                    <img src="${pageContext.request.contextPath}/resources/img/admin/index/logo_white.png" style="width: 30px;">
	                </div>
	                <div class="sidebar-brand-text mx-3">POSTELLA SELLER</div>
	            </a>
	            
	            <hr class="sidebar-divider my-0">
				
				<!-- 판매자 페이지 메인 -->
	            <li class="nav-item active">
	                <a class="nav-link" href="adminIndex">
	                    <span>판매자 메인</span>
	                </a>
	            </li>
	
	            <hr class="sidebar-divider">
	
	            <!-- 상품 관리 메뉴 -->
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
	                    <img src="${pageContext.request.contextPath}/resources/img/admin/index/product.png" style="width: 20px; opacity: 0.5;">
	                    <span>상품 관리</span>
	                </a>
	                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <a class="collapse-item" href="adminProductList">상품 조회</a>
	                        <a class="collapse-item" href="#">상품 등록</a>
	                    </div>
	                </div>
	            </li>
	
	            <!-- 게시판 관리 메뉴 -->
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
	                    <img src="${pageContext.request.contextPath}/resources/img/admin/index/gear.png" style="width: 20px; opacity: 0.5;">
	                    <span>게시판 관리</span>
	                </a>
	                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <a class="collapse-item" href="noticeList">공지사항 관리</a>
	                        <a class="collapse-item" href="#">FAQ 관리</a>
	                        <a class="collapse-item" href="#">리뷰관리</a>
	                        <a class="collapse-item" href="#">문의관리</a>
	                    </div>
	                </div>
	            </li>
	        </ul>
	
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	            <div id="content">
	                <!-- Topbar -->
	                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	                    <!-- 탑바 -->
	                    <ul class="navbar-nav ml-auto">
	                        <!-- 사용자 프로필 메뉴 -->
	                        <li class="nav-item dropdown no-arrow">
	                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">아기고양이님</span>
	                                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/index/profile.png">
	                            </a>
	                            <!-- 사용자 프로필 드롭다운 메뉴 -->
	                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="userDropdown">
	                                <a class="dropdown-item" href="#">
	                                    <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/index/user.png" style="width: 20px;">내정보수정
	                                </a>
	                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                                   <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/img/admin/index/logout.png" style="width: 20px;">로그아웃
	                                </a>
	                            </div>
	                        </li>
	                    </ul>
	                </nav>
