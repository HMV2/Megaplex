// ========================toggle-theme======================
let toggleTheme = document.querySelector("#theme-toggle");
let Dark_mode = localStorage.getItem("Dark_mode");


const enableDarkMode = () => {
  document.body.classList.add("Dark-mode");
  localStorage.setItem("Dark_mode", "enabled");
  toggleTheme.classList.toggle("fa-moon");
  toggleTheme.classList.toggle("fa-sun");
  console.log("hello");
};
const disableDarkMode = () => {
  document.body.classList.remove("Dark-mode");
  localStorage.setItem("Dark_mode", null);
  toggleTheme.classList.toggle("fa-moon");
  toggleTheme.classList.toggle("fa-sun");

  console.log("bye");
};
if (Dark_mode == "enabled") {
  enableDarkMode();
}
toggleTheme.addEventListener("click", () => {
  Dark_mode = localStorage.getItem("Dark_mode");

  if (Dark_mode !== "enabled") {
    enableDarkMode();
  } else {
    disableDarkMode();
  }
});
