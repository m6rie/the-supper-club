import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-theme"
export default class extends Controller {
  static targets = ["theme", "input"]
  // static values = { theme: String }

  // form.getElementById("form").style.display = "none"

  select(event) {
    event.preventDefault()

    this.themeTargets.forEach((theme) => {
      if (theme.classList.contains("selected-card")) {
        theme.classList.remove("selected-card")
      }
    })
    event.currentTarget.classList.add('selected-card')

    const partyTheme = event.currentTarget.innerText
    this.inputTarget.value = partyTheme
    console.log(partyTheme)

  }
}
