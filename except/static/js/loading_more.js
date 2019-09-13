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

function loadMore(){
	var type = document.querySelector('.grid-loading').id;
	var articles = document.querySelectorAll('.is-loadable');
	var iteration = 0;
	if(type != "news"){
		iteration = Math.ceil(articles.length / 8);
	}
	else{
		iteration = Math.ceil(articles.length / 6);
	}
	loadElements(type,iteration,false);
}

function loadElements(dataType,iteration,filter_update){
	var listActiveCat = [];
	if(dataType != "news"){
		const serviceFiltersActive = $(".is-filter.is-active");
		for( var j = 0; j < serviceFiltersActive.length; j++){
			listActiveCat.push(serviceFiltersActive[j].querySelector("span").innerHTML)
		}
	}
	$.post("/ajax/load_elements/",
	JSON.stringify({
		services: listActiveCat,
		dataType: dataType,
		iteration: iteration }))
	.done(function(data){
		var splithtml = data.html.split('|')
		var section = document.querySelector("#"+dataType);
		if(filter_update){
			section.innerHTML = splithtml[0];
		}else{
			section.innerHTML += splithtml[0];
		}
		var button = document.querySelector('.button-load-container');
		button.innerHTML = splithtml[1];
		$('.load-more').off().on('click', function(){
			loadMore();
		});
	})
}

$('.load-more').off().on('click', function(){
	loadMore();
});

const serviceFilters = $(".is-filter");
var lock = 0;
serviceFilters.each(function() {
	$(this).off().on('click', function(){
		if(lock == 0){
			updateFilterDisplay($(this));
			var type = document.querySelector('.grid-loading').id;
			loadElements(type,0,true);
			lock=1;
		}
		else{
			lock=0;
		};
		
	});
});