/////////////hamburger_toggle_

const menuBtn = document.querySelector(".menu-btn");
const hamburger = document.querySelector(".hamburger");
const nav = document.querySelector(".nav");
const menuNav = document.querySelector(".nav-options");
const navItems = document.querySelectorAll(".nav-list");

let showMenu = false;

function toggleMenu() {
  if (!showMenu) {
    hamburger.classList.add("open");
    nav.classList.add("open");
    menuNav.classList.add("open");
    navItems.forEach((item) => item.classList.add("open"));

    showMenu = true;
  } else {
    hamburger.classList.remove("open");
    nav.classList.remove("open");
    menuNav.classList.remove("open");
    navItems.forEach((item) => item.classList.remove("open"));

    showMenu = false;
  }
}

menuBtn.addEventListener("click", toggleMenu);

const dropdown = document.querySelectorAll(".dropdown-link");

function toggleDropdown(e) {
  let parentE = this.parentElement;
  let clickElement = this.children[0];
  dropdown.forEach((item) => {
    let name = item.children[0].className;
    let clickClass = clickElement.className;

    if (name != clickClass) {
      item.children[0].classList.add("open");
    }
  });
  this.children[0].classList.toggle("open");
}

dropdown.forEach((drop) => {
  drop.addEventListener("click", toggleDropdown);
});