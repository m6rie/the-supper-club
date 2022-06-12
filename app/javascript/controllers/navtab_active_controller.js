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
<<<<<<< HEAD

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
=======
  // static targets = ["navtabActive", "pages"]
  active() {
    // console.log("test")
    // this.navtabActiveTarget
  }
  connect() {
    // console.log(this.pagesTarget)
  }
}
>>>>>>> d88e4e735bf28faaddecac39c5a588939ac7851a
