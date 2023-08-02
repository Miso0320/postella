$(init)

function init() { //시작될때
	
	//"checkBoxSelectAll" 클래스를 가진 요소가 클릭되었을 때 checkAll 함수를 호출하여 체크 박스 전체 선택 동작을 수행하도록 설정
	$(".checkBoxSelectAll").click(checkAll);
	$(".checkBoxSelectAll").click(allcheckCount);
	cart();
	
	//테이블이 삭제되었을때 bye실행 -> 테이블length를 계산해서 0이면 
	$(".delete").click(bye);
}


//"checkBoxSelectAll" 클래스를 가진 요소가 클릭되었을 때 checkAll 함수를 호출하여 체크 박스 전체 선택 동작을 수행하도록 설정
function checkAll() {
	   if($(event.target).is(':checked')) {   //전체선택 박스가 checked되면
	      $("input[name=checkBox]").prop("checked", true);  //체크박스 전체선택 둘다 체크
	      $(".checkBoxSelectAll").prop("checked", true);
	   } else {
	      $("input[name=checkBox]").prop("checked", false);  //체크박스 전체선택 둘다 체크풀림
	      $(".checkBoxSelectAll").prop("checked", false);
	   }
	   
	   totalPrice(); //체크박스 값이 변경될때마다 totalPrice함수 호출
	}

function checkCheck() {
	var chks = document.getElementsByName("checkBox");
    var chksChecked = 0;
    
    for(var i=0; i<chks.length; i++) {
       var checkBox = chks[i];
       
       if(checkBox.checked) {
          chksChecked++;
       }
    }

    //체크된 체크박스 갯수가 chks.length길이랑 같으면 전체선택체크  아니면 체크안됨
    if(chks.length == chksChecked){
       $(".checkBoxSelectAll").prop("checked", true);
    }else{
       $(".checkBoxSelectAll").prop("checked",false);
    }     
    
    totalPrice();
}

//체크된 체크박스 갯수 출력
function checkCount() {
	var query = "input[name='checkBox']:checked";
	var selectedElements = document.querySelectorAll(query);
	
	var selectedElementsCount = selectedElements.length;
	
	document.getElementById('result').innerText = selectedElementsCount;
	
	totalPrice();
}

//전체 체크박스의 갯수 출력
function allcheckCount() {
	var query = "input[name='checkBox']:checked";
	var selectedElements = document.querySelectorAll(query);
	
	var selectedElementsCount = selectedElements.length;
	
	document.getElementById('result').innerText = selectedElementsCount;
}


function tableCount(rowCnt){

	document.getElementById('result').innerText =rowCnt;
	result2.innerText = rowCnt;

}

//체크된 상품 삭제
function deleteChecked() {
	
	if(($("input[name=checkBox]:checked")).length === 0) {
		alert("삭제할 상품을 선택해주세요.");
	} else {
		if (confirm("선택한 상품을 삭제하시겠습니까?") == true){ 
			   //true는 확인버튼을 눌렀을 때 코드 작성
			   console.log("완료되었습니다.");
			 }else{
			   // false는 취소버튼을 눌렀을 때, 취소됨
			   return;
			 }
	}
	
	$("input[name=checkBox]:checked").each(function(c,cVal){
		let a = cVal.parentElement.parentElement;
		$(a).remove();
		$(".checkBoxSelectAll").prop("checked",false);
	});

// 남은 상품들 가격 다시 계산
	sum();
}

//테이블 삭제
function delete_table() {
	
	var tbody = document.querySelector('#myTable tbody');
	var deleteElement = (event.target).parentElement.parentElement;
	tbody.removeChild(deleteElement);
	
	//테이블 삭제되면 다시 상품가격계산
	sum();
	bye();

}


