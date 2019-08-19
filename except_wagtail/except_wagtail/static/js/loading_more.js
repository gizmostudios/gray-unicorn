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

function loadingMore(dataType){
	if(dataType="news"){
		var iteration = 0;
		var articles = document.querySelectorAll('.is-4');
		const page_url = window.location.pathname;
		iteration = Math.ceil(articles.length / 6);
		$.post("/ajax/load_more_news/",
		JSON.stringify({
			iteration: iteration,
			page_url: page_url }))
		.done(function(data){
			var splithtml = data.html.split('|')
			var section = document.querySelector("#news");
			section.innerHTML += splithtml[0];
			var button = document.querySelector('.button-load-container');
			button.innerHTML = splithtml[1];
			$('.load-more').off().on('click', function(){
				var type = document.querySelector('.is-grid').id;
				loadingMore(type);
			});
		})
	}
}

$('.load-more').off().on('click', function(){
	var type = document.querySelector('.is-grid').id;
	loadingMore(type);
});