import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-recipes"
export default class extends Controller {
  static targets = ["form", "input", "content", "empty"]


  search(event) {

    // api call data
    const input = this.inputTarget.value
    const apiKey = '9a33f2a981e7930dfb3369195fc15726'
    const url = `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`

    // starting fetch
    event.preventDefault()
    fetch(url)
    .then (response => response.json())
    .then((data) => {

      // clean previous search
      this.contentTarget.innerHTML = ""

      //get ingredients
      data.hits.forEach ((recipe) => {
        const ingredients = []
        const ingr = recipe['recipe']['ingredientLines']
        ingr.forEach((ingredient) => {
         ingredients.push(ingredient)
        })

        // insert cards
        this.contentTarget.insertAdjacentHTML("afterBegin",
        `<a href="${recipe['recipe']['url']}" target="_blank" class="card border col-3">
          <div class="row border">
            <div class="col-12" id="image" data-image=${JSON.stringify(recipe['recipe']['image'])}><img src=${JSON.stringify(recipe['recipe']['image'])} width="100%"></div>
          </div>
          <div class="row border">
            <div class="col-12" id="label" data-label=${JSON.stringify(recipe['recipe']['label'])}>${JSON.stringify(recipe['recipe']['label'])}"</div>
          </div>
          <div class="row border">
            <p>Calories: </><div class="col-12">${JSON.stringify(Math.round(recipe['recipe']['calories']))}</div></p>
          </div>
          <div class="row border" id="ingredients" data-ingredients="[${ingredients}]">>
            <p><div class="col-12">Igredients</div></p>
          </div>
        </a>`
        )}
      )
    })
  }
}
