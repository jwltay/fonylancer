import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profilebar"
export default class extends Controller {
  connect() {
    console.log("please work!")
  }

  makeOpaque() {
    if (window.scrollY > 25) {
      this.element.classList.add("profile-bar-opaque")
    } else {
      this.element.classList.remove("profile-bar-opqaue")
    }
  }
}
