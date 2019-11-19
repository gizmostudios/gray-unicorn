const carousel_article = $('.container.has-carousel');
const carousel_top = $('.carousel.top-section')
var iteration = 1;

// Function to manage sliding when clicking on buttons below the carousel

carousel_article.each(function() {

  	const $inner = $(this).find('.carousel-inner');
  	const buttons = $('.button.is-selector.is-carousel');
  	const count = $(this)[0].dataset.count;
  	let currentScroll = 1;
  	$(document).ready(function(){
  		scrollCarouselArticle($inner, 0);
  	});


  	buttons.each( function(){
  		$(this).on('click', function(){
  			currentScroll = buttons.index($(this))+1;
  			carousel_article.attr('data-count',currentScroll-1)
  			scrollCarouselArticle($inner, currentScroll);
  			buttons.removeClass('is-primary').addClass('is-secondary');
  			$(this).removeClass('is-secondary').addClass('is-primary');
  		});
  	});
})


// Function to scroll to the next slide

function scrollCarouselArticle($container, target) {
	var width = $container.css('width').replace(/[^-\d\.]/g, '');
	$container[0].scroll({
	    behavior: 'smooth',
	    top: 0,
	    left: width * (target - 1)
	})
}

// Function to auto-scroll and update buttons status

function carouselAutoRotation(){
  carousel_article.each(function() {
    const $inner = $(this).find('.carousel-inner');
    const buttons = $('.button.is-selector.is-carousel');
    const count = buttons.length;
    let currentScroll = (iteration % count);
    scrollCarouselArticle($inner, currentScroll+1);
    buttons.removeClass('is-primary').addClass('is-secondary');
    buttons.each(function(index){
      if( index == currentScroll){
        $(this).removeClass('is-secondary').addClass('is-primary');
      };
    });
  });
  carousel_top.each(function() {
    const $inner = $(this).find('.carousel-inner');
    const images = $inner.find('article');
    const count = images.length;
    let currentScroll = (iteration % count);
    scrollCarouselArticle($inner, currentScroll+1);
  });
  iteration += 1;
};

// Function to set timer of auto slide every 8 seconds

$(document).ready(function(){
  setInterval(carouselAutoRotation,8000);
});
