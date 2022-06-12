import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-recipes"
export default class extends Controller {
  static targets = ["form", "input", "content", "empty"]


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
      //  this.emptyTarget.insertAdjacentHTML("beforeend",
      //   `<div class="col-3" ></div>
      //   <div class="col-3" >some</div>
      //   <div class="col-3" >text</div>
      //   <div class="col-3" >test</div>`
      // )

      this.contentTarget.innerHTML = ""

      data.hits.forEach ((recipe) => {
        // console.log(recipe)

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
          <div class="row border" id="ingredients" data-ingredients=${JSON.stringify(recipe['recipe']['ingredients'])}>>
            <p><div class="col-12">${(recipe['recipe']['ingredients'])}</div></p>
          </div>
        </a>`
        )
        console.log(JSON.stringify(recipe['recipe']['ingredients']))
      }
        )

    })
  }
}

// Access point
// https://api.edamam.com/api/recipes/v2
// Request URL
// `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`

// From recipe we want "image", "label" "healthLabel", "calories", "digest[0..2]"
