import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-theme"
export default class extends Controller {
  static targets = ["theme", "input"]
  // static values = { theme: String }

  // form.getElementById("form").style.display = "none"

  select(event) {
    event.preventDefault()

    const partyTheme = event.currentTarget.innerText
    event.currentTarget.classList.toggle('selected-card')
    this.inputTarget.value = partyTheme

  }
}
