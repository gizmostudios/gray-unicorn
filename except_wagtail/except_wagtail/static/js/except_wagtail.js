const $hero = document.querySelector('.hero');
const $nav = document.querySelector('#mainNav');
const $logo = document.querySelector('.logo');
const carousels = document.querySelectorAll('.carousel');

let windowWidth = window.innerWidth;

let stickyNav = false;
window.addEventListener('scroll', function () {
  let diff = window.scrollY / $hero.clientHeight;

  if (diff > .9) {
    $nav.classList.add('opaque');
    return;
  } else {
    $nav.classList.remove('opaque');
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