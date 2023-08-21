<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
	    <title>POSTELLA SELLER LOGIN</title>
	    
		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	    
		<!-- CSS -->		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
	    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css"> --%>
	    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css">
	</head>

	<body class="bg-gradient-primary">
	    <div class="container">
	        <div class="row justify-content-center">
	            <div class="col-xl-10 col-lg-12 col-md-9">
	                <div class="card o-hidden border-0 shadow-lg my-5">
	                    <div class="card-body p-0">
	                        <div class="row">
	                        	<!-- 왼쪽 이미지 -->
	                            <img src="${pageContext.request.contextPath}/resources/img/admin/login/post.jpg" style="width: 460px;">
	                            <div class="col-lg-6">
	                                <div class="p-5">
	                                	<!-- 로그인 타이틀 -->
	                                    <div class="text-center">
	                                        <h1 class="h4 text-gray-900 mb-4">POSTELLA SELLER LOGIN</h1>
	                                    </div>
	                                    <!-- 로그인정보 입력란 -->
	                                    <form class="user">
	                                        <div class="form-group">
	                                            <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp"
	                                                placeholder="이메일 주소">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호">
	                                        </div>
	                                        <div class="form-group">
	                                            <div class="custom-control custom-checkbox small">
	                                                <input type="checkbox" class="custom-control-input" id="customCheck">
	                                                <label class="custom-control-label" for="customCheck">로그인 정보 기억하기</label>
	                                            </div>
	                                        </div>
	                                        <a href="adminIndex" class="btn btn-primary btn-user btn-block">로그인</a>
	                                    </form>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</body>
</html>