$(init)

function init() {
	// 아코디언 열기/닫기
	var acc1 = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc1.length; i++) {
	  acc1[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.display === "block") {
	      panel.style.display = "none";
	    } else {
	      panel.style.display = "block";
	    }
	  });
	}
	//메인페이지 슬라이드쇼
	/*$('#slide3>ul>li').hide();
    $('#slide3>ul>li:first-child').show();

    setInterval(function(){
        $('#slide3>ul>li:first-child').fadeOut()
        .next().fadeIn().end(1000)
        .appendTo('#slide3>ul');
    }, 1000);*/

    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
	
	/*$('.carousel').carousel({
		  interval: 50
	})*/
    $(".carousel-control-prev").carousel({interval: 1000, pause: "hover"});

}