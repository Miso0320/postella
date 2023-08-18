$(init);

// 사이드바 장바구니 현재 페이지
cartPageNo = 1;

$(document).ready(function() {
	var container = $(".classification_date");
	requestYear = container.data('request-year');
	
	if(requestYear === 'recent6Month') {
		$("#recent_six_month").addClass("order_date_range_select");
	} else if(requestYear === '2023year') {
		$("#2023year").addClass("order_date_range_select");
	} else if(requestYear === '2022year') {
		$("#2022year").addClass("order_date_range_select");
	} else if(requestYear === '2021year') {
		$("#2021year").addClass("order_date_range_select");
	} else if(requestYear === '2020year') {
		$("#2020year").addClass("order_date_range_select");
	} 
});

function init() {
	// 사이드바 보이기, 숨기기
	$(window).scroll(function() {
		if($(this).scrollTop() > 250) {
			$('.side_bar_grp').fadeIn();
		} else {
			$('.side_bar_grp').fadeOut();
		}
	});
	
	// 모달창에서 삭제 링크 전달
	$('#deleteCk').on('show.bs.modal', function (event) {
	    var button = $(event.relatedTarget);
	    var odDetailNo = button.data('od-detail-no');
	    var odUsNo = button.data('od-us-no');
	    var odNo = button.data('od-no');
	    var odItemCnt = button.data('od-item-cnt');
	    
	    var deleteLink = $('#deleteCk').find('.modal-footer .btn-primary');
	    deleteLink.attr('href', 'deleteOrder?od_detail_no=' + odDetailNo + '&us_no=' + odUsNo + '&od_no=' + odNo + '&od_item_cnt=' + odItemCnt);
	});
	
	// 툴팁 활성화하기(수동으로 툴팁 제어)
	$('.tooltip-btn').tooltip({
		trigger: 'manual'
	});

	// 버튼 클릭 시 툴팁 표시
	$('.tooltip-btn').click(function() {
		var $tooltip = $(this);
		$tooltip.tooltip('show');
		
		// 1초가 지나면 툴팁 숨기기
		setTimeout(function() {
			$tooltip.tooltip('hide');
		}, 1000);
	});
	
	// 사이드바 장바구니 목록 보여주기
	showCartInOrderList(cartPageNo);
	
}

// 드롭다운 메뉴 나타내기
function dp_menu() {
	var target = event.target;
	var dropdown = $(target).siblings();
	
	if(dropdown.css("display","none")) {
		dropdown.css("display","block");
	} else {
		dropdown.css("display","none");
	}
}

// 드롭다운 메뉴 숨기기
function dp_menu_hide() {
	var target = event.target;
	var dropdown = $(target).siblings();
	
	if(dropdown.css("display","block")) {
		dropdown.css("display","none");
	} else {
		dropdown.css("display","block");
	}
}

