// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require trix
//= require_tree .

function showHideMenu() {
  let menu = document.getElementById("mobile-menu");
  if (menu.style.display === "" || menu.style.display === "none")
    menu.style.display = "flex";
  else
    menu.style.display = "none";
}

function setNavStyle() {
  if (window.location.pathname == "/") {
    let scrolled = window.pageYOffset || document.documentElement.scrollTop;
    let navbar = document.getElementById("navbar");

    if (scrolled == 0) {
      navbar.classList.remove("colored");
      navbar.classList.add("glass");
    }
    else {
      navbar.classList.remove("glass");
      navbar.classList.add("colored");
    }
  }
}

function printCalendar() {

  window.___azcfg = { api: 'https://azbyka.ru/days/api', image: 1 };

  (function (w) {
    var a = w.___azcfg;
    var class_name = 'azbyka-saints';
    var b = getElementsByClassName(document, 'div', class_name);
    var f = '';
    if (a.image != undefined && a.image) {
      f = '?image=1';
    }
    var g = getData(a.api + '/presentations.json' + f);
    var presentations = g.presentations;
    var inner = '';
    if (g.imgs != undefined) {
      var img = g.imgs[Math.floor(Math.random() * g.imgs.length)];
      inner = '<div class="days-image">' + img + '</div>';
    }
    for (var key in b) {
      var element = b[key];
      element.innerHTML = `
        <h2>Евангелие дня и праздники</h2>
        <div class="top">
          <div class="bible-block">
            <div id="readings"></div>
          </div>
          ${inner}
        </div>
        ${presentations}`;
    }
  })(window);

  function getElementsByClassName(a, b, c) {
    var d = (b == "*" && document.all) ? document.all : a.getElementsByTagName(b);
    var e = new Array();
    c = c.replace(/\-/g, "\\-");
    var f = new RegExp("(^|\\s)" + c + "(\\s|$)");
    var g;
    for (var i = 0; i < d.length; i++) {
      g = d[i];
      if (f.test(g.className)) {
        e.push(g);
      }
    }
    return (e);
  }

  function createRequest() {
    var req;
    if (window.XMLHttpRequest) req = new XMLHttpRequest();
    else if (window.ActiveXObject) {
      try {
        req = new ActiveXObject('Msxml2.XMLHTTP');
      } catch (e) { }
      try {
        req = new ActiveXObject('Microsoft.XMLHTTP');
      } catch (e) { }
    }
    return req;
  }

  function getData(a, b) {
    var req = createRequest();
    if (req) {
      req.open("GET", a, false);
      req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      req.send(b);
      if (req.status == 200) {
        var c = req.responseText;
        var d = !(/[^,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]/.test(c.replace(/"(\\.|[^"\\])*"/g, ''))) && eval('(' + c + ')');
        var e = new Object(d);
      }
    }
    return e;
  }

  fetch("https://azbyka.ru/days/api/texts.json").then((response) => {
    response.json().then((data) => {
      if (response.ok) {
        document.getElementById("readings").innerHTML = data
          .map((x, i) => `<div>${data[i].text}</div>`);
        let date = document.getElementsByClassName("date-today")[0];
        let textDate = date.innerHTML;
        date.remove();
        let newDate = document.createElement("div");
        newDate.classList.add("date-today");
        newDate.innerHTML = textDate;
        let parent = document.getElementsByClassName("bible-block")[0];
        parent.insertBefore(newDate, parent.children[0]);
      }
    });
  });
}
