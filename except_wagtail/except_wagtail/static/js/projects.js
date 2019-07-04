const serviceFilters = $(".is-filter");

var funcs = [];
var lock = 0;

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');



function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}
$.ajaxSetup({
    beforeSend: function(xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});



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

function ajaxRequestFilter(page_selector){
	const serviceFiltersActive = $(".is-filter.is-active");
	const page_url = window.location.pathname;
	var listActiveCat = [];
	if (page_selector){
		try {
			page_number = page_selector[0].innerHTML;
		} catch(e){
			page_number = page_selector.innerHTML;
		}
	}else{
		page_number = 1;
	}
	console.log(page_number)
	for( var j = 0; j < serviceFiltersActive.length; j++){
		listActiveCat.push(serviceFiltersActive[j].querySelector("span").innerHTML)
	}
	$.post("/ajax/filter_projects/",
		JSON.stringify({ services: listActiveCat,
			page_number: page_number,
			page_url: page_url }))
		.done(function(data){
			var section;
			section = document.querySelector("#latestProjects");
			section.innerHTML = data.html;
		})
	$.post("/ajax/update_pagination_projects/",
		JSON.stringify({ services: listActiveCat,
			page_number: page_number,
			page_url: page_url }))
		.done(function(data){
			var section = document.querySelector("#pagination");
			section.innerHTML = data.html;	
		})
	if (typeof page_selector !== "undefined"){
		$.post("/ajax/filter_timeline_projects/",
			JSON.stringify({ services: listActiveCat }))
			.done(function(data){
				var section = document.querySelector(".timeline");
				section.innerHTML = data.html;
		})
	}
}

function clickFilter(serviceFilter){
	return function(){
		serviceFilter.off().on('click', function(){
			if( lock == 0){
				updateFilterDisplay($(this));
				ajaxRequestFilter();
				lock=1
			}
			else{
				lock = 0;
			}
		});
	}
}


var i = 0;
serviceFilters.each(function() {	
	funcs[i] = clickFilter($(this));
	i++;	
})

for( var j = 0; j < serviceFilters.length; j++){
	funcs[j]();
}

const serviceFiltersActive = $(".is-filter.is-active");
const page_url = window.location.pathname;
var listActiveCat = [];
for( var j = 0; j < serviceFiltersActive.length; j++){
	listActiveCat.push(serviceFiltersActive[j].querySelector("span").innerHTML)
}

function pageNumberClick(pageNumber){
	pageNumber.off().on('click', function(){
		ajaxRequestFilter(pageNumber);
	})
}

function pageChangeClick(element,direction){
	element.off().on('click', function(){
		var active_page, page, offset;
		if(direction == 'next'){
			offset = -1;
		}else{
			offset = -2;
		}

		active_page = parseInt($('#pagination').find('.active')[0].childNodes[0].innerText[0]);
		page = $('#pagination').find('.page-number')[active_page+offset];
		ajaxRequestFilter(type,page);
	});
}

function setUpNewsPagination(){
	var pagination_numbers = $('#pagination').find(".page-number");
	var previous = $('#pagination').find(".previous");
	var next = $('#pagination').find(".next");

	pagination_numbers.each(function(){
		pageNumberClick($(this));
	});
	previous.each(function(){
		pageChangeClick($(this),'previous')
	});
	next.each(function(){
		pageChangeClick($(this),'next')
	});
}

setUpNewsPagination()

$("body").on('DOMSubtreeModified', "#pagination", function() {
	setUpNewsPagination();
    
});