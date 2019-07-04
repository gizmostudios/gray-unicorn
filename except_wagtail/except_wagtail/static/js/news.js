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

function ajaxRequestFilter(type,page_selector){
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
	for( var j = 0; j < serviceFiltersActive.length; j++){
		listActiveCat.push(serviceFiltersActive[j].querySelector("span").innerHTML)
	}
	$.post("/ajax/filter_news/",
		JSON.stringify({ services: listActiveCat,
			type: type,
			page_number: page_number,
			page_url: page_url }))
		.done(function(data){
			var section;
			if(type == "except"){
				section = document.querySelector("#latestNews");
			}else{
				section = document.querySelector("#lastestArticle");
			}
			section.innerHTML = data.html;
		})
	$.post("/ajax/update_pagination_news/",
		JSON.stringify({ services: listActiveCat,
			page_number: page_number,
			type: type,
			page_url: page_url }))
		.done(function(data){
			if(type == "except"){
				var section = document.querySelector("#paginationExcept");
			}else{
				var section = document.querySelector("#paginationNewspaper");
			}
			section.innerHTML = data.html;	
		})
	if (typeof page_selector !== "undefined" & type == 'except'){
		$.post("/ajax/filter_timeline/",
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
				ajaxRequestFilter('except');
				ajaxRequestFilter('newspaper');
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

function pageNumberClick(pageNumber,type){
	pageNumber.off().on('click', function(){
		ajaxRequestFilter(type,pageNumber);
	})
}
function pageChangeClick(element,type,direction){
	element.off().on('click', function(){
		var active_page, page, offset;
		if(direction == 'next'){
			offset = -1;
		}else{
			offset = -2;
		}

		if (type == 'except'){
			active_page = parseInt($('#paginationExcept').find('.active')[0].childNodes[0].innerText[0]);
			page = $('#paginationExcept').find('.page-number')[active_page+offset];
		}else{
			active_page = parseInt($('#paginationNewspaper').find('.active')[0].childNodes[0].innerText[0]);		
			page = $('#paginationNewspaper').find('.page-number')[active_page+offset];
			console.log(active_page+offset);
		}
		ajaxRequestFilter(type,page);
	});
}

function setUpNewsPagination(type){
	if(type == 'except'){
		var pagination_numbers_except = $('#paginationExcept').find(".page-number");
		var previous_except = $('#paginationExcept').find(".previous");
		var next_except = $('#paginationExcept').find(".next");

		pagination_numbers_except.each(function(){
			pageNumberClick($(this),type);
		});
		previous_except.each(function(){
			pageChangeClick($(this),type,'previous')
		});
		next_except.each(function(){
			pageChangeClick($(this),type,'next')
		});
	}else{
		var pagination_numbers_newspaper = $('#paginationNewspaper').find(".page-number");
		var previous_newspaper = $('#paginationNewspaper').find(".previous");
		var next_newspaper = $('#paginationNewspaper').find(".next");
		pagination_numbers_newspaper.each(function(){
			pageNumberClick($(this),type);
		});
		previous_newspaper.each(function(){
			pageChangeClick($(this),type,'previous')
		});
		next_newspaper.each(function(){
			pageChangeClick($(this),type,'next')
		});
	}
}

setUpNewsPagination('except')
setUpNewsPagination('newspaper')

$("body").on('DOMSubtreeModified', "#paginationNewspaper", function() {
	setUpNewsPagination('newspaper');
    
});

$("body").on('DOMSubtreeModified', "#paginationExcept", function() {


	setUpNewsPagination('except');
});