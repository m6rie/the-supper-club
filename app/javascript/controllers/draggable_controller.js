import { Controller } from "@hotwired/stimulus"
import { preventOverflow } from "@popperjs/core";
import Sortable from 'sortablejs';

export default class extends Controller {
  static targets = ["title", "address", "partydate", "theme", "attendancy", "appetizers", "mains", "desserts"]
  
  connect() {

    // recipes data from draggable
    const dinnerRecipes = []

    // global recipes variable
    window.recipes = function() {
      return dinnerRecipes
    }

    // selected recipes via draggable
    const test = document.querySelector("#ourlist")

    new Sortable(test, {
      group: "shared",
      sort: false,
      swap: true,
      fallbackOnBody: false,
      pull: 'clone',
      put: ["recipes", "empty"]
    });

    // list of recipes from search
    const empty = document.querySelector("#emptyspace")

    new Sortable(empty, {
      group: "shared",
      sort: true,
      swap: true,
      put: ["recipes", "empty"],
      onAdd(event){
        dinnerRecipes.push(event.item)
      },
      onRemove(event){
        recipes().splice(event.item, 1)
      }
    })
  }

    // POSTing data to controller
    sendData() {
      
      // Party data
      // Create page
      const title = this.titleTarget.value
      console.log(title)
      const address = this.addressTarget.value
      console.log(address)
      const partyDate = this.partydateTarget.value
      console.log(partyDate)
      // Attendancy
      const attendancy = this.attendancyTarget.value
      console.log(attendancy)
      // Theme
      const theme = this.themeTarget.value
      console.log(theme)
      // Dishes
      const appetizers = this.appetizersTarget.value
      console.log(appetizers)
      const mains = this.mainsTarget.value
      console.log(mains)
      const desserts = this.dessertsTarget.value
      console.log(desserts)



      // API RECIPE fetch DATA ----------------------------------------------------
      const allRecipes = recipes()
      const labelData = []
      const photoData = []
      const ingredientsData = []
      const urlData = []

      allRecipes.forEach ((recipe) => {
        // recipe url
        const recipeURL = recipe.href
        urlData.push(recipeURL)
        // recipe label
        const label = (recipe.querySelector("#label").dataset.label)
        labelData.push(label)
        // recipe photo
        const photo = (recipe.querySelector("#image").dataset.image)
        photoData.push(photo)
        // recipe ingredients
        const ingredients = (recipe.querySelector("#ingredients").dataset.ingredients)
        ingredientsData.push(ingredients)
        // recipe data object <<<<<<<<<<<<<<<<<<
        const recipeData = { title: JSON.stringify(label), photoUrl: JSON.stringify(photo), ingredients: ingredients, recipe_url: recipeURL }
      })

      // token for the POST
      this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")

      // building POST paramsfor response body
      const params = {
        party: {
          title: title,
          address: address,
          date: partyDate,
          theme: theme,
          attendancy: attendancy,
          appetizers: appetizers,
          mains: mains,
          desserts: desserts,
          recipes_data: {
            title: labelData,
            photo: photoData,
            ingredients: ingredientsData,
            recipe_url: urlData
          }
        }
      }
      
      // ------------------------------------------------------

      // fetch call with data
      fetch("http://localhost:3000/parties", {
        method: "POST",
        headers: { 'Accept': 'application/json', 'Content-Type': 'application/json','X-CSRF-Token': this.csrfToken },
        body: JSON.stringify(params)
      })
        .then(response => response.body)
        .then((data) => {
          // console.log(data)
        })
    }

    test(event) {
      console.log("test")
      alert("test")
    }
  }
