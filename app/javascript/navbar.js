const navbar = document.getElementById("navbar");

function scrollNavbar() {
  if (document.querySelector(".viewing-page-2")) {
      navbar.classList.add("is-visible");
  }
}

function hideNavbarOnHomeTop() {
  navbar.classList.add("navbar-toggle-content");
  document.querySelector(".yielded-content").style.paddingTop = "0px";
}

function navbarSolidColorOnCards() {
  const scrollPos = $(document).scrollTop();
  const cardsListPosition = $('#js-cards-list').offset().top;
  if (scrollPos > cardsListPosition) {
    navbar.classList.add("navbar-dark-background");
  } else {
    navbar.classList.remove("navbar-dark-background");
  }
}

// function activeTabSelector() {
//   const projects = document.getElementById("navbar-all-projects")
//   const dashboard = document.getElementById("navbar-dashboard")

//   console.log(projects)

//   projects.addEventListener("click", (event) => {
//     console.log(projects)
//     projects.classList.add("active")
//     dashboard.classList.remove("active")
//   })

//   dashboard.addEventListener("click", (event) => {
//     console.log(dashboard)
//     projects.classList.remove("active")
//     dashboard.classList.add("active")
//   })
// }

// EVENTS
if (window.location.pathname === "/") {
  hideNavbarOnHomeTop();
  document.addEventListener("transitionend", scrollNavbar);
  // window.onscroll = function() {scrollNavbar()};
} else {
}

if (document.getElementById("js-cards-list")) {
  window.onscroll = function() {navbarSolidColorOnCards()};
}


export { activeTabSelector }
