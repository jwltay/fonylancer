import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profilebar"
export default class extends Controller {
  connect() {
    console.log("please work!")
  }

  makeOpaque() {
    console.log(window.scrollY);
    if (window.scrollY >= 120) {
      this.element.classList.add("profile-bar-opaque")
    } else {
      this.element.classList.remove("profile-bar-opaque")
    }
  }
}
