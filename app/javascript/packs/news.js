export function setPostImgs() {
  let cont = document.getElementsByClassName("image");
  for (let i = 0; i < cont.length; i++) {
    if (cont[i].children[0]) {
      cont[i].style.backgroundImage = `url(${cont[i].children[0].src})`;
      cont[i].children[0].remove();
    }
  }
}