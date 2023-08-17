$(init)
//총 주문금액
var totalOrderPrice;
//배송비
let totalShippingFee = 0;
//input 수량값
var qty;

function init() {
	//"checkBoxSelectAll" 클래스를 가진 요소가 클릭되었을 때 checkAll 함수를 호출하여 체크 박스 전체 선택 동작을 수행하도록 설정
	$(".checkBoxSelectAll").click(checkAll);
	$(".checkBoxSelectAll").click(allcheckCount);
	cart();
	
	//테이블이 삭제되었을때 bye실행 -> 테이블length를 계산해서 0이면 
	$(".delete").click(bye);
	
	//select값의 초기값을 selected되게 한다, 계산을 위해선 selected가 필요
	$(function(){
		$("#selectBtn").val("${param.crt_qty}").attr("selected","selected");
	});

	//select값이 바뀔때마다 상품수량 업데이트 crt_qty update
	$(document).on("change", ".prod-quantity-form", function() {
	    var that = this;	
	    //select값을 받음
		var selectedValue = $(this).val();    
		//selectedValue가 변경된 상품의 prd_no를 받음
		var prd_no = $(this).closest('.cart-product-contents').find('.product-checkBox').val();    
		//개별상품 가격 prodPrice를 받음
	    var unitPrice = parseInt($(this).closest('.cart-product-contents').find('#prodPrice').text());

	    if (selectedValue <= 10) {
	    	console.log("prd_no :" + prd_no);
	    	console.log("selectedValue :" + selectedValue);
		    $.ajax({
		        url: "updateCart", // 업데이트 요청을 처리할 URL 지정
		        method: "POST",
		        data: {
		            prd_no: prd_no,
		            selectedValue: selectedValue
		        },
		        
		        success: function(response) {
		            console.log("업데이트 성공");
		            //select값에 따라 가격변경
		            console.log("selectedValue :" + selectedValue);
		            var newTotalPrice = selectedValue * unitPrice;
		            $(this).closest('.cart-product-contents').find('.cart-product-price').text(newTotalPrice);
		            
		            //select변경할떄마다 가격계산
		            sum();
		            
		            //select변경되면 총 상품가격, 배송비, 총 주문금액 변경
		            var totalPrice1 = parseInt($("#finalPrice1").text().replace(/[^0-9]/g, ""));
					var totalPrice2 = parseInt($("#finalPrice2").text().replace(/[^0-9]/g, "")); 
					totalOrderPrice = totalPrice1 + totalShippingFee;
					  
					console.log("newTotalPrice : " + newTotalPrice);
					console.log("totalOrderPrice : " + totalOrderPrice);
					//ko-KR적용
					$("#finalPrice2").text(totalShippingFee.toLocaleString("ko-KR"));
					$(".final-order-price").text(totalOrderPrice.toLocaleString("ko-KR"));
					console.log("finalPrice1:", finalPrice1);
					console.log("finalPrice2:", finalPrice2);
		        },
		        error: function(error) {
		            console.log("에러 발생:", error);
		        }
		    });
	    }
	});
	//input값이 바뀔때마다 상품수량 update
	$(document).on("click", ".update-quantity-btn", function() {
		var inputValue = $(this).prev("#qntInput").val();
		var prd_no = $(this).closest('.cart-product-contents').find('.product-checkBox').val();
		var unitPrice = parseInt($(this).closest('.cart-product-contents').find('#prodPrice').text());
		
		if(inputValue >= 11) {
			$.ajax({
				url: "updateCart",
				method: "POST",				
				data: {
					prd_no: prd_no,
					inputValue: inputValue
				},
				success: function(response) {
					console.log("수량 업데이트 성공");
					//input값에 따라 가격변경
					console.log("inputValue : "+inputValue);
		            var newTotalPrice = inputValue * unitPrice;
		            console.log("unitPrice :" + unitPrice);
		            console.log("newTotalPrice :" + newTotalPrice);
		            $(this).closest('.cart-product-contents').find('.cart-product-price').text(newTotalPrice);
		            
		            //input변경할떄마다 가격계산
		            sum();
		            
		            //input변경되면 총 상품가격, 배송비, 총 주문금액 변경
		            var totalPrice1 = parseInt($("#finalPrice1").text().replace(/[^0-9]/g, ""));
					var totalPrice2 = parseInt($("#finalPrice2").text().replace(/[^0-9]/g, "")); 
					totalOrderPrice = totalPrice1 + totalShippingFee;
					  
					console.log("newTotalPrice : " + newTotalPrice);
					console.log("totalOrderPrice : " + totalOrderPrice);
					//ko-KR적용
					$("#finalPrice2").text(totalShippingFee.toLocaleString("ko-KR"));
					$(".final-order-price").text(totalOrderPrice.toLocaleString("ko-KR"));
					console.log("finalPrice1:", finalPrice1);
					console.log("finalPrice2:", finalPrice2);
				},
				error: function(error) {
					console.log("에러 발생:", error);
				}
			});
		}
	});
}

