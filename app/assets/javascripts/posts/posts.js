let album = null;

const postClickHandle = event => {
  event.preventDefault();
  if (event.target.nodeName !== "IMG")
    return;
  let pics = sortPics();
  let currentId = pics.findIndex(pic => pic === event.target);
  if (currentId !== -1 && window.innerWidth > window.innerHeight && window.innerWidth > 800) {
    album = new Album("album", pics, currentId);
    album.open();
  }
}

const sortPics = () => {
  let container = document.getElementById("post");
  return[...document.getElementsByTagName("img")]
    .filter(pic => elemBelongsToContainer(pic, container));
}

const elemBelongsToContainer = (elem, container) => {
  let parent = elem.parentNode;
  while (parent !== document.body) {
    if (parent === container)
      return true;
    parent = parent.parentNode;
  }
  return false;
}

class Album {
  constructor(varName, pics, currentId) {
    this.pics = pics;
    this.id = currentId;
    this.modalWrapper = null;
    this.name = varName;
  }

  open = () => {
    this.modalWrapper = document.createElement("div");
    this.modalWrapper.classList.add("modal-wrapper");
    this.modalWrapper.setAttribute("onclick", `${this.name}.close(event)`);
    let modal = document.createElement("div");
    modal.classList.add("modal");
    let img = document.createElement("img");
    img.setAttribute("src", this.pics[this.id].src);
    let left = document.createElement("div");
    left.innerHTML = "<i class='fas fa-chevron-left'></i>";
    left.setAttribute("id", "left-chevron");
    left.setAttribute("onclick", `${this.name}.prev()`);
    let right = document.createElement("div");
    right.innerHTML = "<i class='fas fa-chevron-right'></i>";
    right.setAttribute("id", "right-chevron");
    right.setAttribute("onclick", `${this.name}.next()`);

    modal.appendChild(img);
    modal.appendChild(left);
    modal.appendChild(right);
    this.modalWrapper.appendChild(modal);
    document.body.appendChild(this.modalWrapper);

    showWindow(this.modalWrapper, 150, "flex");
  }

  close = event => {
    if (event.target === this.modalWrapper) {
      hideWindow(this.modalWrapper, 150);
      setTimeout(() => {
        this.modalWrapper.remove();
        this.modalWrapper = null;
      }, 150);
    }
  }

  prev = () => {
    this.id--;
    this.id < 0 && (this.id = this.pics.length - 1);
    this.setImage();
  }

  next = () => {
    this.id++;
    this.id === this.pics.length && (this.id = 0);
    this.setImage();
  }

  setImage = () => {
    this.modalWrapper.firstElementChild.firstElementChild.src = this.pics[this.id].src;
  }
}
