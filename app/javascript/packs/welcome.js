export function createParallax() {
  let img = document.getElementById("parallax-img");
  let parallaxPos = document.documentElement.clientHeight;
  let parallax = document.getElementById("parallax");

  window.onscroll = () => {
    if (img && parallax) {
      let scrolled = window.pageYOffset || document.documentElement.scrollTop;
      let { y, height } = parallax.getBoundingClientRect();
      if (document.documentElement.clientWidth > 1000 && y < parallaxPos && y > -height) {
        let top = ~~(scrolled / 5) - height;
        img.style.top = `${top}px`;
      }
    }
  }
}