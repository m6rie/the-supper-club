import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-recipes"
export default class extends Controller {
  static targets = ["form", "input", "content", "empty"]

  search(event) {

    // API CALL DATA
    const input = this.inputTarget.value
    const apiKey = 'bf9c3c3a6e4b5f5c0b91664e51e3fe7b'
    const apiID = '294d47a7'
    const url = `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=${apiID}&app_key=${apiKey}`

    // STARTING FETCH FROM API
    event.preventDefault()
    fetch(url)
    .then (response => response.json())
    .then((data) => {

      // CLEAN PREVIOUS SEARCH
      this.contentTarget.innerHTML = ""

      // GET INGREDIENTS
      data.hits.forEach ((recipe) => {
        const ingredients = []
        const ingr = recipe['recipe']['ingredientLines']
        ingr.forEach((ingredient) => {
         ingredients.push(ingredient)
        })

      // INSERT CARDS TO VIEW
      this.contentTarget.insertAdjacentHTML("afterBegin",

      `<div class=" d-flex">
        <div href="${recipe['recipe']['url']}" target="_blank" class="card-recipe-api">
          <a href="${recipe['recipe']['url']}" target="_blank" id="image" data-image=${JSON.stringify(recipe['recipe']['image'])}><img class="recipe-api-img" src=${JSON.stringify(recipe['recipe']['image'])}></a>
          <i class=" move-icon fa-solid fa-arrows-up-down-left-right"></i>
        <div class="info-api">
            <h5><strong>Title: </strong>${JSON.stringify(recipe['recipe']['label'])}</h5>
            <br>
            <p><strong>Calories: </strong>${JSON.stringify(Math.round(recipe['recipe']['calories']))} kcal</p>
            <div id="ingredients" data-ingredients=[${ingredients}]>
            <strong>Ingredients: </strong>${JSON.stringify((recipe['recipe']['ingredients'].length))}
            </div>
          </div>
        </div>
     `
      )}
    )})
  }
}
