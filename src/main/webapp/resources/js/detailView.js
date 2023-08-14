$(init);

//리뷰 현재 페이지
revCurrentPage = 1;

//리뷰 전체 페이지
revtotalPages = 0;

//문의 현재 페이지
qnaCurrentPage = 1;

//문의 전체 페이지
qnaTotalPages = 0;

function init() {
	
	// 찜버튼 이벤트
   likeBtn = document.getElementById("prod-favorite-btn");
   liked = 0;
   likeBtn.addEventListener('click', toggleLike);
   
   //공유 버튼 이벤트
   shared = 0;
   shareBtn = document.getElementById("prod-share-btn");
   shareLayer = document.getElementById("prod-share-layer");
   shareBtn.addEventListener('click', shareWindow);
   
   //상품 페이지 그룹 번호 
   pg_no = $(".review-list-section2").data("pg_no");
   
   //리뷰 별점순 버튼 클릭
   $("#orderByStar").click(function(e) {
       e.preventDefault();
       orderByStar(pg_no);
   });
   
   //리뷰 최신순 버튼 클릭
   $("#orderByDate").click(function(e) {
       e.preventDefault();
       orderByDate(pg_no);
   });
   
   //리뷰 검색 버튼 클릭
   $("#searchReview").click(function(e) {
       e.preventDefault();
       var keyword = $(".review-search-Input").val();
       searchReview(pg_no, keyword);
   });
   
   //리뷰 별점별로 보기 버튼 클릭
   $(".star-content").click(function(e) {
       e.preventDefault();
       var starAmount = $(this).data("star-amount");
       groupByStar(pg_no, starAmount);
   });
   
   //장바구니 버튼
   cartButton = document.getElementById("cartButton");
   
   cartButton.addEventListener("click", function() {
	   
	   if (isLoggedIn()) {
	        const quantityInput = document.querySelector(".prod-quantity-input");
	        const quantityValue = quantityInput.value;

	        const prdNo = $(".selectedOName").data("prdno");

	        sendCartData(quantityValue, prdNo);
	    }

   });
   
   //바로 구매 버튼
   payButton = document.getElementById("buy-btn");
   
   payButton.addEventListener("click", function() {
	   if (isLoggedIn()) { 
		    const quantityValue = document.querySelector(".prod-quantity-input").value;
		    const prdNo = $(".selectedOName").data("prdno");
	
		    window.location.href = "orderNpay?quantity=" + encodeURIComponent(quantityValue) + "&prdNo=" + encodeURIComponent(prdNo);
	   }
	});
   
   /*// 썸네일 확대
     var innerFrameVisible = false;
     
     $(".thumbnail_img").mouseover(function(event) {
       innerFrameVisible = true;
       updateInnerFramePosition(event.pageX, event.pageY);
       showZoomedImage();
     });
     
     $(".thumbnail_img").mouseleave(function() {
       innerFrameVisible = false;
       hideInnerFrame();
       hideZoomedImage();
     });
     
     $(".thumbnail_img").mousemove(function(event) {
       if (innerFrameVisible) {
         updateInnerFramePosition(event.pageX, event.pageY);
       }
     });
     
     function updateInnerFramePosition(mouseX, mouseY) {
       var $thumbnailImg = $(".thumbnail_img");
       var thumbnailLeft = $thumbnailImg.offset().left;
       var thumbnailTop = $thumbnailImg.offset().top;
       
       var innerFrameLeft = mouseX - thumbnailLeft;
       var innerFrameTop = mouseY - thumbnailTop;
       
       $(".inner-frame").css({
         "display": "block",
         "left": innerFrameLeft,
         "top": innerFrameTop
       });
     }
     
     function hideInnerFrame() {
       $(".inner-frame").css("display", "none");
     }
     
     function showZoomedImage() {
       $(".zoomed-div").css("display", "block");
     }
     
     function hideZoomedImage() {
       $(".zoomed-div").css("display", "none");
     }
     
     $(".thumbnail_img").mousemove(function(event) {
       var thumbnailRight = $(this).offset().left + $(this).width();
       var thumbnailTop = $(this).offset().top;
     });*/


   // 썸네일 변경
   $(".thum-list-img").mouseover(function() {
      var listImg = $(this).attr("src");
      $(".thumbnail_img").attr("src", listImg);
   });

   // 상품 옵션 드롭다운
   dpBtn = document.getElementById("prod-option-btn");
   dpList = document.getElementById("op-btn-list");
   dpBtn.addEventListener('click', dp_menu);
   
   // 별점 옵션 드롭다운
   starBtn = document.getElementById("review-star-List-btn");
   starList = document.getElementById("star-list");
   starBtn.addEventListener('click', star_menu);
   
   //가격 포맷
   pPrice = $("#basic-price").html();
   fPrice = $("#final-price").html();
   orgPprice = parseInt(pPrice, 10);
   orgFprice = parseInt(fPrice, 10);
   $(formPrice);
   function formPrice() {
       document.getElementById("basic-price").innerHTML = pPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       document.getElementById("final-price").innerHTML = fPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
    
   // 상품 수량 버튼
   prodCnt = $(".prod-quantity-input").attr("value");
   finCnt = parseInt(prodCnt, 10); // string을 10진수로 변환
   $("#cnt-plus").click(function() {
      finCnt++;
      pPrice = orgPprice * finCnt;
      fPrice = orgFprice * finCnt;
      $(".prod-quantity-input").attr("value", finCnt.toString());
      $(formPrice);
   });
   $("#cnt-minus").click(function() {
      if (finCnt > 1) {
         finCnt--;
         pPrice -= orgPprice;
         fPrice -= orgFprice;
         $(".prod-quantity-input").attr("value", finCnt.toString());
         $(formPrice);
      }
   });
   
   //추천 상품 리스트에 마우스 올리면 버튼 보여주기
   prevBtn = document.querySelector("#prev");
   nextBtn = document.querySelector("#next");
   listWrap =  document.querySelector('.recommendation-listNbtn');
   listWrap.addEventListener("mouseenter", () => {
      prevBtn.style.opacity = 1;
      nextBtn.style.opacity = 1;
   });
   listWrap.addEventListener("mouseleave", () => {
      prevBtn.style.opacity = 0;
      nextBtn.style.opacity = 0;
   });
   
   //버튼에 마우스 올리면 색 변경하기
   prevBtn.addEventListener("mouseenter", () => {
      prevBtn.style.backgroundPosition = "-272px -265px";
   });
   prevBtn.addEventListener("mouseleave", () => {
      prevBtn.style.backgroundPosition = "-176px -265px";
   });
   nextBtn.addEventListener("mouseenter", () => {
      nextBtn.style.backgroundPosition = "-319px -265px";
   });
   nextBtn.addEventListener("mouseleave", () => {
      nextBtn.style.backgroundPosition = "-223px -265px";
   });
   
   //버튼 클릭하면 슬라이드 하기
   slider = listWrap.querySelector('.recommendation-list');
   slideLis = slider.querySelectorAll('li')
   moveButton = listWrap.querySelector('.reco-btn');
   /* ul 넓이 계산해 주기 */
   liWidth = slideLis[0].clientWidth;
   sliderWidth = liWidth * slideLis.length;
   slider.style.width = `${sliderWidth}px` ;

   /* 리스너 설치하기 */
   currentIdx = 0; // 슬라이드 현재 번호
   translate = 0; // 슬라이드 위치 값
   prevBtn.addEventListener("click", slidePrev);
   nextBtn.addEventListener("click", slideNext);
   
   //상품정보 더보기 
   moreBtn = document.getElementById("seemore-btn");
   moreBtn.addEventListener('click', seeMore);
   classList = document.querySelector('.prod-detail-img').classList; // 더보기 프레임의 클래스 정보 얻기
   contentHeight = document.querySelector('.prod-detail-img > img').offsetHeight; //컨텐츠 높이 얻기
   
   //처음 리뷰 보여주기
   loadInitialReview()
   
   //처음 상품문의 보여주기
   loadInitialQna(qnaCurrentPage)
}


//공유 버튼 이벤트
function shareWindow() {
   if (shared == 0) {
      shareLayer.style.display = "flex";
      shared = 1;
   } else if (shared == 1) {
      shareLayer.style.display = "none";
      shared = 0;
   }

}

//클릭시 찜버튼 색 변경
function toggleLike() {
	
	// 로그인 상태 체크
    if (isLoggedIn()) {
    	//버튼 비활성화 시
    	if (liked == 0) {
          likeBtn.style.background = 'url("//img1a.coupangcdn.com/image/dragonstone/sdp/PCSDP_imageasset_180417-min.png") no-repeat -262px -209px';
          liked = 1;
          insertWish(pg_no);
       } else if (liked == 1) {
          likeBtn.style.background = 'url("//img1a.coupangcdn.com/image/dragonstone/sdp/PCSDP_imageasset_180417-min.png") no-repeat -218px -209px';
          liked = 0;
          deleteWish(pg_no);
       }
    } 
}

// 상품 옵션 드롭다운
function dp_menu() {
   if (dpList.style.display === "none") {
      dpList.style.display = "block";

   } else {
      dpList.style.display = "none";
   }
}

//별점 드롭다운
function star_menu() {
   if (starList.style.display === "none") {
	   starList.style.display = "block";

   } else {
	   starList.style.display = "none";
   }
}


//상품정보 더보기
function seeMore(e){
   
   // 상품 정보 프레임의 클래스 정보 얻기
   let classList = document.querySelector('.prod-detail-aco').classList;
   //컨텐츠 높이 얻기
   let contentHeight = document.querySelector('.prod-detail-aco > .prod-detail-img').offsetHeight; 
   //버튼 텍스트
   let btnText = document.getElementById("seemore-text");
   //버튼 화살표
   let btnArrow = document.getElementById("seemore-arrow");
   // 전체보기로
    if(classList.contains('show-preview')){
        classList.remove('show-preview');
        btnText.innerHTML = "상품정보 접기 ";
        btnArrow.style.backgroundPosition = '-405px -205px';
    } else {
       classList.add('show-preview')
       btnText.innerHTML = "상품정보 더보기 ";
       btnArrow.style.backgroundPosition = '-405px -217px';
    }
    
}

//컨텐츠 로딩 완료 후 높이 기준으로 클래스 재처리
window.addEventListener('load', function(){
    let contentHeight = document.querySelector('.prod-detail-aco > .prod-detail-img').offsetHeight; //컨텐츠 높이 얻기
    if(contentHeight <= 1000){
        document.querySelector('.detailinfo').classList.remove('show-preview'); // 초기값보다 작으면 전체 컨텐츠 표시
    }
});

//추천 상품 슬라이드
function slidePrev(event) {
   event.preventDefault();
   if (currentIdx !== 0) {
      translate += liWidth;
      slider.style.transform = `translateX(${translate}px)`;
      currentIdx -= 1;
   }
}

function slideNext(event) {
  event.preventDefault();
  if (currentIdx !== slideLis.length -1) {
     translate -= liWidth;
     slider.style.transform = `translateX(${translate}px)`;
     currentIdx += 1;
  }
}

//상품문의 처음 불러오기
function loadInitialQna(qnaCurrentPage) {
    $.ajax({
        type: "GET",
        url: "getQnaFromDB",
        data: { pg_no: pg_no, page: qnaCurrentPage },
        success: function(data) {
            var qnas = data.qnas;
            var totalPages = data.totalPages;

            updateQnaList(qnas);
            qnaPageButtons(qnaCurrentPage, totalPages, "getQnaFromDB");
        }
    });
}

//문의 업데이트하기
function updateQnaList(qnas) {
    var inquiries = "";
    
    for (var i = 0; i < qnas.length; i++) {
        var item = qnas[i];
        inquiries += "<div class='prod-inquiry-item'> " +
            "<div class='prod-inquiry-qpname-set'>" +
            " <em class='prod-inquiry-item-q'>질문</em>" +
            "<div class='prod-inquiry-item-option'>" +
            item.prd_name + "</div> </div> <div class='prod-inquiry-item-text'>" +
            item.q_content + "</div> <div class='prod-inquiry-item-date'>" +
            item.stringQdate + "</div> ";
        
        if (item.a_content !== null) {
            inquiries += "<hr class='sep-line' /> <div class='prod-inquiry-qpname-set'> " +
                "<img alt='' src='/postella/resources/img/detailView/pointer.png' style='width: 20px; height: 20px;'>" +
                " <em class='prod-inquiry-item-a'>답변</em> <div class='prod-inquiry-item-option'>" +
                item.sel_name + "</div> </div> <div class='prod-inquiry-item-text'>" +
                item.a_content + "</div> <div class='prod-inquiry-item-date'>" +
                item.stringAdate + "</div>";
        }
        
        inquiries += " <hr class='sep-line' /> </div> </div>";
    }
    
    $(".prod-inquiry-items").html(inquiries);
}


//문의 페이지 버튼
function qnaPageButtons(qnaCurrentPage, qnaTotalPages, url) {
	var pageHtml = "";
	
	pageHtml +=  "<ul class='pagination pagination-sm'> <li class='page-item' id='qna-prev-page'>" +
	"<a class='page-link'>&laquo;</a> </li>";
	
	for (var i = 1; i <= qnaTotalPages; i++) {
		if(qnaCurrentPage == i) {
			pageHtml += "<li class='qna-page-item page-item active' data-page='" + i + "'><a class='qna-page-button page-link'>" + i + "</a></li>"
		} else {
			pageHtml += "<li class='qna-page-item page-item' data-page='" + i + "'><a class='qna-page-button page-link'>" + i + "</a></li>"
		}
		
	}
	
	pageHtml +=  " <li class='page-item' id='qna-next-page'> <a class='page-link'>&raquo;</a></li></ul>";
	$(".qnaPageBtn").html(pageHtml);
	
	// 생성된 버튼에 클릭 이벤트 핸들러를 연결
	$(".qna-page-item").click(function() {
		var newPage = parseInt($(this).data("page"));
		if (newPage !== qnaCurrentPage) {
			
			qnaCurrentPage = newPage;
			
			// 다른 버튼의 'active' 클래스 제거
            $(".qna-page-item").removeClass("active");
            
            // 현재 클릭한 버튼에 'active' 클래스 추가
            $(this).addClass("active");
            console.log("!!qnaCurrentPage:"+qnaCurrentPage);
			loadInitialQna(qnaCurrentPage);
		}
	});
	
	// 이전 페이지 버튼 클릭
	$("#qna-prev-page").click(function() {
		if (1 < qnaCurrentPage) {
			qnaCurrentPage -= 1;
			loadInitialQna(qnaCurrentPage);
		}
	});
	
	// 다음 페이지 버튼 클릭
	$("#qna-next-page").click(function() {
		if (qnaTotalPages > qnaCurrentPage) {
			qnaCurrentPage += 1;
			loadInitialQna(qnaCurrentPage);
		}
	});

}

//처음 리뷰 불러오기
function loadInitialReview() {
    loadReview("getReviewFromDB", { pg_no: pg_no, page: revCurrentPage }); 
}

// 리뷰 별점순
function orderByStar(pg_no) {
    loadReview("orderByStar", { pg_no: pg_no, page: revCurrentPage });
}

// 리뷰 최신순
function orderByDate(pg_no) {
    loadReview("orderByDate", { pg_no: pg_no, page: revCurrentPage });
}

// 리뷰 검색
function searchReview(pg_no, keyword) {
    loadReview("searchReview", { pg_no: pg_no, keyword: keyword, page: revCurrentPage });
}

// 리뷰 별점별로 보기
function groupByStar(pg_no, starAmount) {
    loadReview("groupByStar", { pg_no: pg_no, starAmount: starAmount, page: revCurrentPage });
}

// 리뷰 보여주기
function loadReview(url, params) {
    $.ajax({
        type: "GET",
        url: url,
        data: params, // 매개변수 객체 전달
        success: function(data) {
    	  var reviews = data.reviews;
          var totalPages = data.totalPages;

          updateReviewList(reviews);
          revTotalPages = totalPages;
          updatePaginationButtons(revCurrentPage, revTotalPages, url);
        }
    });
}

//리뷰 업데이트하기
function updateReviewList(review) {
	 var articles = "";
  	 for (var i = 0; i < review.length; i++) {
        var item = review[i];
        articles += "<article class='review-article'>" +
            " <div class='review-article-info'>" +
            "<div class='review-article-info-top'>" +
            "<span class='review-writer-profile'>" +
            "<img class='review-writer-profile-img' alt='' src='/postella/resources/img/detailView/profile.png'>" +
            "</span> <div class='review-name-star-date'> <div class='review-writer-name'>" +
            "<span>" +
            item.us_name +
            "</span> </div>" +
            "<div class='review-writer-content'> <span class='review-content-star'>";
        for (var j = 1; j <= item.rev_star_rate; j++) {
            articles += "<span class='rating-star-active'>★</span>";
        }
        if (item.rev_star_rate <= 5) {
            for (var j = 1; j <= (5 - item.rev_star_rate); j++) {
                articles += "<span class='rating-star-disactive'>★</span>";
            }
        }
        articles += "</span> <span class='review-content-date'>" +
            item.str_date +
            "</span> </div> </div> </div> <div class='review-content-product-info'>" +
            item.prd_name +
            "</div> </div> <div class='review-content-text'>" +
            item.rev_content +
            "</div>" +
            "</article>";
	    }
  	$(".review-list-section2").html(articles); //section에 article 추가
}

//리뷰 페이징 버튼 업데이트하기
function updatePaginationButtons(currentPage, totalPages, url) {
    var pageHtml = "";
    
    pageHtml +=  "<ul class='pagination pagination-sm'> <li class='page-item' id='rev-prev-page'>" +
	"<a class='page-link'>&laquo;</a> </li>";
    
    for (var i = 1; i <= totalPages; i++) {
    	if(currentPage == i) {
    		pageHtml += "<li class='rev-page-item page-item active' data-page='" + i + "'><a class='rev-page-button page-link'>" + i + "</a></li>"
    	} else {
    		pageHtml += "<li class='rev-page-item page-item' data-page='" + i + "'><a class='rev-page-button page-link'>" + i + "</a></li>"
    	}
    }
    
    pageHtml +=  " <li class='page-item' id='rev-next-page'> <a class='page-link'>&raquo;</a></li></ul>";
    
    $(".revPageBtn").html(pageHtml);

    // 생성된 버튼에 클릭 이벤트 핸들러를 연결
    $(".rev-page-item").click(function() {
        var newPage = parseInt($(this).data("page"));
        if (newPage !== revCurrentPage) {
            revCurrentPage = newPage;
            
            // 다른 버튼의 'active' 클래스 제거
            $(".rev-page-item").removeClass("active");
            
            // 현재 클릭한 버튼에 'active' 클래스 추가
            $(this).addClass("active");
            loadReview(url, { pg_no: pg_no, page: revCurrentPage });
        }
    });
    
    // 이전 페이지 버튼 클릭
	$("#rev-prev-page").click(function() {
		if (1 < revCurrentPage) {
			revCurrentPage -= 1;
			loadReview(url, { pg_no: pg_no, page: revCurrentPage });
		}
	});
	
	// 다음 페이지 버튼 클릭
	$("#rev-next-page").click(function() {
		if (revTotalPages > revCurrentPage) {
			revCurrentPage += 1;
			loadReview(url, { pg_no: pg_no, page: revCurrentPage });
		}
	});
}

//장바구니 넣기 버튼 이벤트
function sendCartData(quantityValue, prdNo) {
	 $.ajax({
        type: "POST",
        url: "detailView/cartAdd",
        data: { quantity: quantityValue, prdNo: prdNo },
        success: function(response) {
            console.log("장바구니 추가 성공");
        },
        error: function(error) {
            console.error("장바구니 추가 실패 : ", error);
        }
    });
}

//찜 버튼 클릭시 insert,delete 처리
function insertWish(pg_no) {
    $.ajax({
        type: "POST",
        url: "insertWish",
        data: { pg_no: pg_no },
        success: function(response) {
            console.log("찜 목록 추가 성공");
        },
        error: function(error) {
            console.error("찜 목록 추가 실패 : ", error);
        }
    });
}

function deleteWish(pg_no) {
    $.ajax({
        type: "POST",
        url: "deleteWish",
        data: { pg_no: pg_no },
        success: function(response) {
            console.log("찜 목록 삭제 성공");
        },
        error: function(error) {
            console.error("찜 목록 삭제 실패 : ", error);
        }
    });
}

//로그인 여부 체크 
function isLoggedIn() {
    if (!userLogin) {
        // 로그인되지 않은 상태일 때 로그인 페이지로 이동
        window.location.href = "/postella/login"; // 로그인 페이지 URL로 수정
        return false;
    }
    return true;
}
