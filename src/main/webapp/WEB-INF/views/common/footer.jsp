<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../favicon.ico" type="image/x-icon">
		<title>Insert title here</title>
		
				<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>		
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>		
		<style>
			
			* {
				margin: 0;
				padding: 0;
			}
			
			.flayer1 a {
				text-decoration: none;
			}
			.flayer2 a {
				text-decoration: none;
			}
			.flayer3 a {
				text-decoration: none;
			}
			.flayer4 a {
				text-decoration: none;
			}
			
			.flayer1 ul {
				list-style: none;
			}
			.flayer2 ul {
				list-style: none;
			}
			.flayer3 ul {
				list-style: none;
			}
			.flayer4 ul {
				list-style: none;
			}
			
			
			.flayer1 li {
				list-style: none;
			}
			.flayer2 li {
				list-style: none;
			}
			.flayer3 li {
				list-style: none;
			}
			.flayer4 li {
				list-style: none;
			}
			
			.flayer2 div {
				 display: block;
			}
			.flayer3 div {
				 display: block;
			}
			
			footer {
				position: relative;
				display: flex;
				flex-direction: column;
			}
			
			.flayer1 {
				border-bottom: #ddd solid 1px;
				height: 34px;
			    text-align: center;
			    padding: 5px 0px;
			    white-space: nowrap;
			}
			
			.flayer1 a{
				display: inline-block;
			    white-space: nowrap;
			    padding: 0px 14px;
			    font-size: 12px;
			    color: #555;
			    height: 12px;
			    border-left: #888 solid 1px;
			}
			.footer-site-picker {
				position: relative;
			    font-size: 14px;
			    display: inline-block;
			    text-align: left;
			    margin-top: -9px;
			    color: #212b36;
			    margin-left: 5px;
			}
			
			.dropbtn {
				display: flex;
				flex-direction: row;
				justify-content: space-between;
			}
			
			.footer-site-picker label {
			    height: 30px; 
			    border: 1px solid #c4cdd5;
			    display: flex;
			    align-items: center;
			    width: 180px;
			    border-radius: 3px;
			    padding: 12px 14px;
			    box-sizing: border-box;
			    cursor: pointer;
			    background-color: white;
			}
			.site-picker-arrow {
			    display: inline-block;
			    width: 14px;
			    height: 14px;
			    background-color: #333;
			    -webkit-mask-size: 100%;
			    -webkit-mask-position: center;
			    -webkit-mask-repeat: no-repeat;
			    mask-repeat: no-repeat;
			    -webkit-mask-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTExLjI0MTggNC41NTg2MkMxMS40NjI2IDQuMzIzOTcgMTEuODMxNyA0LjMxMjcyIDEyLjA2NjQgNC41MzM0OEMxMi4yODMgNC43MzcyNiAxMi4zMDkyIDUuMDY3NDkgMTIuMTM4NCA1LjMwMTY1TDEyLjA5MTUgNS4zNTgwNUw3LjQyNjU1IDEwLjMxNjRDNy4yMTI3MiAxMC41NDM3IDYuODYyMSAxMC41NiA2LjYyODY2IDEwLjM2NTJMNi41NzY5OCAxMC4zMTY1TDEuOTA4NjIgNS4zNTgyMUMxLjY4Nzc4IDUuMTIzNjUgMS42OTg5IDQuNzU0NDcgMS45MzM0NiA0LjUzMzYyQzIuMTQ5OTggNC4zMjk3NyAyLjQ4MTIgNC4zMjM1NiAyLjcwNDU4IDQuNTA4M0wyLjc1ODA1IDQuNTU4NDZMNy4wMDExNiA5LjA2NDk5TDExLjI0MTggNC41NTg2MloiIGZpbGw9IiMyMTJCMzYiLz4KPC9zdmc+Cg==);
			}
			.fdropdown-content {
			    position: absolute;
			    overflow: hidden;
			    list-style: none;
			    margin: 0;
			    padding: 5px 0;
			    background: #fff;
			    box-shadow: 0 1px 7px rgba(0,0,0,0.26);
			    top: 36px;
			    left: 0;
			    width: 180px;
			    border-radius: 4px;
			    display: none;
			}
			
			.fdropdown-content a {
			    white-space: nowrap;
			    text-decoration: none;
  				display: block;
			}
			
			.footer-site-picker:hover .fdropdown-content {
			  display: block;
			}
			
			.footer-site-picker:hover .site-picker-arrow {
				transform: rotate(180deg);
				transition: 0.3s;
			}
			
			.flayer2 {
				width: 1020px;
			    height: 100px;
			    margin: 30px auto;
			    font-size: 12px;
			    color: #555;
			    line-height: 150%;
			    display: flex;
			    flex-direction: row;
			    padding: 0px 10px;
			}
			
			.flayer2 h1 {
			    width: 150px;
			    background-image: none;
			}
			
			.fseller-info {
				white-space: nowrap;
			}
			
			.fseller-info p {
				margin: 0;
			}
			
			.footer-sns {
				display:flex;
				flex-direction: rows;
				list-style: none;
				padding-top: 40px;
			}
			
			.footer-sns a {
				margin: 0 5px;
			}
			
			.footer-certification-list {
				width: 968px;
				height: 80px; 
				margin: 0 auto; 
				background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v12.png) no-repeat; 
				background-position: -44px -92px; 
				position: relative
			}
			
			.fbottom {
				padding-top:9px; 
				white-space: nowrap;
			}
			
			.flayer4 {
				background-color: #333; 
				color: #888888;
			}
			
			.f-info {
				margin: 0 100px; 
				white-space: nowrap;
			}
			
			.f-info div{
				margin: 10px 0px; 
			}
			
			.fservice p {
			 	margin: 0; 
			}
			
			.real-bottom {
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				padding: 0px 10px;
			}
			
		</style>
	</head>
	<body>
		<footer>
			<div class="flayer1">
				<a href="https://news.coupang.com/" style="border-left: 0;">회사소개</a>
				<a href="https://ir.aboutcoupang.com/English/home/">Investor Relations</a>
				<a href="https://www.coupang.jobs/kr/">인재채용</a>
				<a href="https://marketplace.coupangcorp.com/s/">입점 / 제휴문의</a>
				<a href="https://mc.coupang.com/ssr/desktop/contact/notice">공지사항</a>
				<a href="https://csmessenger.coupang.com/cs-center/voc/main">고객의 소리</a>
				<a href="https://www.coupang.com/np/policies/terms">이용약관</a>
				<a href="https://privacy.coupang.com/ko/center/coupang">개인정보 처리방침</a>
				<a href="https://rocketpay.coupang.com/rocketpay/operationTerms/coupangPcFooter">쿠팡페이 이용약관</a>
				<a href="https://privacy.coupang.com/ko/land/coupay/">쿠팡페이 개인정보처리방침</a>
				<a href="https://www.coupang.com/np/safety">신뢰관리센터</a>
				<a href="https://partners.coupang.com/">제휴마케팅</a>
				<a href="https://ads.coupang.com/">광고안내</a>
				<div class="footer-site-picker">
					<label class="dropbtn">
					  <p style="margin-bottom: 0;">Global Site</p>
					  <span class="site-picker-arrow"></span>
				  </label>
				  <div class="fdropdown-content">
				  <a href="https://www.tw.coupang.com">Coupang Taiwan 酷澎台灣</a>
				  </div>
				</div>
			</div>
			<div class="flayer2">
				<h1><img class="flogo" src="img/coupang.png" alt="" style="width: 90px;"></h1>
				<div class="fseller-info">
					<p align="left">상호명 및 호스팅 서비스 제공 : 쿠팡(주)</p>
					<p align="left">대표이사 : 강한승,박대준</p>
					<p align="left"> 서울시 송파구 송파대로 570 </p>
					<p align="left">사업자 등록번호 : 120-88-00767 </p>
					<p align="left">통신판매업신고 : 2017-서울송파-0680 </p>
					<p align="left" style="text-decoration: underline;">
						<a href>사업자정보 확인></a>
					</p>
					</div>
					
					<div class="f-info">
						<div class="info" align="left">
							<strong style="font-weight:bold;">365고객센터</strong>" | 전자금융거래분쟁처리담당" <br>
						</div>
						<div align="left"><strong class="fnum" style="font-size:24px;">1577-7011(유료)</strong> <br>"서울시 송파구 송파대로 570"</div>
						<div align="left"><span>e-mail : help@coupang.com</span></div>	
					</div> 
				<div class="fservice" style="white-space: nowrap;">
					<p align="left" style="font-weight:bold;">우리은행 채무지급보증 안내</p>
					<p align="left">당사는 고객님이 현금 결재한 금액에 대해</p>
					<p align="left">우리은행과 채무지급보증 계약을 체결하여</p>
					<p align="left">안전거래를 보장하고 있습니다</p>
					<p align="left" style="text-decoration: underline;"><a href>서비스 가입사실 확인></a></p>
				</div>
			</div>
			<div class="flayer3">
				<div class="footer-certification-list">
        	</div>
			</div>
			<div class="flayer4">
				<div class="real-bottom">
		            <p align="left" class="fbottom" style="display: inline-block;">사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.
		                <br> 마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 
		                <br>쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지 않습니다. 
		                <br> 쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거 분쟁이 처리됩니다.
		                <br> Copyright © Coupang Corp. 2010-2022 All Rights Reserved.
		            </p>
		            <div class="footer-sns">
	                	<a href="https://www.facebook.com/Coupang.korea"><img class="sns-img" src="img/facebook.png" alt="" style="width:34px; height:34px;"></a>
	                	<a href="https://news.coupang.com/"><img class="sns-img" src="img/naverblog.png" alt="" style="width:34px; height:34px;"></a>
	                	<a href="https://www.instagram.com/coupang/"><img class="sns-img" src="img/instagram.png" alt="" style="width:34px; height:34px;"></a>
		            </div>
		           
		        </div>
			</div>
		</footer>
	</body>
</html>

