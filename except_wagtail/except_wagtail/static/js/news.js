const categoryFilters = $(".is-filter");

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



function updateFilterDisplay(categoryFilter){
	const categoryFiltersActive = $(".is-filter.is-active");
	if(categoryFiltersActive.length == categoryFilters.length){
		categoryFilters.removeClass("is-active").addClass("is-inactive");
		categoryFilter.removeClass("is-inactive").addClass("is-active");
	}
	else if(categoryFilter.hasClass("is-active")){
		categoryFilter.removeClass("is-active").addClass("is-inactive");
	}
	else{
		categoryFilter.removeClass("is-inactive").addClass("is-active");
	}
	const categoryFiltersActiveUpdated = $(".is-filter.is-active");
	if (categoryFiltersActiveUpdated.length == 0){
		categoryFilters.removeClass("is-inactive").addClass("is-active");
	}
}

function ajaxRequestFilter(){
	const categoryFiltersActive = $(".is-filter.is-active");
	var listActiveCat = [];
	for( var j = 0; j < categoryFiltersActive.length; j++){
		listActiveCat.push(categoryFiltersActive[j].querySelector("span").innerHTML)
	}
	$.post("/ajax/filter_news/",
		JSON.stringify({ categories: listActiveCat,
		type: "except" }))
		.done(function(data){
			var section = document.querySelector("#latestNews");
			section.innerHTML = data.html;
		})
	$.post("/ajax/filter_news/",
		JSON.stringify({ categories: listActiveCat,
		type: "newspaper" }))
		.done(function(data){
			var section = document.querySelector("#lastestArticle");
			section.innerHTML = data.html;
		})
	$.post("/ajax/filter_timeline/",
		JSON.stringify({ categories: listActiveCat }))
		.done(function(data){
			var section = document.querySelector(".timeline");
			section.innerHTML = data.html;
		})
		lock = 1
}

function clickFilter(categoryFilter){
	return function(){
		categoryFilter.off().on('click', function(){
			if( lock == 0){
				updateFilterDisplay($(this));
				ajaxRequestFilter();
			}
			else{
				lock = 0;
			}
		});
	}
}


var i = 0;
categoryFilters.each(function() {	
	funcs[i] = clickFilter($(this));
	i++;	
})

for( var j = 0; j < categoryFilters.length; j++){
	funcs[j]();
}