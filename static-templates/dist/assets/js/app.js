const $hero = document.querySelector('.hero');
const $nav = document.querySelector('#mainNav');
const $logo = document.querySelector('.logo');

let stickyNav = false;

window.addEventListener('scroll', function () {
  let diff = window.scrollY / $hero.clientHeight;

  if(diff > 1){
    $nav.classList.add('opaque');
    return;
  } else {
    $nav.classList.remove('opaque');
  }

  $hero.style.opacity = 1 - (diff * 1);
  $nav.style.filter = `invert(${diff})`;
  $nav.style.transform = `translate(0, -${diff * 30}px)`;
  $logo.style.transform = `scale(${1 - diff / 5})`;
})