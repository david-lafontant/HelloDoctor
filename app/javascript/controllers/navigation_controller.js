import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navigation"
export default class extends Controller {
  connect() {
    (() => {
      "use strict";

      document
        .querySelector("#navbarSideCollapse")
        .addEventListener("click", () => {
          document
            .querySelector(".offcanvas-collapse")
            .classList.toggle("open");
        });
    })();
  }
}
