document.addEventListener('DOMContentLoaded', function () {
	var serviceLinks = $(".service-link");
	var serviceImages = $(".service-image");

	serviceLinks.first().addClass('active');
	serviceImages.first().css('display', 'block');

	serviceLinks.each(function(){
		$(this).off().on('mouseover', function(){
			var service = $(this).find('span')[0].innerHTML.replace('&amp;','&');
			serviceLinks.removeClass('active');
			$(this).addClass('active');
			serviceImages.each( function(){
				console.log($(this)[0].id)
				console.log(service)
				if ($(this)[0].id == service){
					$(this).css('display', 'block');
				}
				else{
					$(this).css('display', 'none');
				}				
			})
		})
	});
});