//"checkBoxSelectAll" 클래스를 가진 체크박스가 클릭되었을 때 checkAll 함수를 호출하여 체크 박스 전체 선택 동작을 수행하도록 설정
function checkAll() {
	   if($(event.target).is(':checked')) {   				 //전체선택 박스가 checked되면
	      $("input[name=checkBox]").prop("checked", true);   //checkBox라는 이름을 가진 체크박스는 checked된다
	      $(".checkBoxSelectAll").prop("checked", true);	 //checkBoxSelectAll 체크박스도 checked됨
	   }else {
	      $("input[name=checkBox]").prop("checked", false);  //checkBox라는 이름의 checked는 풀림
	      $(".checkBoxSelectAll").prop("checked", false);	 //checkBoxSelectAll 체크박스 checked 풀림
	   }
	   //계산
	   totalPrice();
	}

//체크박스 갯수 세기, checkBox가 checked이면 chksChecked가 1씩 증가
function checkCheck() {
	var chks = document.getElementsByName("checkBox");
	console.log("chks : " + chks);
    var chksChecked = 0;
    
    for(var i=0; i<chks.length; i++) {
       var checkBox = chks[i];
       
       if(checkBox.checked) {
          chksChecked++;
       }
       console.log("chksChecked : " + chksChecked);
    }

    //체크된 체크박스 갯수(chksChecked)가 chks.length길이랑 같으면 전체선택체크  아니면 체크안됨
    if(chksChecked === chks.length){
       $(".checkBoxSelectAll").prop("checked", true);
    }else{
       $(".checkBoxSelectAll").prop("checked",false);
    }
  //select변경되면 총 상품가격, 배송비, 총 주문금액 변경
    var totalPrice1 = parseInt($("#finalPrice1").text().replace(/[^0-9]/g, ""));
	var totalPrice2 = parseInt($("#finalPrice2").text().replace(/[^0-9]/g, "")); 
	totalOrderPrice = totalPrice1 + totalShippingFee;
	  
	//ko-KR적용
	$("#finalPrice2").text(totalShippingFee.toLocaleString("ko-KR"));
	$(".final-order-price").text(totalOrderPrice.toLocaleString("ko-KR"));
	
	//input으로 상품수량 입력시 계산
    totalPrice();
    //체크된 체크박스 갯수 출력
    checkCount();
}

