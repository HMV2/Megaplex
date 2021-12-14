window.addEventListener("scroll", () => {
  let scrolled = window.scrollY;
  let x = document.querySelector(".navbar");

  if (scrolled > 70) {
    x.classList.add("nav-bg");
  } else {
    x.classList.remove("nav-bg");
  }
});
