const hero = document.querySelector('.hero');
const hero_body = document.querySelector('.hero .hero-body');
const nav = document.querySelector('#topNav');
const nav_container = document.querySelector('#topNav .container');
const logo = document.querySelector('.logo');
const navRadios = document.getElementsByName('main-menu');
const anchors = document.querySelectorAll('.anchor');
const navbar = document.querySelector('.navbar');
const main_menu = document.querySelector('#mainNav');
const cover = document.querySelector('.background-dark-cover');

var getUrlParameter = function getUrlParameter(sParam) {
  var sPageURL = window.location.search.substring(1),
      sURLVariables = sPageURL.split('&'),
      sParameterName,
      i;

  for (i = 0; i < sURLVariables.length; i++) {
      sParameterName = sURLVariables[i].split('=');

      if (sParameterName[0] === sParam) {
          return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
      }
  }
};

var service = getUrlParameter('service');
var type = getUrlParameter('type');
if (service || type) {
  $('html, body').animate({
      scrollTop: $("#articles").offset().top - 150
  }, 1000);
}

function placeNav() {
  if (hero !== null && window.innerWidth > 1023){
    var topScroll = .9
    if (hero && hero.classList.contains('halved')) {
      topScroll = .75
    }

    var scaling = 0.5;
    if (window.innerHeight > 1000) {
      scaling = 0.2;
    }

    var diff = window.scrollY / (hero.clientHeight - 50);

    if (diff > topScroll) {
      // Finished result:
      nav.classList.add('opaque');
      nav.classList.remove('in-process-opaque');
      hero_body.style.opacity = 1 - (.9 * 1);
      nav.style.transform = `translate(0, -${.9 * 10}px)`;
      logo.style.transform = `scale(${1 - .9 * scaling})`;
      nav_container.style.marginTop = `0px`;
    } else {
      // During scroll resizing:
      nav.classList.remove('opaque');
      nav.classList.add('in-process-opaque');
      hero_body.style.opacity = 1 - (diff * 1);
      nav.style.transform = `translate(0, -${diff * 10}px)`;
      logo.style.transform = `scale(${1 - diff * scaling})`;
      nav_container.style.marginTop = `${100 - 100 * diff}px`;
    }
  } else if (hero === null && window.innerWidth > 1023) {
    var scaling = 0.5;
    if (window.innerHeight > 1000) {
      scaling = 0.2;
    }
    nav.classList.add('opaque');
    nav.style.transform = `translate(0, -${.9 * 10}px)`;
    nav_container.style.marginTop = '0px';
    logo.style.transform = `scale(${1 - .9 * scaling})`;
  }
}

// // This part changes the direction of arrow in the navbar when scrolling
// if(hero !== null){
//   $(document).ready(function(){
//     if(windowWidth <= 1023) {
//       return;
//     }
//     nav.classList.add('opaque');
//     $('.navbar-menu').find('.fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
//     nav.style.transform = `translate(0, -${topScroll * 30}px)`;
//     logo.style.transform = `scale(${1 - topScroll / 2})`;
//     $('.scroll-up').css('display','block');
//   });
// }

// window.addEventListener('resize', function () {
//   windowWidth = window.innerWidth;
// });

// Function to manage the behavior of the pop-up for newsletter subscription
function hidePopup(popup) {
  popup.find('span').removeClass('show');
  popup.find('span').addClass('transition');
  popup.find('span').removeClass('transition');
};

$(document).ready(function(){
  $('.popup').each(function(){
    var popup = $(this)
    if(window.innerWidth >= 1024) {
      var offsetLeft = (popup.parent().find('a').width() / 2) + 'px';
      popup.find('span').css('left', offsetLeft);
    }
    popup.on('click', function(){
      $(document).on('mousedown keydown', function(e) {
        // if the target of the click isn't the container nor a descendant of the container
        if (!popup.is(e.target) && popup.has(e.target).length === 0) {
          hidePopup(popup);
          $(document).off();
        }
      });
      $('.close-popup', popup).on('mousedown keydown', function(e) {
        hidePopup(popup);
        $(this).off();
      });
      popup.find('span').addClass("show");
    });
  });

  //resizing();
});

// $(window).resize(function(){
//   resizing();
// });

// function resizing(){
//   // Manage display of sub-menu of the navbar
//   $('.scroll-full-height').each(function(){
//     $(this).off().on('click',function(){
//       window.scrollBy({
//         top: window.innerHeight - nav.scrollHeight,
//         left: 0,
//         behavior: 'smooth'
//       });
//     });
//   });

//   var scaling = 0.5;
//   if(window.innerHeight > 1000){
//     scaling = 0.2;
//   }

