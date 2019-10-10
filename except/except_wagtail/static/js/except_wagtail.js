const $hero = document.querySelector('.hero');
const $nav = document.querySelector('#mainNav');
const $logo = document.querySelector('.logo');
const carousels = document.querySelectorAll('.carousel');
const navRadios = document.getElementsByName('main-menu');
const anchors = document.querySelectorAll('.anchor');
const navbar = document.querySelector('.navbar');
const stickyScrollUp = $('.scroll-up');
const main_menus = document.querySelectorAll('.main-menu');
const cover = document.querySelector('.background-dark-cover');

// Function to manage navbar buttons to display the sun-menu correctly

main_menus.forEach(menu => {
  menu.addEventListener('mouseover', event => {
      menu.querySelector('.sub-menu').classList.add('is-selected');
  });
  menu.addEventListener('mouseout', event => {
      menu.querySelector('.sub-menu').classList.remove('is-selected');
  });
  menu.addEventListener('click', event => {
    main_menus.forEach(menu => {
      if(menu.querySelector('.sub-menu') != null){ 
        menu.querySelector('.sub-menu').classList.remove('is-selected');
      }        
    });
    menu.querySelector('.sub-menu').classList.add('is-selected');
  });
});

stickyScrollUp.css('display','none');
let windowWidth = window.innerWidth;
stickyScrollUp.css('top',window.innerHeight-$('button')[0].scrollHeight+'px');
stickyScrollUp.css('left','100px');

var lastScrollTop = 0;
var scrollLock = 0;

if(window.innerHeight > 1000){
  $logo.style.height = '200px';
  navbar.style.top = '140px';
  cover.style.background = 'linear-gradient(rgba(0,0,0,0.7) 100px, 500px, transparent 100%), linear-gradient(to top, rgba(0,0,0,0.3) 10%, 30%, transparent 100%)';
}