//체크된 체크박스 갯수 출력
function checkCount() {
	var query = "input[name='checkBox']:checked";
	var selectedElements = document.querySelectorAll(query);	
	var selectedElementsCount = selectedElements.length;
	console.log("query : " + selectedElementsCount);
	document.getElementById('result').innerText = selectedElementsCount;
	
	// 상품수량 입력시 계산
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
		let day = now.getDay() + 3; //요일 일요일(0)~토요일(6)
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
		
		let deliveryDate = ("(" + dayText + ")" +month + "/" + date + "도착 보장");
				
	$.ajax({
		url: "cartNormal",
		method: "POST",
		success: function(data) {
			if(data.length == 0) {
				$('#tbody').removeClass("d-none");
			} else {			
				tableCount(data.length);
			
				let html = "";
				var crt_qty_from_data = 1;
				var prevRowspan = 0;
			  data.forEach((item,index) => {
				  console.log("상품 정보:", item);
				    
				  html += '<tr class="cart-product-contents">';
				  html += '  <td>';
				  html += '  	<input type="checkbox" name="checkBox" onchange="checkCheck()" class="product-checkBox" value="'+item.prd_no+'" checked>';
				  html += '  </td>';
				  html += '  <td class="cart-item-img">';
				  html += '  	<a href="setDetailPage?prdNo=' + item.prd_no + '">';
				  html += '			<img src="data:' + item.img_type + ';base64,' + item.encodedFile + '" width="78" height="78">';
				  html += '  	</a>';
				  html += '  </td>';
				  html += '  <td>';
				  html += '  	<div class="cart-product-name">';
				  html += '  		<a href="setDetailPage?prdNo=' + item.prd_no + '">' + item.prd_name + '</a>';
				  html += '  	</div>';
				  html += '  	<hr/>';
				  html += '  	<div class="cart-product-option">';
				  html += '  		<div class="cart-product-option-info">' + deliveryDate;	
				  html += '  		<span class="cart-product-option-info1-2">(밤 12시 전 주문 시)</span>';
				  html += '  		</div>';
				  html += '  		<div class="cart-product-option-price">';
				  html += '  			<span id="prodPrice">' + item.prd_price +'</span>';
				  html += '  			<span>원</span>';
				  html += '					<select id="selectBtn" class="prod-quantity-form dropdown" onchange="javascript:sumItemPrice(); checkInput(this.value);" style="width:52px; height:24px;">';		  
				  
				  /*var crt_qty_from_data = item.crt_qty; // DB로부터 가져온 crt_qty 값
				  for (var i = 1; i <= 10; i++) {
				      var isSelected = i === crt_qty_from_data ? 'selected' : '';
				      html += '<option value="' + i + '" ' + isSelected + '>' + i + '</option>';
				  }
				  //$("#selectBtn").html(html);	
				  if (crt_qty_from_data >= 11) {
					    html += '<option value="10+">10+</option>';
					    html += '</select>';
					    html += '<input type="text" id="qntInput" style="width:52px; height:24px;" value="' + crt_qty_from_data + '">';
					    html += '<button class="btn update-quantity-btn">';
					    html += '수량변경';
					    html += '</button>';
					    html += '<span></span>';
					} else {
					    html += '<option value="10+">10+</option>';
					    html += '</select>';
					    html += '<input type="text" id="qntInput" class="d-none" style="width:52px; height:24px;"/>';
					    html += '<button class="btn update-quantity-btn d-none">';
					    html += '수량변경';
					    html += '</button>';
					    html += '<span></span>';
					}*/
				  var crt_qty_from_data = item.crt_qty; // DB로부터 가져온 crt_qty 값
				  var selectedOptionValue = crt_qty_from_data >= 11 ? '10+' : crt_qty_from_data;

				  for (var i = 1; i <= 10; i++) {
				      var isSelected = i === selectedOptionValue ? 'selected' : '';
				      html += '<option value="' + i + '" ' + isSelected + '>' + i + '</option>';
				  }
				  html += '<option value="10+" ' + (selectedOptionValue === '10+' ? 'selected' : '') + '>10+</option>';
				  html += '</select>';

				  if (crt_qty_from_data >= 11) {
				      html += '<input type="text" id="qntInput" style="width:52px; height:24px;" value="' + crt_qty_from_data + '">';
				      html += '<button class="btn update-quantity-btn">';
				      html += '수량변경';
				      html += '</button>';
				  } else {
				      html += '<input type="text" id="qntInput" class="d-none" style="width:52px; height:24px;"/>';
				      html += '<button class="btn update-quantity-btn d-none">';
				      html += '수량변경';
				      html += '</button>';
				  }
				  html += '<span></span>';
				  html += '  		</div>';
				  html += '  	</div>';
				  html += '  	<div class="badge-list">';
				  html += '			<div class="badge-item option-benefit">';
				  html += '				<span class="promo-cash-benefit ">';
				  html += '					<em class="promo-cash-benefit__text">최대' + (item.prd_price * 0.01) + '원 적립</em>';
				  html += '				</span>';		
				  html += '			</div>';
				  html += '  	</div>';
				  html += '  </td>';
				  html += '  <td>';
				  //html += '  	<button type="button" class="btn_delete">삭제</button>';
				  html += '		<a href="deleteCart?prd_no=' + item.prd_no + '&us_no=' + item.us_no + '" class="btn btn-primary">삭제</a>';
				  html += '  </td>';
				  html += '  <td>';
				  /*html += '  	<div class="cart-product-price" id="cart-product-price">' + item.prd_price + '</div>';*/
				  html += '  	<div class="cart-product-price" id="cart-product-price">' + item.prd_price*crt_qty_from_data + '</div>';
				  html += '  </td>';
				  if(index==0){
					  html += '  <td rowspan="50">';
				  }
				  if(index==0){
					  html += '  	<div class="cart-product-ship-fee" id="cart-product-ship-fee">' + item.prd_ship_fee + '</div>';
				  }
				  html += '  </td>';
				  html += '</tr>';	
				  //배송비 값 받기
				  totalShippingFee = parseFloat(item.prd_ship_fee);
			  });	//forEach 끝
			  
			  $("#cart-product-contents").html(html);
			  $(".checkBox").click(checkCount);
			  $(".btn_delete").click(delete_table);
			  $(".prod-quantity-form").click(function() {
	                sum(); 
			  });
			  sum(); 
			  //처음 실행할때 가격보여주기
			  totalPrice();
			}	// else	끝  
		},	//success 끝
		error: function(error) {
			console.log(error.status);
		}	// ERROR 끝
	});	// AJAX 끝
}

//상품가격 합계 계산, 적립금계산
function sumItemPrice() {
		let itemQty = parseInt($(event.target).val());
		console.log("이벤트타겟:" + itemQty);
		
		let oneItemPrice = parseInt($(event.target).prev().prev().html());
		
		$(event.target).next().parent().parent().next().parent().next().next().children().html(itemQty * oneItemPrice);
		
		let cash = itemQty * oneItemPrice * 0.01;
		$(event.target).parent().parent().next().children().children().children().next().html("최대 " + cash + "원 적립");
}

