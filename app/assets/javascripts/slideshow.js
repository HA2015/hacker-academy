var slideIndex = 0;

function showSlides() {
	var i;
	var slides = document.getElementsByClassName("slides");
	var dots = document.getElementsByClassName("dot");
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	slideIndex++;
	if (slideIndex > slides.length)
	{
		slideIndex = 1;
	}

	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" dotActive", "");
	}
	slides[slideIndex-1].style.display = "block";
	dots[slideIndex-1].className += " dotActive";
	setTimeout(showSlides, 2500);
}

$(document).on('page:change', function() {
	showSlides();
});
