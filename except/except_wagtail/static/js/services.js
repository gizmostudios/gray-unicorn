const serviceSelectors = $(".service");
const serviceColumns = $(".column-service");

//Function to display information for services when clicked

function displaySubServices(service){
	var selectedServiceId = service.attr('id');
	var selectedService = $("."+selectedServiceId);
	selectedService.addClass('active')
	selectedService.css({'height':''});
	selectedService.animate({
		height: selectedService.get(0).scrollHeight},
		500,
		function(){
			selectedService.css({'max-height': '500'});
			selectedService.height(selectedService.get(0).scrollHeight);
		}
	);
}

// Function to manage status of services displayed

serviceSelectors.each(function(){
	$(this).off().on('click', function(){
		var activeSection = $(".active");
		var activeService = $(".active-service")
		var renderServices = $(".render-service");
		
		if( $(this)[0] != activeService[0]){
			$(this).addClass("active-service");
			if(activeSection.length != 0){
				activeSection.animate({height:'0'},500);
				activeSection.removeClass("active");
				setTimeout(displaySubServices, 500, $(this));
			}else{
				displaySubServices($(this))
			}
		}else{
			$(this).removeClass("active-service");
			var selectedServiceId = $(this).attr('id');
			var selectedService = $("."+selectedServiceId);
			selectedService.animate({height:'0'},500);
			selectedService.removeClass("active");
		}
		
	});
});

var popService;
var iteration = 0;

// Animation when the page is loading for services

function serviceFadeIn(){
	serviceColumns.each(function(index) {
		if(iteration == index){
			$(this).css('display','none');
			$(this).css('opacity','1');
			$(this).fadeIn( 2000 );
		}
	});
	iteration += 1
}

$(document).ready(function(){
	popService = setInterval(serviceFadeIn, 1000)
});