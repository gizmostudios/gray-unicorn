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
	const categoryFiltersActive = $("is-filter.is-active");
	console.log(categoryFilter)
	if(categoryFiltersActive.length == categoryFilters.length){
		categoryFilters.removeClass("is-active").addClass("is-inactive");
		categoryFilter.removeClass("is-inactive").addClass("is-active");
	}
	else if(categoryFilter.hasClass("is-active")){
		console.log("is active")
		categoryFilter.removeClass("is-active").addClass("is-inactive");
	}
	else{
		console.log("is inactive")
		categoryFilter.removeClass("is-inactive").addClass("is-active");
	}
}

function ajaxRequestFilter(category){
	$.post("/ajax/filter_news/",
			{ category: category.innerHTML })
			.done(function(data){
				var section = document.querySelector("#latestNews");
				section.innerHTML = data.html;
			})
		$.post("/ajax/filter_timeline/",
			{ category: category.innerHTML })
			.done(function(data){
				console.log(data.html)
				var section = document.querySelector(".timeline");
				section.innerHTML = data.html;
			})
}

function clickFilter(categoryFilter){
	return function(){
		const $category = $(this).find("span");
		categoryFilter.off().on('click', function(){
			if( lock == 0){
				updateFilterDisplay($(this));
				ajaxRequestFilter($category);
				lock = 1;
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