// 장바구니 목록 html 삽입
function showCartList(carts, cartPageNo, totalCartPage, totalCartCnt) {
	// html로 삽입될 내용
	var content = '';
	content += '<div class="my_view_cart">';
	content += '	<a href="cartNormal">';
	content += '		<em class="cart_count">' + totalCartCnt +'</em>';
	content += '	</a>';
	content += '</div>';
	content += '<div class="recent_viewed_list">';
	content += '	<ul class="recent_viewed_page">';
	
	// 장바구니 목록
	for(var i = 0; i < carts.length; i++) {
		var item = carts[i];
		content += '	<li>';
		content += '		<a class="recent_viewed_item" href="setDetailPage?prdNo=' + item.prd_no + '">';
		content += '			<img class="p_img" src="data:' + item.img_type + ';base64, ' + item.encodedFile + '">';
		content += '			<span class="p_name">' + item.prd_name + '</span>';
		content += '			<span class="p_price">';
		content += '				<em class="sale_price">' + item.prd_price + '</em>원';
		content += '			</span>';
		content += '			<input type="hidden" class="p_prd_no" value="' + item.prd_no + '">';
		content += '		</a>';
		content += '		<a class="delete_recent" data-prd-no="' + item.prd_no + '"></a>';
		content += '	</li>';
	}
	
	content += '</ul>';
	
	// 장바구니 버튼 생성
	if(totalCartPage > 0) {
		content += '	<p class="recent_viewed_paging">';
		content += '		<span>';
		content += '			<strong>' + cartPageNo + '</strong>/<em>' + totalCartPage + '</em>';
		content += '		</span>';
		content += '		<span class="paging_btn_grp">';
		content += '			<a class="paging_btn prev_btn"></a>';
		content += '			<a class="paging_btn next_btn"></a>';
		content += '		</span>';
		content += '	</p>';
		content += '</div>';
	}
	
	// html 내용 추가
	$(".my_view").html(content);
	
	// 이전 메뉴 버튼 클릭
	$(".prev_btn").click(function() {
		if(1 < cartPageNo) {
			cartPageNo -= 1;
			showCartInOrderList(cartPageNo);
		}
	}); 
	
	// 다음 메뉴 버튼 클릭
	$(".next_btn").click(function() {
		if(totalCartPage > cartPageNo) {
			cartPageNo += 1;
			showCartInOrderList(cartPageNo);
		}
	}); 
	
	// 삭제 버튼 클릭
	$(".delete_recent").click(function() {
		var prdNo = this.getAttribute('data-prd-no');
		deleteCartInOrderList(prdNo);
	}); 
	
	// 장바구니 상품 정보 열기
	$(".p_img").mouseover(cartItemView);
	$(".p_img").mouseout(cartItemHide);
}


//장바구니 목록 가져오기
function showCartInOrderList(cartPageNo) {
    $.ajax({
    	url: "showCartInOrderList",
    	method: "get",
    	data: { cartPageNo: cartPageNo },
        success: function (data) {
        	// 응답으로 전달된 장바구니 목록 데이터
        	var carts = data.carts;
        	// 전체 페이지 수
        	var totalCartPage = data.totalCartPage;
        	// 전체 상품 수
        	var totalCartCnt = data.totalCartCnt;
        	
        	// 장바구니 목록 html 삽입
        	showCartList(carts, cartPageNo, totalCartPage, totalCartCnt);
        }
    });
}

// 장바구니 항목 삭제하기
function deleteCartInOrderList(prdNo) {
	var cartPageNo = 1;
	$.ajax({
		url: "deleteCartInOrderList",
		method: "get",
		data: { prd_no: prdNo, cartPageNo: cartPageNo },
		success: function (data) {
			// 응답으로 전달된 장바구니 목록 데이터
			var carts = data.carts;
			// 전체 페이지 수
			var totalCartPage = data.totalCartPage;
			// 전체 상품 수
			var totalCartCnt = data.totalCartCnt;
			
			// 장바구니 목록 html 삽입
			showCartList(carts, 1, totalCartPage, totalCartCnt);
		}
	});
}

// 장바구니에 담기
function addCart(prd_no) {
    $.ajax({
    	url: "addCartInOrderList",
    	method: "post",
    	data: { prd_no: prd_no },
        success: function (data) {
        	/*페이징 먼저 하고 오기!!*/
        	
        	
        	
        }
    });
}

// 장바구니 상품 정보 열기
function cartItemView() {
	var target = event.target;

	// recent_viewed_item class
	$(target).parent().addClass("over");
	// p_img
	$(target).addClass("over_img");
	// p_name
	$(target).next().addClass("over_el");
	$(target).next().css("display", "block");
	// p_name
	$(target).next().next().css("display", "block");
	// delete_recent
	$(target).parent().next().addClass("over_el fixed_delete_recent");
	$(target).parent().next().css("display", "block");
}


// 장바구니 상품 정보 닫기
function cartItemHide() {
	var target = event.target;
		
	// recent_viewed_item class
	$(target).parent().removeClass("over");
	// p_img
	$(target).removeClass("over_img");
	// p_name
	$(target).next().removeClass("over_el");
	$(target).next().css("display", "none");
	// p_name
	$(target).next().next().css("display", "none");
	// delete_recent
	$(target).parent().next().removeClass("over_el fixed_delete_recent");
	$(target).parent().next().css("display", "none");
}

