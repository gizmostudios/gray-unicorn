document.addEventListener('DOMContentLoaded', function () {
	var searchElement = document.querySelector('.input-news');
	var searchElementValue = searchElement.value.toLowerCase();

	// Reset field values.
    searchElement.value = '';

    var grid = $('.is-grid.muuri');

    grid.css('height',grid.find('.column').eq(0).css('height'));

	var grid = new Muuri('.grid-loading', {
		items: '.in-grid',
		layout: {
			fillGaps: true,
		}});

	function updateFilterDisplay(serviceFilter){
	    const serviceFiltersActive = $(".is-filter.is-active");
	    if(serviceFiltersActive.length == serviceFilters.length){
	        serviceFilters.removeClass("is-active").addClass("is-inactive");
	        serviceFilter.removeClass("is-inactive").addClass("is-active");
	    }
	    else if(serviceFilter.hasClass("is-active")){
	        serviceFilter.removeClass("is-active").addClass("is-inactive");
	        serviceFilters.removeClass("is-inactive").addClass("is-active");
	    }
	    else{
	        serviceFilters.removeClass("is-active").addClass("is-inactive");
	        serviceFilter.removeClass("is-inactive").addClass("is-active");
	    }
	    const serviceFiltersActiveUpdated = $(".is-filter.is-active");
	    if (serviceFiltersActiveUpdated.length == 0){
	        serviceFilters.removeClass("is-inactive").addClass("is-active");
	    }
	}

	// Search field binding.
    searchElement.addEventListener('keyup', function () {
      var newSearch = searchElement.value.toLowerCase();
      if (searchElementValue !== newSearch) {
        searchElementValue = newSearch;
        filter();
      }
    });
    const serviceFilters = $(".is-filter");
	var lock = 0;
	serviceFilters.each(function() {
		$(this).off().on('click', function(){
			if(lock == 0){
				updateFilterDisplay($(this));
				filter();
				lock=1;
			}
			else{
				lock=0;
			};
			
		});
	});

    function filter(){
    	searchElementValue = searchElement.value.toLowerCase();

		grid.filter(function (item) {
			var elem = item.getElement();
			var isSearchmatch = !searchElementValue ? true : (elem.getAttribute('data-title') || '').toLowerCase().indexOf(searchElementValue) > -1;
			var isServicematch = false;
			serviceFilters.each(function() {
				if ($(this).hasClass("is-active") && isServicematch == false){
					isServicematch = ($(this).find('span')[0].innerHTML.replace('&amp;','&') == elem.getAttribute('data-service'));
				};
			});
			return isSearchmatch && isServicematch;
		});
    };
});