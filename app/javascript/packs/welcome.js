export function createParallax() {
  let img = document.getElementById("parallax-img");
  let parallaxPos = document.documentElement.clientHeight;
  let parallax = document.getElementById("parallax");

  window.onscroll = () => {
    let scrolled = window.pageYOffset || document.documentElement.scrollTop;

    if (img && parallax) {
      let { y, height } = parallax.getBoundingClientRect();
      if (document.documentElement.clientWidth > 1000 && y < parallaxPos && y > -height) {
        let top = ~~(scrolled / 5) - height;
        img.style.top = `${top}px`;
      }
    }

    if (window.location.pathname == "/") {
      let navbar = document.getElementById("navbar");

      if (scrolled == 0) {
        navbar.classList.contains("colored") && navbar.classList.remove("colored");
        navbar.classList.contains("glass") || navbar.classList.add("glass");
      }
      else {
        navbar.classList.contains("glass") && navbar.classList.remove("glass");
        navbar.classList.contains("colored") || navbar.classList.add("colored");
      }
    }
  }
}