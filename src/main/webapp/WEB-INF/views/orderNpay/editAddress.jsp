<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko_KR">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>배송지 수정</title>
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addAddress.css">
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function kakaopost() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                 document.getElementById("postcode").value = data.zonecode;
		                document.getElementById("recieveAddress").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
		    
		    //배송 요청 페이지 열기
		    function openDeliveryRequestPage() {
		    	delReqChild = window.open('deliveryRequest', '_blank', 'width=518, height=666, left=200, top=200');
		    	delReqChild.dataFromParent = "editAddress";
		    }
		  	
		    //핸드폰 번호에 - 붙이기
		    function oninputPhone(target) {
		        target.value = target.value
		            .replace(/[^0-9]/g, '')
		            .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
		    }
		    
		 	//기본 배송지 체크
		    function unchekcedValue() {
		      var chkBox = document.querySelector("#customCheck1");
	          if($('#customCheck1').is(":checked")) {
	             $('#customCheck1').val("Y");
	          } else {
	             $('#customCheck1').val("N");
	          }
		    }
		 	
		    //제출 전에 모든 정보가 입력되었는지 확인
		    $(document).ready(function () {
		    	var form = $("#customCheck1");
		    	form.submit(unchekcedValue);
			    $("#addrForm").submit(function (event) {
			        // 폼 제출을 초기에 막음
			        event.preventDefault();
			
			        // 이전의 오류 메시지 지움
			        $("#error-message").text("");
			
			        // 필수 입력 필드가 비어있는지 확인
			        var recipient = $("#addressbookRecipient").val(); //받는 사람
			        var postcode = $("#postcode").val(); //우편 번호
			        var recieveAddress = $("#recieveAddress").val(); //주소
			        var detailedAddress = $("#detailAddress").val(); //상세 주소
			        var phoneNumber = $("#addressbookCellphone").val(); //핸드폰 번호
			        var request = $("#addAddress-request").val(); //배송 요청사항
			        var errorCheck = 0;
			        
			        if (recipient === ""){
			        	$("#name-error").text("받는 사람을 입력하세요.");
			        	errorCheck++;
			        } 
			        if (postcode === "" || recieveAddress === "" || detailedAddress === "") {
			        	$("#address-error").text("주소를 입력하세요.");
			        	errorCheck++;
			        }
			        if (phoneNumber === "") {
			        	$("#tel-error").text("연락처를 입력하세요.");
			        	errorCheck++;
			        }
			        if (request === "") {
			            $("#request-error").text("배송 요청사항을 입력하세요.");
			            errorCheck++;
			        } 
			        if (errorCheck == 0){
			            // 모든 필수 입력란이 채워져 있으면 폼을 제출
			            unchekcedValue();
			            this.submit();
			        }
			    });
			});
	    </script>
	</head>
	<body>
	    <div class="content-head content-head--fixed">
	    	<h1 class="content-head__title">배송지 수정</h1>
		</div>
		
		
		<div class="content-body__corset">
		    <form action="editAddress" method="post" class="_addressBookSaveForm" accept-charset="UTF-8" modelAttribute="deliverAddress">
		    
		    	<!-- 받는 사람 입력 -->
			    <div class="icon-text-field__frame-box _addressBookRecipientRoot">
				    <div class="icon-text-field__icon-container">
				        <div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
				            <i class="icon-text-field__icon--person"></i>
				        </div>
				        <div class="icon-text-field__input-container">
				            <label for="addressbookRecipient" class="icon-text-field__input-area">
				                <input type="text" class="icon-text-field__input _addressBookRecipientInput" id="addressbookRecipient" name="da_name" maxlength="40" placeholder="받는 사람" value="${address.da_name}">
				            </label>
				        </div>
				    </div>
				</div>
				<div id="name-error" style="color: red;"></div>
				
				<!-- 받을 주소 입력 -->
				<div class="icon-text-field__frame-box _addressBookAddressErrorStatus">
				    <div class="icon-text-field__icon-container">
				        <div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
				            <i class="icon-text-field__icon--map-pin"></i>
				        </div>
				        <div class="icon-text-field__input-container">
				            <label for="recieveAddress" class="icon-text-field__input-area" id="addressSet">
				            	<input type="text" class="icon-text-field__input _addressBookRecipientInput" id="postcode" onclick="kakaopost()" name="da_postcode" maxlength="40" placeholder="우편번호" value="${address.da_postcode}">
				                <input type="text" class="icon-text-field__input _addressBookRecipientInput" id="recieveAddress" onclick="kakaopost()" name="da_adr" maxlength="40" placeholder="받을 주소" value="${address.da_adr}">
				            	<input type="text" class="icon-text-field__input _addressBookRecipientInput" id="detailAddress" name="da_detail_adr" maxlength="40" placeholder="상세 주소" value="${address.da_detail_adr}">
				            </label>
				        </div>
				    </div>
				</div>
				<div id="address-error" style="color: red;"></div>
				
				<!-- 연락처 입력-->
				<div class="icon-text-field icon-text-field--input-util _addressBookCellphoneAddonStatus">
				    <div class="icon-text-field__frame-box _addressBookCellphoneErrorStatus">
				        <div class="icon-text-field__icon-container">
				            <div class="icon-text-field__icon-box icon-text-field__icon-box--fix">
				                <i class="icon-text-field__icon--cellphone"></i>
				            </div>
				            <div class="icon-text-field__input-container">
				                <label for="addressbookCellphone" class="icon-text-field__input-area">
				                    <input type="tel" class="icon-text-field__input _addressBookCellphoneInput" id="addressbookCellphone" name="da_tel" placeholder="연락처" value="${address.da_tel}" oninput="oninputPhone(this)">
				                </label>
				            </div>
				        </div>
				    </div>
				</div>
				<div id="tel-error" style="color: red;"></div>
				
				<!-- 배송 요청사항 입력 -->
			    <div class="icon-text-field__frame-box _addressBookDeliveryPreferencesErrorStatus" id="requestBox">
			        <div class="icon-text-field__icon-container">
			            <div class="icon-text-field__icon-box icon-text-field__icon-box--fix" id="requestIcon">
			                <i class="icon-text-field__icon--speech-bubble"></i>
			            </div>
			            <div class="icon-text-field__button-container">
		                    <label id="getDeliveryPreference" for="addressbookPreference" class="icon-text-field__input-area">
				                    <input type="text" class="icon-text-field__input _addressBookCellphoneInput" onclick="openDeliveryRequestPage()" id="addAddress-request" name="da_req_type" placeholder="배송 요청사항" value="${address.da_req_type}">
				            </label>
			            </div>
			        </div>
			    </div>
			    <div id="request-error" style="color: red;"></div>
			    
			    <!-- 배송지 식별 번호 -->
			    <input type="hidden" name="da_no" value="${address.da_no}">
			    <!-- 기본 배송지로 선택 -->
				<div class="custom-control custom-checkbox">
				  <input type="checkbox" class="custom-control-input" id="customCheck1" name="da_main">
			      <label class="custom-control-label" for="customCheck1">기본 배송지로 설정</label>
			    </div>
				<!-- 저장 버튼 -->
			    <div class="addressbook__button-fixer">
			        <button type="submit" class="addressbook__button--save _addressBookFormSubmit btn btn-info btn-lg btn-block" name="deliverAddress" onclick="submitForm()">
			            <span class="addressbook__text">저장</span>
			        </button>
			    </div>
			</form>
		</div>
	</body>
</html>