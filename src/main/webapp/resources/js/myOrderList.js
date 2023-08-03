$(init);

function init() {
	// 사이드바 보이기, 숨기기
	$(window).scroll(function() {
		if($(this).scrollTop() > 250) {
			$('.side_bar_grp').fadeIn();
		} else {
			$('.side_bar_grp').fadeOut();
		}
	});
	
	// 상품별 메뉴
	$(".product_classification_menu").click(function() {
		var target = event.target.id;
		var product_classification_total = $("#product_classification_total");
		var product_classification_delivery = $("#product_classification_delivery");
		var product_classification_travel = $("#product_classification_travel");
		var product_classification_ticket = $("#product_classification_ticket");
		
		if(target === "product_classification_total") {
			product_classification_total.addClass("product_classification_menu_select");
			product_classification_delivery.removeClass("product_classification_menu_select");
			product_classification_travel.removeClass("product_classification_menu_select");
			product_classification_ticket.removeClass("product_classification_menu_select");
		} else if(target === "product_classification_delivery") {
			product_classification_total.removeClass("product_classification_menu_select");
			product_classification_delivery.addClass("product_classification_menu_select");
			product_classification_travel.removeClass("product_classification_menu_select");
			product_classification_ticket.removeClass("product_classification_menu_select");
		} else if(target === "product_classification_travel") {
			product_classification_total.removeClass("product_classification_menu_select");
			product_classification_delivery.removeClass("product_classification_menu_select");
			product_classification_travel.addClass("product_classification_menu_select");
			product_classification_ticket.removeClass("product_classification_menu_select");
		} else if(target === "product_classification_ticket") {
			product_classification_total.removeClass("product_classification_menu_select");
			product_classification_delivery.removeClass("product_classification_menu_select");
			product_classification_travel.removeClass("product_classification_menu_select");
			product_classification_ticket.addClass("product_classification_menu_select");
		}
	});
	
	// 최근 본 상품 정보 열기
	$(".p_img").mouseover(recentItemView);
	$(".p_img").mouseout(recentItemHide);
	
	$(".order_date_range").click(orderDateClick);
	
	
}





// 최근 본 상품 제품 정보 열기
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

// 최근 본 상품 제품 정보 닫기
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










