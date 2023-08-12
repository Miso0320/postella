$(init)

function init() {
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

}

function movepage(page) {
	window.document.location.href=page;
	return;
}
