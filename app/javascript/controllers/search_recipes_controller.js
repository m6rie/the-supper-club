import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-recipes"
export default class extends Controller {
  static targets = ["form", "input", "content"]


  search(event) {

    // console.log("hello")
    // console.log(this.formTarget)
    // console.log(this.inputTarget.value)
    // console.log(this.imageTarget)
    // console.log(this.contentTarget)

    const input = this.inputTarget.value
    const apiKey = '9a33f2a981e7930dfb3369195fc15726'
    const url = `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`




    event.preventDefault()
    fetch(url)
    .then (response => response.json())
    .then((data) => {
      console.log(data.hits)

      data.hits.forEach ((recipe) => {
        console.log(recipe)

        this.contentTarget.insertAdjacentHTML("afterbegin",
        `<a href="${recipe['recipe']['url']}" class="card border col-3">
          <div class="row border">
            <div class="col-12"><img src=${JSON.stringify(recipe['recipe']['image'])} width="100%"></div>
          </div>
          <div class="row border">
            <div class="col-12">${JSON.stringify(recipe['recipe']['label'])}</div>
          </div>
          <div class="row border">
            <p>Calories: </><div class="col-12">${JSON.stringify(Math.round(recipe['recipe']['calories']))}</div></p>
          </div>
          <div class="row border">
            <p><div class="col-12">${JSON.stringify(recipe['recipe']['ingredientLines'].length)}</div> ingredients</p>
          </div>

        </a>`
      )})
    })
  }
}

// Access point
// https://api.edamam.com/api/recipes/v2
// Request URL
// `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`

// From recipe we want "image", "label" "healthLabel", "calories", "digest[0..2]"
