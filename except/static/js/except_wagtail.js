const $hero = document.querySelector('.hero');
const $nav = document.querySelector('#mainNav');
const $logo = document.querySelector('.logo');
const carousels = document.querySelectorAll('.carousel');
const navRadios = document.getElementsByName('main-menu');
const anchors = document.querySelectorAll('.anchor');
const navbar = document.querySelector('.navbar');
const stickyScrollUp = $('.scroll-up');
const main_menus = document.querySelectorAll('.main-menu');


main_menus.forEach(menu => {
  menu.addEventListener('mouseover', event => {
      menu.querySelector('.sub-menu').classList.add('is-selected');
  });
  menu.addEventListener('mouseout', event => {
      menu.querySelector('.sub-menu').classList.remove('is-selected');
  });
  menu.addEventListener('click', event => {
    main_menus.forEach(menu => {
        menu.querySelector('.sub-menu').classList.remove('is-selected');
      });
      menu.querySelector('.sub-menu').classList.add('is-selected');
  });
});
stickyScrollUp.css('display','none');
let windowWidth = window.innerWidth;
stickyScrollUp.css('top',window.innerHeight-$('button')[0].scrollHeight+'px');
stickyScrollUp.css('left','100px');

var lastScrollTop = 0;


let stickyNav = false;
window.addEventListener('scroll', function () {
  if($hero != null){
    // Cancel on mobile
    if(windowWidth <= 1087) {
      return;
    }

    var st = $(this).scrollTop();
     if (st > lastScrollTop){
        if( window.scrollY < $hero.clientHeight/2){
          $('#bottom-navbar')[0].scrollIntoView( true );
        }
     } else {
     }
     lastScrollTop = st;

    let diff = window.scrollY / $hero.clientHeight;

    if (diff > .9) {
      $nav.classList.add('opaque');
      $('.navbar-menu').find('.fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
      $('.scroll-up').css('display','block');
      $hero.style.opacity = 1 - (0.9 * 1);
    
      $nav.style.transform = `translate(0, -${0.9 * 30}px)`;
      $logo.style.transform = `scale(${1 - 0.9 / 5})`;
      return;
    } else {
      $nav.classList.remove('opaque');
      $('.navbar-menu').find('.fa-chevron-down').removeClass('fa-chevron-down').addClass('fa-chevron-up');
      $('.scroll-up').css('display','none');
    }

    $hero.style.opacity = 1 - (diff * 1);
    
    $nav.style.transform = `translate(0, -${diff * 30}px)`;
    $logo.style.transform = `scale(${1 - diff / 5})`;
  }
})

if($hero == null){
  $(document).ready(function(){
    if(windowWidth <= 1087) {
      return;
    }
    $nav.style.transform = `translate(0, -${0.9 * 30}px)`;
    $logo.style.transform = `scale(${1 - 0.9 / 5})`;
  });
}

window.addEventListener('resize', function () {
  windowWidth = window.innerWidth;
})

carousels.forEach(carousel => {
  const $prev = carousel.querySelector('.button-prev');
  const $next = carousel.querySelector('.button-next');
  const $inner = carousel.querySelector('.carousel-inner');
  const count = carousel.dataset.count;
  let currentScroll = 1;

  $prev.addEventListener('click', () => {
    currentScroll--;
    if(currentScroll < 1) {
      currentScroll = count;
    }
    scrollCarousel($inner, currentScroll);
  });

  $next.addEventListener('click', () => {
    currentScroll++;
    if (currentScroll > count) {
      currentScroll = 1;
    }
    scrollCarousel($inner, currentScroll);
  });
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



$('.lang-selection').off().on('click', function(){
  var url = window.location.pathname;
  $.post("/lang/selection/",
    JSON.stringify({ url: url}))
    .done(function(data){
      window.location.reload();
    })
})

function hidePopup(popup){
  popup.removeClass("transition");
};

$(document).ready(function(){
  $('.popup').each(function(){
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