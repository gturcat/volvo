import "bootstrap";
import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

let mainNavLinks = document.querySelectorAll("#sidebar ul li a");
let mainSections = document.querySelectorAll(".tab section");

let lastId;
let cur = [];

// This should probably be throttled.
// Especially because it triggers during smooth scrolling.
// https://lodash.com/docs/4.17.10#throttle
// You could do like...
// window.addEventListener("scroll", () => {
//    _.throttle(doThatStuff, 100);
// });
// Only not doing it here to keep this Pen dependency-free.

window.addEventListener("scroll", event => {
  let fromTop = window.scrollY;

  mainNavLinks.forEach(link => {
    let section = document.querySelector(link.hash);

    if (
      section.offsetTop <= fromTop &&
      section.offsetTop + section.offsetHeight > fromTop
    ) {
      link.classList.add("current");
    } else {
      link.classList.remove("current");
    }
  });
});



const search = document.querySelector('#order_departement');
search.addEventListener('keyup', (event) => {
  const query = event.currentTarget.value;
  console.log(query);
  const nom = fetch(`https://geo.api.gouv.fr/departements?nom=${query}`)
    .then(response => response.json())
    .then((data) => {
    console.log(data);
    });
  const code = fetch(`https://geo.api.gouv.fr/departements?code=${query}`)
    .then(response => response.json())
    .then((data) => {
    console.log(data);
    });
});








