<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
	<title>Insert title here</title>
	
	<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap_lumen.css">
	<script>
		$(document).ready(function() {
			//취소 버튼 클릭시 창 닫히기
		 	$("#cancel-btn").click(function() {
		        window.close();
		    });
			
		 	//확인 버튼 클릭 이벤트
		    $("#confirm-btn").click(function(event) {
		        event.preventDefault(); // 바로 submit되지 않도록 방지
		        var pg_no = $(".prod-option").data("pg_no");
		        var selectedOption = $(".prod-multi-option__layer__container").val();
		        var prdNo = $(".prod-multi-option__layer__container option:selected").data("prd_no");
		        var content = $("#productInquiryContent").val();
		
		        var data = {
		            prdNo: prdNo,
		            content: content
		        };
		
		        $.ajax({
		            type: "POST",
		            url: 'writeQna', 
		            data: data,
		            success: function(data) {
		            	window.opener.location.href = "detailView?pg_no="+ pg_no;
		            	window.close();
		            },
		            error: function(xhr, status, error) {
		                console.error("문의 작성 실패: " + error);
		            }
		        });
		    });
		});
		
	</script>
	
	<style>
		.qna-write-page {
			display: flex;
		    flex-direction: column;
		    align-items: center;
		}
		
		.qna-write-title {
		    text-align: center;
		    margin: 20px;
		}
		.qna-write-info th {
			padding-right: 50px;
		}
		
		.pop-footer {
			text-align: center;	
			margin-top: 20px;
		}
		
		.pop-footer button {
			width: 108px;
		    height: 35px;
		    margin-left: 10px;
		    margin-right: 10px;
		}
	</style>
	</head>
	<body>
		<div class="qna-write-page">
			<form action="/vp/products/productId/sale-infos/vendorItemId/vendor">
				<h2 class="qna-write-title">상품 문의</h2>
				<input type="hidden" name="vendorItemId">
				<div class="pop-contents">
					<table class="qna-write-info">
						<tbody>
							<tr>
								<th>상품정보</th>
								<td>
									<div class="prod-inquiry-option">
										<div class="prod-multi-option__layer prod-inquiry-extra-style">
											<select class="prod-multi-option__layer__container custom-select">
												<c:forEach var="option" items="${options}">
												<option class="prod-option" value="${option.prd_name}" data-prd_no="${option.prd_no}"  data-pg_no="${option.pg_no}">${option.prd_name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td>
									<textarea id="productInquiryContent" name="content" cols="65" rows="6"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="pop-footer">
					<button class="btn btn-info" id="confirm-btn" type="submit">
						<span>확인</span>
					</button>
					<button class="btn btn-outline-info" id="cancel-btn" type="button">
						<span>취소</span>
					</button>
				</div>
			</form>
		</div>
	</body>
</html>