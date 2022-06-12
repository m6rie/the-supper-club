import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navtab-active"
// export default class extends Controller {
//   static targets = ["navtabActive", "pages"]
//   active() {
//     // console.log("test")
//     this.navtabActiveTarget
//   }

//   static targets = [""]
//   connect() {
//     console.log(this.pagesTarget)
//   }
// }

export default class extends Controller {

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  next() {
    $(document).ready(function() {
      $(document).foundation();
      $('.next-tab').click(function() {
          $('.tabs li.is-active').next().children('a').click();
        });
      }

            //   $('.prev-tab').click(function() {
            //     $('.tabs li.is-active').prev().children('a').click();
            //   });
            // });
