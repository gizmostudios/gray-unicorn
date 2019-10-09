/* This files is a test of the Muuri library and a new of filter and load information in the news section */
document.addEventListener('DOMContentLoaded', function () {
	var searchElement = document.querySelector('.input-news');
	var typeFilter = document.querySelector('.type-field');
	var urlFilter = document.querySelector('.url-field');
	var searchElementValue = searchElement.value.toLowerCase();
	var typeFilterValue = typeFilter.value;
	var urlFilterValue = urlFilter.value;

	// Reset field values.
    searchElement.value = '';
    [urlFilter, typeFilter].forEach(function (field) {
      field.value = field.querySelectorAll('option')[0].value;
    });

	var grid = new Muuri('.grid-loading', {
		items: '.in-grid',
		layout: {
			fillGaps: true,
		}});

	// Search field binding.
    searchElement.addEventListener('keyup', function () {
      var newSearch = searchElement.value.toLowerCase();
      if (searchElementValue !== newSearch) {
        searchElementValue = newSearch;
        filter();
      }
    });
    typeFilter.addEventListener('change', filter);
    urlFilter.addEventListener('change', filter);

    function filter(){
    	searchElementValue = searchElement.value.toLowerCase();
		typeFilterValue = typeFilter.value;
		urlFilterValue = urlFilter.value;
		console.log(searchElementValue);
		console.log(typeFilterValue);
		console.log(urlFilterValue);
		grid.filter(function (item) {
			var elem = item.getElement();
			console.log(elem);
			var isSearchmatch = !searchElementValue ? true : (elem.getAttribute('data-title') || '').toLowerCase().indexOf(searchElementValue) > -1;
			var isTypeMatch = !typeFilterValue ? true : (elem.getAttribute('data-type') || '') === typeFilterValue;
			if(typeFilterValue == "AR"){
				if( elem.getAttribute('data-type') == ""){
					isTypeMatch = true;
				}
			}
			var isUrlMatch = false;
			if(urlFilterValue == "all"){
				isUrlMatch = true;
			}
			else if(urlFilterValue == ""){
				if(elem.getAttribute('data-url') == ""){
					isUrlMatch = true;
				};
			}
			else{
				if(elem.getAttribute('data-url') != ""){
					isUrlMatch = true;
				};
			}
			return isSearchmatch && isTypeMatch && isUrlMatch;
		});
    };
});