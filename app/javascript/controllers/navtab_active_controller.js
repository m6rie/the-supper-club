import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navtab-active"
export default class extends Controller {
  static targets = ["button", "pages"]

  connect() {
  //  console.log("connected")
  }

  active(event) {
    // console.log("test")

    // console.log(this.buttonTarget)
    // console.log(this.pagesTarget)
    // this.buttonTarget


    // this.pagesTarget.classList.remove("active")
    console.log(event.Target)
    console.log(this.pagesTarget.querySelector('button').click())
    // this.children.classList.remove("active")
  //   loop(document);
  //   function loop(node) {
  //     console.log(this.pagesTarget.querySelector('button').classList.remove("active"))
  //     console.log(this.pagesTarget.nextElementSibling.querySelector('button').classList.add('active'))
  //     var nodes = node.childNodes;
  //     for (var i = 0; i < nodes.length; i++){
  //       if(!nodes[i]){
  //         continue;
  //       }

  //       if(nodes[i].childNodes.length > 0){
  //         loop(nodes[i]);
  //     }
  //   }

  //   // for (nextElementSibling = null?); {
  //   // console.log(this.pagesTarget.querySelector('button').classList.remove("active"))
  //   // console.log(this.pagesTarget.nextElementSibling.querySelector('button').classList.add('active'))

  //   // console.log(this.pagesTarget.childrenElement.classList)
  // }
    // console.log(this.buttonTarget.nextElementSibling)
    // console.log(this.buttonTarget.nextElementSibling.classList)
    // .remove("active")

    // this.buttonTarget.nextElementSibling
// window.relocate
// function .click to stare at the next element
  }
}