//   if(hero == null){
//     nav.style.transform = `translate(0, -${0.9 * 30}px)`;
//     logo.style.transform = `scale(${1 - 0.9 * scaling})`;
//   }

//   var paddingVal = parseInt($('.navbar').css('height').replace('px','')) + parseInt($('.navbar').css('top').replace('px',''));

//   // $('.anchor').each(function(){
//   //   $(this).css('top', -paddingVal+"px");
//   // });

//   // $('.section.is-fullheight').each(function(){
//   //   var sectionHeight = parseInt($(this).css('height').replace('px',''));
//   //   var paddingHeight = parseInt($(this).css('padding-top').replace('px',''));
//   //   $(this).find('.article').css('height', sectionHeight-paddingHeight*2+"px");
//   // });
// };

// Dropdown placement and menu arrow function:
function placeDropDown() {
  var scrollTop = $(window).scrollTop();
  var dropDown = $('#mainNav').offset().top;
  var distance = (dropDown - scrollTop);
  if (distance > 300) {
    $('#mainNav .navbar-dropdown').addClass('dropdown-up');
    $('#mainNav i.fa-change').removeClass('fa-chevron-down').addClass('fa-chevron-up');
  } else {
    $('#mainNav .navbar-dropdown').removeClass('dropdown-up');
    $('#mainNav i.fa-change').removeClass('fa-chevron-up').addClass('fa-chevron-down');
  }
}

$(document).ready(function() {
  placeNav();
  window.addEventListener('scroll', function (e) {
    placeNav();
  });

  // Hamburger listener:
  $('#topNav .navbar-burger').click(function() {
    $('#topNav .navbar-burger').toggleClass('is-active');
    $('#topNav .navbar-menu').toggleClass('is-active');
    $('#topNav').toggleClass('is-active');
  });
  // END Hamburger listener

  // Dropdown listener:
  $('.has-dropdown').on('mouseenter keydown', function() {
    $(this).toggleClass('is-active');
  })
  $('.has-dropdown').on('mouseleave', function() {
    $(this).toggleClass('is-active');
  })
  // END Dropdown listener

  // Dropdown and menu item arrow workings:
  placeDropDown();
  window.addEventListener('scroll', function (e) {
    if (window.innerWidth <= 1023) {
      return;
    } else {
      placeDropDown();
    }
  });
  // END

  // Hex-graphic animation:
  if ($('svg.hex').length) {
    $('svg.hex').waypoint({
      handler: function(direction) {
        $(this[0, 'element']).addClass('animated');
        $(this[0, 'element']).css('visibility', 'visible');
      },
      offset: '80%'
    });
  }
  // END Hex-graphic animation

  // Hero carousel:
  if ($('.glide').length) {
    new Glide('.glide', {
      type: 'carousel',
      autoplay: 8000
    }).mount();
  }
  // END Hero carousel

  // Article carousel:
  if ($('.article-glide').length) {
    new Glide('.article-glide', {
      type: 'carousel',
      autoplay: 8000,
      perView: 1,
      gap: 0,
      startAt: 1,
      peek: 200,
      hoverpause: true,
      breakpoints: {
        650: {
          peek: 0
        },
        950: {
          peek: 100
        }
      }
    }).mount();
  }
  // END Article carousel

  // Pagination
  $('#nav-next .pagination-link-button').on('click', function(e) {
    e.preventDefault();
    if ($(this).attr('disabled')) { return };
    $(this).attr('disabled', true);
    $('i', this).css('display', 'inline-block');
    window.history.pushState('', '', $(this).attr('href'));
    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      success: function(response) {
        if (response.next) {
          $('#nav-next .pagination-link-button')
            .attr('href', '?page=' + response.next)
            .attr('disabled', false)
            $('#nav-next .pagination-link-button i').css('display', 'none');
          } else {
          $('#nav-next .pagination-link-button').hide()
        }
        $('#nav-next').before($(response.html).hide().fadeIn('slow'));
      }
    })
  });
  $('#nav-prev .pagination-link-button').on('click', function(e) {
    e.preventDefault();
    if ($(this).attr('disabled')) { return } ;
    $(this).attr('disabled', true);
    $('i', this).css('display', 'inline-block');
    window.history.pushState('', '', $(this).attr('href'));
    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      success: function(response) {
        if (response.prev) {
          $('#nav-prev .pagination-link-button')
            .attr('href', '?page=' + response.prev)
            .attr('disabled', false);
          $('#nav-prev .pagination-link-button i').css('display', 'none');
        } else {
          $('#nav-prev .pagination-link-button').hide();
        }
        $('#nav-prev').after($(response.html).hide().fadeIn('slow'));
      }
    })
  });
  // END Pagination
})
