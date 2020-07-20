var inner = $('.carousel-inner');
var projectPreviews = $('.carousel.has-text-centered');
var activeItem = 1;

$(document).ready(function(){
	carouselSize();
	carouselMove();
});

$(window).resize(function(){
	carouselSize();
	carouselMove();
});

$('.carousel-service-prev').on('click', function(){
	activeItem = activeItem-1;
	carouselMove();
});

$('.carousel-service-next').on('click', function(){
	activeItem = activeItem+1;
	carouselMove();
});

function carouselSize(){
	var carouselLength = projectPreviews.length;
	var itemLength = projectPreviews.eq(0).css('width').replace('px','');
	inner.css('width',carouselLength*itemLength+"px");
	$('.carousel-service-next').css('right', -window.innerWidth+document.documentElement.clientWidth+2+"px")
	window.innerWidth - document.documentElement.clientWidth
};

function carouselMove(){
	var carouselLength = projectPreviews.length;
	var itemLength = projectPreviews.eq(0).css('width').replace('px','');
	inner.css('transform','matrix(1, 0, 0, 1, '+(-itemLength*(1+activeItem)+.15*window.innerWidth)+', 0)');
	console.log(carouselLength-4);
	console.log(activeItem)
	if(activeItem == carouselLength-3){
		activeItem = 1;
		inner.css('transform','matrix(1, 0, 0, 1, '+(-itemLength*(1+activeItem)+.15*window.innerWidth)+', 0)');
	}
	if(activeItem == 0){
		activeItem = carouselLength-4
		inner.css('transform','matrix(1, 0, 0, 1, '+(-itemLength*(1+activeItem)+.15*window.innerWidth)+', 0)');
	}
}