function cart() {
	
	
	var now = new Date();

	let dayText = "";
	let year = now.getFullYear();
		let month = now.getMonth() + 1;
		let date = now.getDate() + 1;
		let day = now.getDay() + 1; //요일 일요일(0)~토요일(6)
			if(day == 0) {
				dayText = "일";
			} else if(day == 1) {
				dayText = "월";
			} else if(day == 2) {
				dayText = "화";
			} else if(day == 3) {
				dayText = "수";
			} else if(day == 4) {
				dayText = "목";
			} else if(day == 5) {
				dayText = "금";
			} else if(day == 6) {
				dayText = "토";
			}
		
		let deliveryDate = ("내일(" + dayText + ")" +month + "/" + date + "도착 보장");	
		
	$.ajax({
		url: "cartContent.jsp",
		method: "get",
		success: function(data) {
			
			if(data.length == 0) {
				$('#tbody').removeClass("d-none");
			} else {
			
			tableCount(data.length);
			let html = "";
			  data.forEach((item,index) => {
				  
				  
				  
				  
				  html += '<tr class="cart-product-contents">';
				  html += '  <td>';
				  html += '  	<input type="checkbox" name="checkBox" class="checkBox" checked>';
				  html += '  </td>';
				  html += '  <td class="cart-item-img">';
				  html += '  	<a href="#">';
				  html += '  		<img src="img/cart/' + item.img + '" width="78" height="78">';
				  html += '  	</a>';
				  html += '  </td>';
				  html += '  <td>';
				  html += '  	<div class="cart-product-name">';
				  html += '  		<a href="">' + item.title + '</a>';
				  html += '  	</div>';
				  html += '  	<hr/>';
				  html += '  	<div class="cart-product-option">';
				  html += '  		<div class="cart-product-option-info">' + deliveryDate;	
				  html += '  		<span class="cart-product-option-info1-2">(밤 12시 전 주문 시)</span>';
				  html += '  		</div>';
				  html += '  		<div class="cart-product-option-price">';
				  html += '  			<span id="prodPrice">' + item.price + '</span>';
				  html += '  			<span>원</span>';
				  html += '					<select id="selectBtn" class="prod-quantity-form" onchange="javascript:sumItemPrice(); checkInput(this.value);" style="width:52px; height:24px;">';
				  html += '						<option value="1">1</option>';
				  html += '						<option value="2">2</option>';
				  html += '						<option value="3">3</option>';
				  html += '						<option value="4">4</option>';
				  html += '						<option value="5">5</option>';
				  html += '						<option value="6">6</option>';
				  html += '						<option value="7">7</option>';
				  html += '						<option value="8">8</option>';
				  html += '						<option value="9">9</option>';
				  html += '						<option value="10">10+</option>';
				  html += '					</select>';
				  html += '					<input type="text" id="qntInput" class="d-none" style="width:52px; height:24px;"/>';
				  html += '					<button class="btn d-none">';
				  html += '							수량변경';
				  html += '					</button>';
				  html += '					<span></span>';
				  html += '  		</div>';
				  html += '  	</div>';
				  html += '  	<div class="badge-list">';
				  html += '			<div class="badge-item option-benefit">';
				  html += '				<span class="promo-cash-benefit ">';
				  html += '					<img class="cash-icon" src="img/cart/cash-icon.png"><em class="promo-cash-benefit__text">최대' + (item.price * 0.01) + '원 적립</em>';
				  html += '				</span>';		
				  html += '			</div>';
				  html += '  	</div>';
				  html += '  </td>';
				  html += '  <td>';
				  html += '  	<button type="button" class="btn_delete">삭제</button>';
				  html += '  </td>';
				  html += '  <td>';
				  html += '  	<div class="cart-product-price" id="cart-product-price">' + item.price + '</div>';
				  html += '  	<img class="cart-rocket" src="img/cart/' + item.img2 + '" alt="로켓배송">';
				  html += '  </td>';
				  html += '  <td>' + item.delivery + '</td>';
				  html += '</tr>';
				  
				  
			  });
			  $("#cart-product-contents").html(html);
			  $(".checkBox").click(checkCount);
			  $(".checkBox").click(checkCheck);
			  $(".btn_delete").click(delete_table);
	
			  $(".prod-quantity-form").click(sum);
			  sum();


			}	  
		},
		error: function(error) {
			console.log(error.status);
		}
	});
}

//상품가격 합계 계산, 적립금계산
function sumItemPrice() {
		let itemQty = parseInt($(event.target).val());
		
		let oneItemPrice = parseInt($(event.target).prev().prev().html());
		
		$(event.target).next().parent().parent().next().parent().next().next().children().html(itemQty * oneItemPrice);
		
		let cash = itemQty * oneItemPrice * 0.01;
		$(event.target).parent().parent().next().children().children().children().next().html("최대 " + cash + "원 적립");
}

//select로 상품수량 입력시 계산
function sum(){
	var total =0;
	$(".cart-product-price").each(function(index, item) {
		total += parseInt($(item).html());
	});

	var add = total.toLocaleString("ko-KR");
	$(".cart-product-price").parent().parent().parent().next().children().children().children().children().html(add);
	$(".orderPrice").html(add);
	$("#finalPrice").html(add);
	$(".final-order-price").html(add);
}

//input으로 상품수량 입력시 계산
function totalPrice() {
	
	var totalPrice = 0;
	$("input[name=checkBox]:checked").each((index, item) => {
		totalPrice += parseInt($(item).parent().next().next().next().next().children(".cart-product-price").html());
	});
	
	$(".orderPrice").html(totalPrice.toLocaleString("ko-KR"));
	$("#finalPrice").html(totalPrice.toLocaleString("ko-KR"));
	$(".final-order-price").html(totalPrice.toLocaleString("ko-KR"));
}

//상품이 아무것도 없으면 상품없음문구 나옴
function bye() {
	console.log($(".cart-product-contents").length);
	if($(".cart-product-contents").length == 0) {
		
		$('#thead').addClass("d-none");
		$('#tbody').removeClass("d-none");
		$('#tfoot').addClass("d-none");
		$('.cart-part1').addClass("d-none");

	}
}

//상품갯수 10개이상 넘어가면 input으로 갯수 입력가능하게 하고 적립금, 가격, 총합계 다시 계산
function checkInput(sel) {
	 var qty = sel;
	 var input = $(event.target).next();
	 if (sel == "10") {
		 		input.removeClass("d-none");
		 		input.next().removeClass("d-none");
		 		input.next().click(function(){
			    qty = input.val();
			    
			    let oneItemPrice = $(event.target).prev().prev().prev().prev().html();
			    $(event.target).parent().parent().parent().next().next().children().html(qty * oneItemPrice);
			    
			    let cash = qty * oneItemPrice * 0.01;
				$(event.target).parent().parent().next().children().children().children().next().html("최대 " + cash + "원 적립");
				
				totalPrice();
		  });
		  
	  } else if(sel < 10) {
		  $('.prod-quantity-form').next().addClass("d-none");
		  $('.prod-quantity-form').next().next().addClass("d-none");
	  }
	 
	  
	}

