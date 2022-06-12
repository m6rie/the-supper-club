import { Controller } from "@hotwired/stimulus"
import { preventOverflow } from "@popperjs/core";
import Sortable from 'sortablejs';
// Connects to data-controller="draggable"
export default class extends Controller {
  // static targets = ["drag"]

  connect() {
    // console.log(this.dragTarget)
    const dinnerRecipes = []

    // function recipes() {
    //   return dinnerRecipes
    //   // return dinnerRecipes
    // }

    window.recipes = function() {
      return dinnerRecipes
    }


    const test = document.querySelector("#ourlist")

    new Sortable(test, {
      group: "shared",
      sort: false,
      swap: true,
      fallbackOnBody: false,
      pull: 'clone',
      put: ["recipes", "empty"]
      // onRemove(event){

    });

    const empty = document.querySelector("#emptyspace")

    new Sortable(empty, {
      group: "shared",
      sort: true,
      swap: true,
      put: ["recipes", "empty"],
      onAdd(event){
        // console.log(event)
        // console.log(event.item)
        dinnerRecipes.push(event.item)
        // console.log(recipes())
        // const test = Object.assign({}, event.item.dataset )
        // console.log(test)
      },

      onRemove(event){
        // console.log(event)
        // console.log(event.item)
        recipes().splice(event.item, 1)
        // console.log(dinnerRecipes)
      }
    });

    }
    sendData() {

      const allRecipes = recipes()
      const labelData = []
      const photoData = []
      const recipeIngredients = []
      allRecipes.forEach ((recipe) => {
        const label = (recipe.querySelector("#label").dataset.label)
        labelData.push(label)
        const photo = (recipe.querySelector("#image").dataset.image)
        photoData.push(photo)

        const ingredients = recipe.querySelector("#ingredients")
        console.log(ingredients)

        // recipe['recipe']['ingredientLines'].forEach((ingredient) => {
        //   recipeIngredients.push(ingredient)
        // })
        console.log(ingredients)
        const recipeData = { title: JSON.stringify(label), photoUrl: JSON.stringify(photo) }
        // console.log(recipeData)
        // const recipe_obj = Object.create(recipeData)
        // data.push(recipe_obj)
        // console.log(recipe_obj)
        // console.log(JSON.stringify(recipe_obj.title))
        // console.log(JSON.stringify(recipe_obj.photoUrl))
      })
      // console.log(data)
      // console.log(labelDaxta)
      // console.log(photoData)
      // console.log(ingredients)
      this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")

      // const form = new FormData()
      // form.append( "party" , 'test', )
      // console.log(form.entries().next())
      const params = {
        party: {
          title: labelData,
          photo: photoData
        }
      }
      console.log(params)
      console.log(JSON.stringify(params))


      fetch("http://localhost:3000/parties", {
        method: "POST",
        headers: { 'Accept': 'application/json', 'Content-Type': 'application/json','X-CSRF-Token': this.csrfToken },
        body: JSON.stringify(params)
      })
        .then(response => response.body)
        .then((data) => {
          console.log(data)
        })
    }
  }
