<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png" type="image/x-icon">
	    <title>POSTELLA - SORRY!</title>
		
		<!-- CSS -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css">
		
		<!-- 자바스크립트&부트스트랩 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	</head>

	<body id="page-top">
	    <div id="wrapper">
	        <div id="content-wrapper" class="d-flex flex-column">
	            <div id="content">
	            	<!-- 네비게이션바 -->
	                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	                    <ul class="navbar-nav ml-auto">
	                        <li class="nav-item dropdown no-arrow">
                               <a href="productGroup">
                               	<img class="header_logo" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고" style="height: 41px; width: 174px;">
                               </a>
	                        </li>
	                    </ul>
	                </nav>
					
					<!-- 본문내용 -->
	                <div class="container-fluid">
	                    <div class="text-center" style="margin: 150px;">
	                        <div class="error mx-auto" data-text="500">500</div>
	                        <p class="lead text-gray-800 mb-5">서버가 정상적으로 동작하지 않습니다. 다시 시도해주세요.</p>
	                        <a href="${pageContext.request.contextPath}">&larr; 메인화면으로 돌아가기</a>
	                    </div>
	                </div>
	            </div>
	            
	            <!-- 푸터 -->
	            <footer class="sticky-footer bg-white">
	                <div class="container my-auto">
	                    <div class="copyright text-center my-auto">
	                        <span>Copyright &copy; POSTELLA</span>
	                    </div>
	                </div>
	            </footer>
	        </div>
	    </div>
	</body>
</html>