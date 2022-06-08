import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-recipes"
export default class extends Controller {
  static targets = ["form", "input", "content", "image"]
  //  "health-label"

  search(event) {

    console.log("hello")
    console.log(this.formTarget)
    console.log(this.inputTarget.value)
    console.log(this.imageTarget)
    // console.log(this.contentTarget)

    const input = this.inputTarget.value
    const apiKey = '9a33f2a981e7930dfb3369195fc15726'
    const url = `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`
    // const results = document.querySelector("#results")



    event.preventDefault()
    fetch(url)
    .then (response => response.json())
    .then((data) => {
      console.log(data.hits)

      // const results = data.hits
      // results.forEach ((recipe) => {
      //   console.log(recipe)
      // })


      data.hits.forEach ((recipe) => {

        // const contentTarget = `<div class="list-inline-item">
        //   <img src="${result.healthLabels}" alt="">
        //   <p>${result.Label}</p>
        //   </div>`
        // results.insertAdjacentHTML("beforeend", contentTarget)
        // console.log(recipe['recipe']['image'])

        this.contentTarget.insertAdjacentHTML("beforeend", `<div class="col-6 border">${JSON.stringify(recipe['recipe']['label'])}</div>`)
        this.healthTarget.insertAdjacentHTML("beforeend", `<div class="col-6 border">${JSON.stringify(recipe['recipe']['healthLabels'])}</div>`)
        this.imageTarget.insertAdjacentHTML("beforeend", `<img src="${recipe['recipe']['image']}" alt="">`)

        // this.health-labelTarget.insertAdjacentHTML("beforeend", `<div class="col-6 border">${JSON.stringify(recipe['healthLabel'])}</div>`)

      })
      // this.imageTarget.insertAdjacentHTML("beforeend", `<div class="col-4 border">${recipe['image']}</div>`)
      // data['hits'].forEach ((recipe) => {
      //   this.contentTarget.insertAdjacentHTML("beforeend", `<div class="col-6 border">${JSON.stringify(recipe)}</div>`)
      //   this.allergentsTarget.insertAdjacentHTML("beforeend", `<div class="col-6 border">${JSON.stringify(recipe)}</div>`)
      // })
    })
  }
}

// Access point
// https://api.edamam.com/api/recipes/v2
// Request URL
// `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`

// From recipe we want "image", "label" "healthLabel", "calories", "digest[0..2]"
