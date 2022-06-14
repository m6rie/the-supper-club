import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-recipes"
export default class extends Controller {
  static targets = ["form", "input", "content", "empty"];

  search(event) {
    // API CALL DATA
    const input = this.inputTarget.value;
    const apiKey = "9a33f2a981e7930dfb3369195fc15726";
    const url = `https://api.edamam.com/api/recipes/v2?type=public&q=${input}&app_id=958988ca&app_key=${apiKey}`;

    // STARTING FETCH FROM API
    event.preventDefault();
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        // CLEAN PREVIOUS SEARCH
        this.contentTarget.innerHTML = "";

        // GET INGREDIENTS
        data.hits.forEach((recipe) => {
          const ingredients = [];
          const ingr = recipe["recipe"]["ingredientLines"];
          ingr.forEach((ingredient) => {
            ingredients.push(ingredient);
          });

          // INSERT CARDS TO VIEW
          this.contentTarget.insertAdjacentHTML(
            "afterBegin",
            `
            <div class="d-flex">
              <div href="${recipe["recipe"]["url"]}" target="_blank" class="card-recipe-api">

              <a href="${recipe["recipe"]["url"]}" id="recipeurl" target="_blank" class="">
                <div class="" id="image" data-image=${JSON.stringify(recipe["recipe"]["image"])}><img src=${JSON.stringify(recipe["recipe"]["image"])} class ="recipe-api-img"width="100%">
                </div>
              </a>

                <i class=" move-icon fa-solid fa-arrows-up-down-left-right"></i>

                <div class="info-api">
                  <div class="" id="label" data-label=${JSON.stringify(recipe["recipe"]["label"])}>${JSON.stringify(recipe["recipe"]["label"])}"
                </div>
                    <p><div/>${JSON.stringify(Math.round(recipe["recipe"]["calories"]))}kcal</div></p>
                  <div class="" id="ingredients" data-ingredients="[${ingredients}]"></div>
                    <strong>Ingredients: </strong>${JSON.stringify(recipe["recipe"]["ingredients"].length)}
                </div>
              </div>
            </div>`
          );
        });
      });
  }
}