let stickyNav = false;
window.addEventListener('scroll', function (e) {
  if($hero != null){
    // Cancel on mobile
    if(windowWidth <= 1087) {
      return;
    }
    var scaling = 0.5;
    if(window.innerHeight > 1000){
      scaling = 0.2;
    }
    var st = $(this).scrollTop();
     if (st > lastScrollTop){
        if( window.scrollY < $hero.clientHeight/2 && scrollLock == 0){
          $('html, body').animate({ scrollTop: $('#bottom-navbar').position().top }, { duration: 1000, easing:"swing", start: function(){ scrollLock = 1; }, complete: function(){ scrollLock = 0;} });
        }
        else if( window.scrollY > $hero.clientHeight+50 && window.scrollY < $hero.clientHeight*(3/2) && scrollLock == 0){
          if($('#carousel-section').position()){
            $('html, body').animate({ scrollTop: $('#carousel-section').position().top }, { duration: 1000, easing:"swing", start: function(){ scrollLock = 1; }, complete: function(){ scrollLock = 0;} });
          }
        }
        else if( window.scrollY > $hero.clientHeight*2+200 && window.scrollY < $hero.clientHeight*(5/2) && scrollLock == 0){
          if($('#services-section').position()){
            $('html, body').animate({ scrollTop: $('#services-section').position().top }, { duration: 1000, easing:"swing", start: function(){ scrollLock = 1; }, complete: function(){ scrollLock = 0;} });
          }
        }
        else if( window.scrollY > $hero.clientHeight*3+100 && window.scrollY < $hero.clientHeight*(7/2) && scrollLock == 0){
          if($('#highlight-section').position()){
            $('html, body').animate({ scrollTop: $('#highlight-section').position().top }, { duration: 1000, easing:"swing", start: function(){ scrollLock = 1; }, complete: function(){ scrollLock = 0;} });
          }
        }
     }
     lastScrollTop = st;

    let diff = window.scrollY / $hero.clientHeight;

    if (diff > .9) {
      $nav.classList.add('opaque');
      $('.navbar-menu').find('.fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
      $('.scroll-up').css('display','block');
      $hero.style.opacity = 1 - (0.9 * 1);
    
      $nav.style.transform = `translate(0, -${0.9 * 30}px)`;
      $logo.style.transform = `scale(${1 - 0.9 * scaling})`;
      return;
    } else {
      $nav.classList.remove('opaque');
      $('.navbar-menu').find('.fa-chevron-down').removeClass('fa-chevron-down').addClass('fa-chevron-up');
      $('.scroll-up').css('display','none');
    }

    $hero.style.opacity = 1 - (diff * 1);
    
    $nav.style.transform = `translate(0, -${diff * 30}px)`;
    $logo.style.transform = `scale(${1 - diff * scaling})`;
  }
})

// This part changes the direction of arrow in the navbar when scrolling

if($hero == null){
  $(document).ready(function(){
    if(windowWidth <= 1087) {
      return;
    }
    $nav.classList.add('opaque');
    $('.navbar-menu').find('.fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
    $nav.style.transform = `translate(0, -${0.9 * 30}px)`;
    $logo.style.transform = `scale(${1 - 0.9 / 2})`;
    $('.scroll-up').css('display','block');
  });
}

window.addEventListener('resize', function () {
  windowWidth = window.innerWidth;
})

// Function managing the behavior of the carousel in the front page

carousels.forEach(carousel => {
  const $prev = carousel.querySelector('.button-prev');
  const $next = carousel.querySelector('.button-next');
  const $inner = carousel.querySelector('.carousel-inner');
  const count = carousel.dataset.count;
  let currentScroll = 1;
  var windowWidth = window.innerWidth;
  if($prev != null){
    $prev.addEventListener('click', () => {
      currentScroll--;
      if(currentScroll < 1) {
        currentScroll = count;
      }
      scrollCarousel($inner, currentScroll);
    });
  }
  
  if($next != null){
    $next.addEventListener('click', () => {
      currentScroll++;
      if (currentScroll > count) {
        currentScroll = 1;
      }
      scrollCarousel($inner, currentScroll);
    });
  }
})

function scrollCarousel($container, target) {
  $container.scroll({
    behavior: 'smooth',
    top: 0,
    left: windowWidth * (target - 1)
  })
}
anchors.forEach(anchor => {
  if (anchor != null){
    anchor.style.top = -($nav.scrollHeight*0.7)+'px';
  }
})


// Function to manage language changes

$('.lang-selection').on('click', function(){
  console.log('test')
  var url = window.location.pathname;
  $.post("/lang/selection/",
    JSON.stringify({ url: url}))
    .done(function(data){
      window.location.reload();
    })
})


// Function to manage the behavior of the pop-up for newsletter subscription

function hidePopup(popup){
  popup.removeClass("transition");
};

$(document).ready(function(){
  $('.popup').each(function(){
    if(windowWidth >= 1087) {
      var offsetLeft = ($(this).parent().find('a').width()/2)+"px";
      $(this).find('span').css('left', offsetLeft);
    }
    $(this).off().on('click', function(){
      if ($(this).find('span').hasClass("show")){
        $(this).find('span').removeClass("show");
        $(this).find('span').addClass("transition");
        setTimeout(hidePopup, 1000, $(this).find('span'));
      }else{
        $(this).find('span').addClass("show");
      }
    });
  });

  // Manage display of sub-menu of the navbar

  $('.sub-menu').each(function(){
    $(this).off().on('click',function(){
      var dropdown = $(this).closest('.navbar-item').find('.dropdown')
      if(dropdown.css('display') == 'flex'){
        $('.dropdown').css('display','none');
      }else{
        $('.dropdown').css('display','none');
        dropdown.css('display','flex');
      }
    });
  });

  $('.scroll-full-height').each(function(){
    $(this).off().on('click',function(){
      window.scrollBy({
        top: window.innerHeight - $nav.scrollHeight,
        left: 0,
        behavior: 'smooth'
      });
    });
  });
});