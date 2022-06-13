import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
// Connects to data-controller="draggable"
export default class extends Controller {
  static targets = ["drag"]

  connect() {
    const test = document.querySelector("#ourlist")
    console.log(test)

    new Sortable(test, {
      group: "shared",
      sort: false,
      swap: true,
      fallbackOnBody: false,
      pull: 'clone',
      put: ["recipes", "empty"],
      onEnd(event){
        console.log(event)
      }


    });

    const empty = document.querySelector("#emptyspace")
    console.log(empty)

    new Sortable(empty, {
      group: "shared",
      sort: true,
      swap: true,
      put: ["recipes", "empty"],
      onEnd(event){
        console.log(event)
      }
    });

    }


  }
