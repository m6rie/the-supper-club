import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navtab-active"
export default class extends Controller {
  // static targets = ["navtabActive", "pages"]
  active() {
    // console.log("test")
    // this.navtabActiveTarget
  }
  connect() {
    // console.log(this.pagesTarget)
  }
}