//select로 상품수량 입력시 계산
function sum(){
	var total =0;
	$(".cart-product-price").each(function(index, item) {
		total += parseInt($(item).text().replace(",", ""));
	});
	var add = total;
	$(".cart-product-price").parent().parent().parent().next().children().children().children().children().html(add);
	$(".orderPrice").html(add);
	$(".final-product-price").html(add);
	$(".final-order-price").html(add);
	totalPrice();
	
	
/*	var formattedAdd = add;
	var finalOrderPriceValue = total + totalShippingFee; // totalShippingFee를 더한 숫자값 계산
    var finalOrderPriceFormatted = finalOrderPriceValue; // 포맷팅된 문자열로 변환

    // .final-order-price 내용 설정
    var finalOrderPriceElement = $(".final-order-price");
    finalOrderPriceElement.html(finalOrderPriceFormatted + totalShippingFee);*/
}

//총 상품금액, 총 배송비, 총 주문금액 계산
function totalPrice() {
	
	var totalPrice = 0;
	$("input[name=checkBox]:checked").each((index, item) => {
		totalPrice += parseInt($(item).parent().next().next().next().next().children(".cart-product-price").html());
	});
	
	if(totalPrice >= 50000) {
		totalShippingFee = 0;
	}else if(totalPrice == 0) {
		totalShippingFee = 0;
	}else {
		totalShippingFee = 3000;
	}
	$(".orderPrice").html(totalPrice);
	$("#finalPrice1").html(totalPrice);
	$("#finalPrice2").html(totalShippingFee);
	$(".final-order-price").html(totalPrice+totalShippingFee);
}

//상품이 아무것도 없으면 상품없음문구 나옴
function bye() {
	console.log($(".cart-product-contents").length);
	if($(".cart-product-contents").length == 0) {
		
		$('#thead').addClass("d-none");
		$('#tbody').removeClass("d-none");
		$('#tfoot').addClass("d-none");
		$('#cart-chart').addClass("d-none");
	}
}

//상품갯수 10개 넘어가면 input으로 갯수 입력가능하게 하고 적립금, 가격, 총합계 다시 계산
function checkInput(sel) {
	 qty = sel;
	 var input = $(event.target).next();
	 if (sel == "10+") {
		 console.log("bbbbbbbbbbbbbbbbbbbbbb");
		 		input.removeClass("d-none");
		 		console.log("aaaaaaaaaaaaaa");
		 		input.next().removeClass("d-none");
		 		input.next().click(function(){
			    qty = input.val();
			    
			    let oneItemPrice = $(event.target).prev().prev().prev().prev().html();
			    $(event.target).parent().parent().parent().next().next().children().html(qty * oneItemPrice);
			    console.log("qty * oneItemPrice : "+qty * oneItemPrice);
			    
			    let cash = qty * oneItemPrice * 0.01;
				$(event.target).parent().parent().next().children().children().children().next().html("최대 " + cash + "원 적립");
				
				totalPrice();
		  });
		  
	  } else if(sel < 10) {
		  input.addClass("d-none");  // input 태그를 숨기기
	        input.next().addClass("d-none");
		  /*$('.prod-quantity-form').next().addClass("d-none");
		  $('.prod-quantity-form').next().next().addClass("d-none");*/
	  }	  
}

//체크박스가 체크된 prd_no가져오기
function deleteChecked() {
    var checkedProducts = []; // 선택된 상품의 prd_no 값을 저장할 배열

    // 체크된 체크박스들을 반복하며 prd_no 값을 추출해서 배열에 저장
    $(".product-checkBox:checked").each(function() {
    	let inputValue = $(this).val();
    	checkedProducts.push(inputValue);
    });
    
    location.href="deleteCheckCart?prd_no="+encodeURIComponent(checkedProducts.join(","));
}

//체크된 상품 삭제
function deleteChecked2() {
	
	if(($("input[name=checkBox]:checked")).length === 0) {
		alert("삭제할 상품을 선택해주세요.");
	} else {
		if (confirm("선택한 상품을 삭제하시겠습니까?") == true){ 
			var checkedProducts = []; // 선택된 상품의 prd_no 값을 저장할 배열

		    // 체크된 체크박스들을 반복하며 prd_no 값을 추출해서 배열에 저장
		    $(".product-checkBox:checked").each(function() {
		    	let inputValue = $(this).val();
		    	checkedProducts.push(inputValue);
		    	console.log("넣은 밸류 : "+ inputValue );
		    });
		    
		    location.href="deleteProducts?prd_no="+encodeURIComponent(checkedProducts.join(","));
			
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