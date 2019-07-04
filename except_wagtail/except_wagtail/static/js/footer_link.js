$(document).ready(function(){

	if(window.location.pathname.indexOf("footerlink") >= 0){
		const selection = $('#id_type_link');
		const options = selection.find('option');
		const link_internal_page = $('label[for=id_link_page]').parent().parent()[0];
		const link_external_page = $('label[for=id_link]').parent().parent()[0];
		const popup = $('.stream-field')[0];

		link_internal_page.style.display = 'none';
		link_external_page.style.display = 'none';
		popup.style.display = 'none';


		options.each(function(){
			$(this).off().on('click', function(){
				var option_value = parseInt($(this)[0].value);
				if(option_value == 1){
					link_internal_page.style.display = '';
					link_external_page.style.display = 'none';
					popup.style.display = 'none';
				}else if(option_value == 2){
					link_internal_page.style.display = 'none';
					link_external_page.style.display = '';
					popup.style.display = 'none';
				}else if(option_value == 3){
					link_internal_page.style.display = 'none';
					link_external_page.style.display = 'none';
					popup.style.display = '';
				}else{
					link_internal_page.style.display = 'none';
					link_external_page.style.display = 'none';
					popup.style.display = 'none';
				}
			});
		})
	}	
});



