const $hero = document.querySelector('.hero');
const $nav = document.querySelector('#mainNav');
const $logo = document.querySelector('.logo');
const carousels = document.querySelectorAll('.carousel');
const navRadios = document.getElementsByName('main-menu');
const anchors = document.querySelectorAll('.anchor');
const navbar = document.querySelector('.navbar');
const stickyScrollUp = $('.scroll-up');

navRadios.forEach(radio => {
  console.log("test")
  radio.addEventListener('click', event => {
    if(!radio.dataset.checked) {
      radio.dataset.checked = true;
      radio.parentNode.classList.add('is-selected');
    } else {
      radio.checked = false;
      delete radio.dataset.checked;
      radio.parentNode.classList.remove('is-selected');
    }
  })
});
stickyScrollUp.css('display','none');
let windowWidth = window.innerWidth;
console.log($('button')[0].scrollHeight);
stickyScrollUp.css('top',window.innerHeight-$('button')[0].scrollHeight+'px');
stickyScrollUp.css('left','100px');



let stickyNav = false;
window.addEventListener('scroll', function () {

  // Cancel on mobile
  if(windowWidth <= 1087) {
    return;
  }


  let diff = window.scrollY / $hero.clientHeight;

  if (diff > .9) {
    $nav.classList.add('opaque');
    $('.navbar-menu').find('.fa-chevron-up').removeClass('fa-chevron-up').addClass('fa-chevron-down');
    $('.scroll-up').css('display','block');
    return;
  } else {
    $nav.classList.remove('opaque');
    $('.navbar-menu').find('.fa-chevron-down').removeClass('fa-chevron-down').addClass('fa-chevron-up');
    $('.scroll-up').css('display','none');
  }

  $hero.style.opacity = 1 - (diff * 1);
  
  $nav.style.transform = `translate(0, -${diff * 30}px)`;
  $logo.style.transform = `scale(${1 - diff / 5})`;
})

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
    anchor.style.top = -($nav.scrollHeight)+'px';
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
      console.log('test')
      if(dropdown.css('display') == 'flex'){
        console.log('test')
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