<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
		<title>배송 요청사항</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="addressRequest.js"></script>
		<script>
		 function setRequestText(){
			 parentPage = window.opener.location.href;
			 if(parentPage.includes('addAddress')) {
				 window.opener.document.getElementById("addAddress-request").value = $("input[name='select']:checked").val();
				 window.close();
			 } else if(parentPage.includes('editAddress')) {
				 window.opener.document.getElementById("addAddress-request").value = $("input[name='select']:checked").val();
				 window.close();
			 }
			 
        }
		</script>
		
		<style>
			#header {
				font-family: apple sd gothic neo, malgun gothic, nanumbarungothic, nanumgothic, dotum, sans-serif;
				margin: 0;
				border: 0;
				padding: 9px 0;
				color: #111;
				font-size: 16px;
				line-height: 22px;
				text-align: center;
				font-weight: bold;
				border-bottom: 1px solid rgb(224, 224, 224);
			}
			
			#requestContainer {
				padding-top: 15px;
				padding-bottom: 15px;
				margin-left: 18px;
				margin-top: 10px;
				margin-right: 158px;
				padding-right: 40px;
			}
			
			.notice {
				padding: 10px;
				margin-bottom: 20px;
				background-color: #fef8e5;
				font-size: 12px;
				line-height: 2;
				font-weight: 500;
			}
			
			input[type="text"] {
				border: 1px solid rgb(224, 224, 224);
				height: 48px;
				padding-left: 10px;
				margin-top: 10px;
			}
			
			.on {
				border: 1px solid rgb(224, 224, 224);
				padding-top: 15px;
				padding-bottom: 10px;
				padding-left: 20px;
			}
			
			.num {
				border: 1px solid rgb(224, 224, 224);
				padding-top: 20px;
				padding-left: 20px;
				padding-bottom: 10px;
				margin-bottom: 20px;
			}
			
			.selec {
				margin-bottom: 20px;
				font-size: 14px;
				color: #555555;
				font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
					nanumgothic, dotum, sans-serif;
			}
			
			.doorNumNotice {
				margin-bottom: 10px;
				font-size: 14px;
				color: #555555;
				font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
					nanumgothic, dotum, sans-serif;
			}
			
			.doorNum {
				font-family: apple sd gothic neo, malgun gothic, nanumbarungothic,
					nanumgothic, dotum, sans-serif;
				font-size: 16px;
				line-height: 24px;
				color: #111;
				font-weight: bolder;
			}
			
			#agreeSave {
				text-align: center;
				background-color: #0073e9;
				color: #fff;
				border: 0;
				box-shadow: inset 0 -2px 0 rgba(0, 0, 0, 0.38);
				border-radius: 2px;
				cursor: pointer;
				margin-bottom: 100px;
				padding-top: 15px;
				padding-bottom: 15px;
				width: -webkit-fill-available;
			}
		</style>
	
	</head>
	<body>
		<div id="header">배송 요청사항</div>
	
		<div id="requestContainer" style="width: 100%; margin-top: 10px;">
	
			<div class="notice">
				<span style="padding-botton: 10px;">사회적 거리두기를 위해, 모든 배송을 비대면으로 진행합니다.<br> ‘직접 받고 부재 시 문 앞’을 선택해도 문 앞으로 배송합니다.
				</span>
	
	
			</div>
			<div class="selec">
				<div class="on">
					<label> 
						<input type="radio" id="door" name="select" value="DOR" checked="checked" /> 문 앞
					</label>
				</div>
				<div class="on">
					<label> 
						<input type="radio" id="ftof" name="select" value="PER" /> 직접 받고 부재 시 문 앞
					</label>
				</div>
				<div class="on">
					<label> 
						<input type="radio" id="securityOffice" name="select" value="SEC" /> 경비실
					</label>
				</div>
				<div class="on">
					<label> 
						<input type="radio" id="delBox" name="select" value="BOX" /> 택배함
					</label>
				</div>
				
			<div><button id="agreeSave" onclick="setRequestText()">동의하고 저장하기</button></div>
		</div>
	</body>
</html>