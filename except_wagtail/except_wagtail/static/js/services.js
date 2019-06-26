const serviceSelectors = $(".service");

function displaySubServices(service){
	console.log(service)
	var selectedServiceId = service.attr('id');
	var selectedService = $("."+selectedServiceId);
	selectedService.addClass("active");
}

serviceSelectors.each(function(){
	$(this).off().on('click', function(){
		var wasActive = $(".active")
		var renderServices = $(".render-service");
		renderServices.each(function(){
			$(this).removeClass("active");
		});
		if(wasActive.length != 0){
			setTimeout(displaySubServices, 500, $(this));
		}else{
			var selectedServiceId = $(this).attr('id');
			var selectedService = $("."+selectedServiceId);
			selectedService.addClass("active");
		}
	});
})