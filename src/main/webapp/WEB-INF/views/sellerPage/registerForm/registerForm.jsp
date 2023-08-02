<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon">
	
	<title>큐팡! 판매자</title>
	<link rel="stylesheet" href="registerForm.css">
</head>
<body>
	<!-- header -->
	<header>
		<!-- 상단메뉴 -->
		<nav class="upper_menu">
			<div id="upper_left">
				<a href="#"><img id="menu_img" src="img/menu.png" width="20px"></a>
				<a href="#"><img src="img/coupang_logo.svg" width="80px"></a>
			</div>
			<div id="upper_right">
				<a href="#">온라인문의</a>
				<a href="#">도움말</a>
				<a href="#"><img src="img/bell.png" width="20px"></a>
				<a href="#">집에가지말조님</a>
			</div>
		</nav>
	</header>
	
	<!-- 내용시작 -->
	<div class="container">
		<!-- 좌측 메뉴 -->
		<section>
			<ul>
				<li>
					<img src="img/box.png" width="20px">
					<a>상품관리</a>
				</li>
				<li>
					<img src="img/truck.png" width="20px">
					<a>주문/배송</a>
				</li>
				<li>
					<img src="img/won.png" width="20px">
					<a>정산</a>
				</li>
				<li>
					<img src="img/smile.png" width="20px">
					<a>고객관리</a>
				</li>
				<li>
					<img src="img/store.png" width="20px">
					<a>마이샵</a>
				</li>
				<li>
					<img src="img/sales.png" width="20px">
					<a>프로모션</a>
				</li>
				<li>
					<img src="img/pie_chart.png" width="20px">
					<a>광고 관리</a>
				</li>
				<li>
					<img src="img/chart.png" width="20px">
					<a>판매통계</a>
				</li>
				<li>
					<img src="img/man.png" width="20px">
					<a>판매자정보</a>
				</li>
				<li>
					<img src="img/megaphone.png" width="20px">
					<a>공지사항</a>
				</li>
				<li>
					<img src="img/emergency.png" width="20px">
					<a>윤리경영제보</a>
				</li>
				<li>
					<img src="img/delivery.png" width="20px">
					<a>로켓상품공급</a>
				</li>
			</ul>
		</section>
		
		<article>
			<!-- 상품등록 큰 타이틀 -->
			<div id="article_title">
				<div id="article_title_text">
					<b>상품 등록 </b><span id="title_span"> <img id="img_red" src="img/red_circle.png" width="7px"> 필수항목</span><br>
					<img id="img_warning" src="img/warning.png" width="15px">
					<span id="content_span"> Wing은 Chrome 사용을 권장합니다. 이외의 브라우저 또는 Chrome 하위버전으로 접속할 경우 페이지가 깨져 보일 수 있습니다.</span>
				</div>
				<div id="article_title_btn">
					<div class="article_button">
						<a>상품등록 매뉴얼 <img src="img/external.png" width="15px"></a>
					</div>
				</div>
			</div>
			
			<!-- 복사등록 -->
			<div class="title_group" id="article_copy">
				<span class="small_title">복사등록</span>
				<div>
					<img class="img_arrow" src="img/down_arrow.png" width="15px">
				</div>
			</div>
			
			<!-- 노출상품명 -->
			<div class="title_group" id="article_name">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">노출상품명</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="name_big_group">
					<input type="text" class="user_input" value=" 노출상품명 입력(브랜드명 + 제품명)"><span id="name_cnt">0/100</span>
					<div class="blue_point">실제 판매 페이지에 노출되는 상품명입니다. 쿠팡 기준에 맞게 변경될 수 있습니다.</div>
				</div>
				<div class="name_big_group">
					<div>
						<span class="normal_text" id="title_name_text">등록상품명(판매자관리용)</span>
						<img id="img_warning" src="img/warning.png" width="15px">
						<img class="img_arrow2" src="img/down_arrow.png" width="15px">
					</div>
					<input type="text" class="user_input" value=" 등록상품명(판매자관리용) 입력"><span id="name_cnt">0/100</span><br>
					<div class="blue_point" style="padding_bottom: 10px;">발주서에 사용되는 상품명으로, 고객에게 보이지 않습니다. 관리하기 편한 이름으로 설정해주세요.</div>
				</div>	
				<hr>
				<div class="name_big_group">
					<span style="font-size: 12px;">쿠팡에 이미 등록된 상품 기본정보를 불러와 손쉽게 상품을 등록할 수 있습니다.
						<a><input type="button" class="white_blue_text_btn" value="아이템 마켓 검색"></a>
						(구, 카탈로그 매칭)
					</span>
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="title_group" id="article_category">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">카테고리</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="name_big_group">
					<span class="category_menu" style="background-color: #4285f4; color: white; font-size: 12px;">카테고리 검색</span><span class="category_menu" style="font-size: 12px;">카테고리 선택</span>
				</div>
				<div class="name_big_group">
					<div style="border: 1px solid gray; padding: 5px;">
						<img id="img_glass" src="img/reading_glass.png" width="15px">
						<input class="user_input" type="text" value=" 카테고리명 입력" style="border: none;">
					</div>
				</div>
				<div class="name_big_group">
					<span style="color: #4285f4; font-weight: bold; font-size: 12px;">선택한 카테고리 : 문구/오피스>카드/엽서/봉투>엽서</span>
					<input type="button" class="white_btn" value="재선택">
					<span style="font-size: 12px;">판매수수료 : 10.8 % (VAT 별도, 정률)</span>
				</div>
				<hr>
				<span class="blue_point">상품과 맞지 않는 카테고리에 등록할 경우, 적정 카테고리로 이동될 수 있으며, 최종 카테고리에 맞는 판매 수수료가 부과됩니다.</span>
			</div>
			
			<!-- 옵션 -->
			<div class="title_group" id="article_option">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">옵션</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div style="margin-bottom: 10px">
					<span class="category_menu" style="background-color: #4285f4; color: white; font-size: 12px;">옵션 상품등록</span><span class="category_menu" style="font-size: 12px;">단일 상품등록</span>
					<span class="blue_point">구매옵션은 고객이 주문할 때 선택하는 옵션입니다.</span>
				</div>
				
				<div id="option_list" > <!-- 배경색이 다른 큰 틀 -->
					<div class="name_big_group option_grouping" > 
						<span class="normal_text">옵션명 개수</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
						<select name="option_qty">
							<option value="1">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
						</select>
					</div>
					
					<hr>
					
					<div class="name_big_group option_grouping" id="option_group"> 
						<div class="name_group">
							<span class="normal_text">옵션 입력</span>
							<img id="img_red" src="img/red_circle.png" width="6px">
							<img id="img_warning" src="img/warning.png" width="15px">
						</div>
						<div class="name_group" id="option_name_group">
							<span class="normal_text">옵션명</span>
							<select name="option_name" style="width: 200px;">
								<option value="수량">수량</option>
								<option value="색깔">색깔</option>
								<option value="사이즈">사이즈</option>
							</select>
							<input type="button" class="blue_white_text_btn" value="옵션목록으로 적용">
						</div>
						<div class="name_group" id="option_value_group">
							<div class="option_group_title">
								<span class="normal_text">옵션값</span>
							</div>
							<div class="option_group_content">
								<div class="option_group_left">
									<input type="text" class="user_input" value=" 1개, 2팩, 3박스, 4칸 등">
									<div class="drop_content">
										<span style="font-weight: bold;">옵션값 입력 팁</span><br>
										<span>쉼표(,)를 추출하여 한번에 여러값을 입력할 수 있습니다.</span><br>
										<span>예를들면 색상 입력인 경우 빨강, 노랑, 파랑, 흰색...으로 입력됩니다.</span>
									</div>
								</div>
								<div class="option_group_right">
									<a href="#" id="find_qty"><img id="img_plus" src="img/plus.png" width="15px" style="margin-bottom: 0;"></a>
									<span class="normal_text">수량 입력 알아보기</span>
									<img id="img_warning" src="img/warning.png" width="15px">
								</div>
							</div>
						</div>
					</div>
					
					<hr>
					
					<div class="name_big_group option_grouping2">
						<div class="option_list_group">
							<div>
								<span class="normal_text">옵션 목록(총 0개)</span>
								<img id="img_red" src="img/red_circle.png" width="7px">
							</div>
							<input type="button" class="white_btn" value="삭제" style="width: 50%">
						</div>
						<div class="name_group">
							<img id="img_glass" src="img/reading_glass.png" width="15px">
							<span class="normal_text">옵션입력 켜기</span>
						</div>
					</div>
					
					<table class="table_design">
						<thead>
							<tr>
								<th>
									<input type="checkbox" checked="checked">
								</th>
								<th>옵션명</th>
								<th>
									정상가
									<img id="img_warning" src="img/warning.png" width="15px">
									<br>
									<input type="button" class="white_btn" value="일괄적용">
								</th>
								<th>
									판매가
									<img id="img_red" src="img/red_circle.png" width="5px">
									<img id="img_warning" src="img/warning.png" width="15px">
									<br>
									<input type="button" class="white_btn" value="일괄적용">
								</th>
								<th>
									재고수량
									<img id="img_red" src="img/red_circle.png" width="5px">
									<img id="img_warning" src="img/warning.png" width="15px">
									<br>
									<input type="button" class="white_btn" value="일괄적용">
								</th>
								<th>
									판매자상품코드
									<img id="img_warning" src="img/warning.png" width="15px">
									<br>
									<input type="button" class="white_btn" value="일괄적용">
								</th>
								<th>
									모델번호
									<img id="img_warning" src="img/warning.png" width="15px">
									<br>
									<input type="button" class="white_btn" value="일괄적용">
								</th>
								<th>
									상품 바코드
									<img id="img_warning" src="img/warning.png" width="15px">
									<br>
									<input type="button" class="white_btn" value="일괄적용">
								</th>
								<th>
									삭제
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="9">데이터가 존재하지 않습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 이미지 등록 -->
			<div class="title_group" id="article_img_register"> 
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">이미지 등록</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				<!-- 내용 -->
				<div class="name_big_group">
					<span class="category_menu" style="background-color: #4285f4; color: white; font-size: 12px;">기본 등록</span><span class="category_menu" style="font-size: 12px;">옵션별 등록</span>
					<span class="blue_point">이미지가 옵션별로 다른 경우에는 '옵션별 등록'을 선택해주세요.</span>
				</div>
				<div class="name_big_group" id="img_register">
					<div class="img_register_big_array thum">
						<div class="img_register_text">
							<span>대표이미지</span>
							<img id="img_red" src="img/red_circle.png" width="6px">
							<img id="img_warning" src="img/warning.png" width="15px">
						</div>
						<div class="img_register_array">
							<div class="img_slim_plus"><img src="img/slim_plus.png" width="20px"></div>
							<span class="blue_point">크기 : 최소 100px 이상(권장크기 : 100x100)</span>
							<span class="blue_point">용량 : 10MB 이하 파일 형식 JPG, PNG</span>
							<div>
								<input type="button" class="white_btn" value="이미지 URL주소로 등록" width="80%" style="margin-top: 10px;">
							</div>
						</div>
					</div>
					<div class="img_register_big_array">
						<div class="img_register_text">
							<span>추가이미지 (0/9)</span>
							<img id="img_warning" src="img/warning.png" width="15px">
						</div>
						<div class="img_register_array">
							<div class="img_slim_plus"><img src="img/slim_plus.png" width="20px"></div>
							<span style="font-size: 12px; margin-top: 10px;">※ 노출 순서를 바꾸시려면 이미지를 원하는 곳에 끌어다놓으세요.(드래그&드롭)</span>
							<span class="blue_point">크기 : 최소 100px 이상(권장크기 : 100x100)</span>
							<span class="blue_point">용량 : 10MB 이하 파일 형식 JPG, PNG</span>
							<div>
								<input type="button" class="white_btn" value="이미지 URL주소로 등록" width="50%" style="margin-top: 10px;">
								<input type="button" class="gray_btn" value="전체 삭제" width="50%">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 상세설명 -->
			<div class="title_group" id="article_info">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">상세설명</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				<!-- 내용 -->
				<div class="name_big_group">
					<span class="category_menu" style="background-color: #4285f4; color: white; font-size: 12px;">기본 등록</span><span class="category_menu" style="font-size: 12px;">옵션별 등록</span>
				</div>
				<hr>
				<div class="name_big_group">
					<div style="margin-bottom: 2px;">
						<span class="category_menu" style="background-color: #4285f4; color: white; font-size: 12px;">이미지 업로드</span><span class="category_menu" style="font-size: 12px;">에디터 작성</span><span class="category_menu" style="font-size: 12px;">HTML 작성</span>
					</div>
					<div id="img_register_group">
						<img id="img_warning" src="img/warning.png" width="30px">
						<span>등록된 이미지가 없습니다</span>
						<input type="button" class="blue_white_text_btn" value="이미지 등록">
					</div>
				</div>
				<div class="name_big_group">
					<span class="blue_point" style="display: block;">이미지 권장 크기 가로(최소 100px 최대 1,000px)/세로 10,000px 이하의 png, jpg 파일</span>
					<span class="blue_point">HTML 파일을 선택 시 HTML을 사용하여 이미지를 바로 입력할 수 있습니다.</span>
				</div>
			</div>
			
			<!-- 상품 주요정보 -->
			<div class="title_group" id="article_product_option">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">상품 주요정보</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">브랜드</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="text" class="user_input" value=" 브랜드를 입력해주세요.">
						<input type="checkbox" id="brand_chkbox"><label for="brand_chkbox" class="normal_text">브랜드없음(또는 자체제작)</label>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">제조사</span>
					</div>
					<input type="text" class="user_input" value=" 제조사를 입력해주세요. 제조사를 알 수 없는 경우 브랜드명을 입력해주세요.">
				</div>
				<hr>
				<div class="name_big_group product_group2">
					<div class="product_info_group">
						<span class="normal_text">인증정보</span>
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="radio" class="auth_radio"><label for="auth_radio" class="normal_text">인증신고 대상</label>
						<input type="radio" class="auth_radio"><label for="auth_radio" class="normal_text">상세페이지 별도표기</label>
						<input type="radio" class="auth_radio" checked="checked"><label for="auth_radio" class="normal_text">인증신고 대상 아님</label>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">병행수입</span>
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="radio" class="import_radio"><label for="import_radio" class="normal_text">병행수입</label>
						<input type="radio" class="import_radio" checked="checked"><label for="import_radio" class="normal_text">병행수입 아님</label>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">미성년자 구매</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="radio" class="adult_radio" checked="checked"><label for="adult_radio" class="normal_text">가능</label>
						<input type="radio" class="adult_radio"><label for="adult_radio" class="normal_text">불가능</label>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">인당 최대구매수량</span>
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="radio" class="qty_radio"><label for="qty_radio" class="normal_text">설정함</label>
						<input type="radio" class="qty_radio" checked="checked"><label for="qty_radio" class="normal_text">설정안함</label>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">판매기간</span>
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="radio" class="period_radio"><label for="period_radio" class="normal_text">설정함</label>
						<input type="radio" class="period_radio" checked="checked"><label for="period_radio" class="normal_text">설정안함</label>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="product_info_group">
						<span class="normal_text">부가세</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="product_info_select">
						<input type="radio" class="flex_radio" checked="checked"><label for="flex_radio" class="normal_text">과세</label>
						<input type="radio" class="flex_radio"><label for="flex_radio" class="normal_text">면세</label>
					</div>
				</div>
			</div>
			
			<!-- 검색어 -->
			<div class="title_group" id="article_search_keyword">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">검색어</span>
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="name_big_group">
					<span class="normal_text" style="margin-right: 10px;">태그</span>
					<input type="text" class="user_input" value=" 쉼표(,)로 구분하여 최대 20개까지 입력 가능">
					<input type="button" class="white_blue_text_btn" style="height: 30px;" value="추가">
				</div>
				<div class="name_big_group">
					<span class="blue_point">검색어는 고객이 내 상품을 빠르게 찾을 수 있게 합니다.<a class="skyblue_text_btn">쿠팡에서 검색랭킹 올리는 방법 <img src="img/external.png" width="15px"></a></span>
					<br><span class="blue_point">타 브랜드명이나 상풍과 관계없는 검색어는 추후 쿠팡에 의해 삭제나 변경될 수 있습니다.</span>
				</div>
			</div>
			
			<!-- 검색필터 -->
			<div class="title_group" id="article_search_filter">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">검색필터</span>
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="name_big_group">
					<div class="search_filter_content">
						<span class="blue_point" style="font-weight: bold;">[ 아기고양이엽서 ]</span>
						<span class="blue_point">검색옵션을 검색어로 자동 설정하며, 고객이 상품을 찾아보는 검색필터로 활용됩니다.</span>
						<a class="skyblue_text_btn">쿠팡에서 검색랭킹 올리는 방법 <img src="img/external.png" width="15px"></a>
						<span class="normal_text">필요한 속성만 선택해서 입력할 수 있습니다.</span>
						<div>
							<input type="checkbox" id="filter_total" checked="checked"><label for="filter_total" class="normal_text" class="normal_text"> 전체</label>
						</div>
					</div>
				</div>
				<div class="name_big_group">
					<table class="table_design" style="border: 1px solid gray; margin: 0;">
						<thead>
							<tr>
								<th>옵션 명(총 1개)</th>
								<th>옵션 명(총 0개)</th>
								<th>옵션 명(총 0개)</th>
								<th>옵션 명(총 0개)</th>
								<th>옵션 명(총 0개)</th>
								<th>옵션 명(총 0개)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>단일상품</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 상품정보제공고시 -->
			<div class="title_group" id="article_provision">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">상품정보제공고시</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="name_big_group">
					<span class="blue_point">각 카테고리에 해당하는 성품 고시정보를 선택하여 입력해주세요.</span>
					<input type="text" class="user_input" style="margin-top: 10px;" value=" 기타 재화">
					<input type="checkbox" id="product_info"><label for="product_info" class="normal_text"> 전체 상품 상세페이지 참조</label>
				</div>
				<div class="name_big_group">
					<table class="table_design tableinfo" style="border: 1px solid gray; margin: 0;">
						<thead>
							<tr>
								<th>고시정보명</th>
								<th>내용</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>품명 및 모델명</td>
								<td class="table_content">
									<input type="text" class="user_input" style="margin-right: 5px;">
									<input type="checkbox" id="product_reference"><label for="product_reference"> 상품 상세페이지 참조</label>
								</td>
							</tr>
							<tr>
								<td>인증/허가 사항</td>
								<td class="table_content">
									<input type="text" class="user_input" style="margin-right: 5px;">
									<input type="checkbox" id="product_reference"><label for="product_reference"> 상품 상세페이지 참조</label>
								</td>
							</tr>
							<tr>
								<td>제조국(원산지)</td>
								<td class="table_content">
									<input type="text" class="user_input" style="margin-right: 5px;">
									<input type="checkbox" id="product_reference"><label for="product_reference"> 상품 상세페이지 참조</label>
								</td>
							</tr>
							<tr>
								<td>제조자(수입자)</td>
								<td class="table_content">
									<input type="text" class="user_input" style="margin-right: 5px;">
									<input type="checkbox" id="product_reference"><label for="product_reference"> 상품 상세페이지 참조</label>
								</td>
							</tr>
							<tr>
								<td>소비자상담 관련 전화번호</td>
								<td class="table_content">
									<input type="text" class="user_input" style="margin-right: 5px;">
									<input type="checkbox" id="product_reference"><label for="product_reference"> 상품 상세페이지 참조</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 배송 -->
			<div class="title_group" id="article_deliver">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">배송</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">출고지</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
					</div>
					<div>
						<input type="text" class="user_input">
						<input type="button" class="white_blue_text_btn" value="판매자 주소록">
					</div>
					<div> </div>
				</div>
				<hr>
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">제주/도서산간 배송여부</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
					</div>
					<div class="delivery_info_select">
						<input type="radio" class="jeju_radio"><label for="jeju_radio" class="normal_text">가능</label>
						<input type="radio" class="jeju_radio" checked="checked"><label for="jeju_radio" class="normal_text">불가능</label>
					</div>
					<div>
						<span class="blue_point">기능을 선택하려면 택배사와 도서산간 추가배송비를 설정해주세요.</span>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">택배사</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
					</div>
					<div class="delivery_info_select">
						<input type="text" class="user_input" value=" 아기고양이택배">
					</div>
					<div>
						<span class="blue_point">아직 택배사를 계약하지 않으셨다면 우체국 또는 편의점(CVS택배을 추천합니다.)</span>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">배송방법</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
					</div>
					<div>
						<input type="text" class="user_input" value=" 일반배송">
					</div>
					<div> </div>
				</div>
				<hr>
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">묶음배송</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
					</div>
					<div class="delivery_info_select">
						<input type="radio" class="pack_radio"><label for="pack_radio" class="normal_text">가능</label>
						<input type="radio" class="pack_radio" checked="checked"><label for="pack_radio" class="normal_text">불가능</label>
					</div>
					<div>
						<span class="blue_point">출고 정보가 같은 상품만 묶음배송할 수 있습니다.(착불배송 선택 불가)</span>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">배송비 종류</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
					</div>
					<div class="delivery_info_select">
						<input type="text" class="user_input" value=" 무료배송">
					</div>
					<div>
						<span class="blue_point">무료배송/9800원 이상, 1000원 이상, 19800원 이상, 30000원 이상, 50000원 이상 무료배송/</span><br>
						<span class="blue_point">유료배송/조건부무료배송만 선택할 수 있습니다.(일부 카테고리 및 해외구매대행상품 제외)</span>
					</div>
				</div>
				<hr>
				<div class="input_group">
					<div class="delivery_info_group">
						<span class="normal_text">출고 소요일</span>
						<img id="img_red" src="img/red_circle.png" width="6px">
						<img id="img_warning" src="img/warning.png" width="15px">
					</div>
					<div class="delivery_info_select">
						<div>
							<input type="radio" class="out_radio" checked="checked"><label for="out_radio" class="normal_text">기본 입력</label>
							<input type="text" style="width: 30px; height: 15px;"><span class="normal_text">일</span>
						</div>
						<input type="radio" class="out_radio"><label for="out_radio" class="normal_text">구매 옵션별로 입력</label>
					</div>
					<div>
						<span class="blue_point">주문일 당일 또는 다음날까지 발송 가능한 경우, 1일로 설정해주세요.</span>
					</div>
				</div>
			</div>
			
			<!-- 반품/교환 -->
			<div class="title_group" id="article_return_exchange">
				<!-- 타이틀 -->
				<div class="title_text">
					<div>
						<span class="small_title">반품/교환</span>
						<img id="img_red" src="img/red_circle.png" width="7px">
						<a class="help_text">도움말</a>
					</div>
					<div>
						<img class="img_arrow" src="img/up_arrow.png" width="15px">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="name_big_group">
					<div class="input_group">
						<div class="return_info_group">
							<span class="normal_text">반품/교환지</span>
							<img id="img_red" src="img/red_circle.png" width="7px">
						</div>
						<div class="return_info_select">
							<input type="text">
							<input type="button" class="white_blue_text_btn" value="판매자 주소록">
						</div>
					</div>
				</div>
				<div class="name_big_group">
					<div class="input_group">
						<div class="return_info_group">
							<span class="normal_text">초도배송비(편도)</span>
							<img id="img_red" src="img/red_circle.png" width="7px">
						</div>
						<div class="return_info_select">
							<input type="text" style="width: 30px; height: 15px;"><span class="normal_text">원</span>
							<span class="blue_point">과도한 반품배송비는 청약철회 사유가 될 수 있습니다.</span>
						</div>
					</div>
				</div>
				<div class="name_big_group">
					<div class="input_group">
						<div class="return_info_group">
							<span class="normal_text">반품배송비(편도)</span>
							<img id="img_red" src="img/red_circle.png" width="7px">
						</div>
						<div class="return_info_select">
							<input type="text" style="width: 30px; height: 15px;"><span class="normal_text">원</span>
							<div class="normal_text" style="margin-top: 10px;">고객사유로 인한 반품 시, 왕복 반품/배송비는 <span style="color: red; margin-right: 0;">3,000원 초도배송비+반품배송비의 합계</span>가 청구됩니다.</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 구비서류 -->
			<div class="title_group" id="article_document">
				<div>
					<span class="small_title">구비서류</span>
					<a class="help_text">도움말</a>
				</div>
				<div>
					<img class="img_arrow" src="img/down_arrow.png" width="15px">
				</div>
			</div>
				
			<!-- 하단 메뉴 -->
			<section id="lower_menu">
				<div>
					<input type="button" class="white_btn" value="취소">
					<input type="button" class="white_btn" value="미리보기">
					<input type="button" class="white_btn" value="중간저장">
				</div>
				<div>
					<input type="button" class="white_btn" value="저장하기">
					<input type="button" class="blue_white_text_btn" value="판매요청">
				</div>
			</section>
		</article>
	</div>
</body>
</html>