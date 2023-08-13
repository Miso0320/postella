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
	
	// 아코디언 열기/닫기
	var acc2 = document.getElementsByClassName("accordion1");
	var i;
	
	for (i = 0; i < acc2.length; i++) {
	  acc2[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.display === "block") {
	      panel.style.display = "none";
	    } else {
	      panel.style.display = "block";
	    }
	  });
	}
	
	// 필터 체크박스
	/*var storedBrands = localStorage.getItem("selectedBrands");
    if (storedBrands) {
        var brandsArray = storedBrands.split(",");
        brandsArray.forEach(function(brand) {
            $(".brand-checkbox[data-value='" + brand + "']").prop("checked", true);
        });
    }*/
	
   /* $("input[name='brand']").change(function() {
        var selectedBrands = $("input[name='brand']:checked").map(function() {
            return $(this).val();
        }).get();
        
        localStorage.setItem("selectedBrands", selectedBrands.join(","));
        window.location.href = contextPath + "/productGroup?brand=" + selectedBrands.join(",");
        
         $.ajax({
            url: "productGroup",
            method: "GET",
            data: { brand: selectedBrands },
            traditional: true,
            success: function(response) {
                console.log(response);
                //document.documentElement.innerHTML = response;
            },
            error: function(error) {
                console.error(error);
            }
        });
        
    });*/
}

/*function movepage(page) {
	window.document.location.href=page;
	return;
}*/
