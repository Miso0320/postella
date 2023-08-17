$(init);

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
	// 장바구니 담기 변수 선언
	/*var container = $(".content_item_img");
	var us_no = container.data('us-no');
	var prd_no = container.data('prd-no');
	var crt_qty = 1;
	addCart(us_no, prd_no, crt_qty);*/
	
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
	
	// 장바구니 상품 정보 열기
	$(".p_img").mouseover(recentItemView);
	$(".p_img").mouseout(recentItemHide);
	
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

// 장바구니에 담기
function addCart(us_no, prd_no, crt_qty) {
	console.log(us_no + " - " + prd_no + " - " + crt_qty);
	
	var cartData = {
        us_no: us_no,
        prd_no: prd_no,
        crt_qty: crt_qty
    };
	
    $.ajax({
    	url: "addCart",
    	method: "post",
    	contentType: 'application/json',
    	data: JSON.stringify(cartData), 
        success: function (data) {
            console.log(data);
        }
    });
    
}

// 장바구니 상품 정보 열기
function recentItemView() {
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
function recentItemHide() {
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

