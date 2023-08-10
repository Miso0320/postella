$(init);

function init() {
	// 날짜별 분류(선택)
	$(".order_date_range").click(orderDateClick);
	
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
	    
	    var deleteLink = $('#deleteCk').find('.modal-footer .btn-primary');
	    deleteLink.attr('href', 'deleteOrder?od_detail_no=' + odDetailNo);
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

//날짜별 분류
function orderDateClick() {
	var target = event.target;
	$(".order_date_range").each(function(index, el) {
		var classYn = $(el).is(".order_date_range_select");
		
		if(classYn) {
			$(el).removeClass("order_date_range_select");
		}
		
		if(target === el) {
			$(el).addClass("order_date_range_select");
		}
	});
}

// 장바구니에 넣기
function addCart() {
   /* $.ajax({
    	url: "addCart",
    	method: "post",
    	contentType: 'application/json',
    	data: JSON.stringify(cartList), 
        success: function (data) {
            console.log(data);
        }
    });*/
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
	$(target).parent().next().addClass("over_el");
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
	$(target).parent().next().removeClass("over_el");
	$(target).parent().next().css("display", "none");
}












