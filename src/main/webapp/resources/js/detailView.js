$(init);

function init() {
   // 찜버튼 이벤트
   likeBtn = document.getElementById("prod-favorite-btn");
   liked = 0;
   likeBtn.addEventListener('click', turnRed);
   //공유 버튼 이벤트
   shared = 0;
   shareBtn = document.getElementById("prod-share-btn");
   shareLayer = document.getElementById("prod-share-layer");
   shareBtn.addEventListener('click', shareWindow);
   
   // 썸네일 확대
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
     });


   // 썸네일 변경
   $(".thum-list-img").mouseover(function() {
      var listImg = $(this).attr("src");
      $(".thumbnail_img").attr("src", listImg);
   });

   // 상품 옵션 드롭다운
   dpBtn = document.getElementById("prod-option-btn");
   dpList = document.getElementById("op-btn-list");
   dpBtn.addEventListener('click', dp_menu);
   
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
   console.log(slideLis[0].clientWidth);
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
function turnRed() {
   if (liked == 0) {
      likeBtn.style.background = 'url("//img1a.coupangcdn.com/image/dragonstone/sdp/PCSDP_imageasset_180417-min.png") no-repeat -262px -209px';
      liked = 1;
   } else if (liked == 1) {
      likeBtn.style.background = 'url("//img1a.coupangcdn.com/image/dragonstone/sdp/PCSDP_imageasset_180417-min.png") no-repeat -218px -209px';
      liked = 0;
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