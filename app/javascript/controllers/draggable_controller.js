import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = [
    "title",
    "address",
    "partydate",
    "theme",
    "attendancy",
    "appetizers",
    "mains",
    "desserts",
  ];

  connect() {
    // ARRAY OF RECIPES FROM DRAGGABLE CALLBACK
    const dinnerRecipes = [];

    // GLOBAL RECIPES VARIABLE
    window.recipes = function () {
      return dinnerRecipes;
    };

    // DOM FOR OUR SELECTED RECIPES
    const test = document.querySelector("#ourlist");

    new Sortable(test, {
      group: "shared",
      sort: false,
      swap: true,
      fallbackOnBody: false,
      pull: "clone",
      put: ["recipes", "empty"],
    });

    // DOM FOR PLACING RECIPES IN
    const empty = document.querySelector("#emptyspace");

    new Sortable(empty, {
      group: "shared",
      sort: true,
      swap: true,
      put: ["recipes", "empty"],
      onAdd(event) {
        dinnerRecipes.push(event.item);
      },
      onRemove(event) {
        recipes().splice(event.item, 1);
      },
    });
  }

  // POSTING DATA FOR RECIPES AND PARTIES TO PARTIES CONTROLLER
  sendData() {
    // PARTY DATA -----------------------------------------------

    // CREATY PARTY BASIC INFO DATA
    const title = this.titleTarget.value;
    const address = this.addressTarget.value;
    const partyDate = this.partydateTarget.value;
    // ATTENDANCY DATA
    const attendancy = this.attendancyTarget.value;
    // THEME DATA
    const theme = this.themeTarget.value;
    console.log(theme)
    // DISHES
    const appetizers = this.appetizersTarget.value;
    const mains = this.mainsTarget.value;
    const desserts = this.dessertsTarget.value;

    console.log(title);
    console.log(address);
    console.log(partyDate);
    console.log(attendancy);
    console.log(theme);
    console.log(appetizers);
    console.log(mains);
    console.log(desserts);
    // RECIPE DATA ----------------------------------------------------
    const allRecipes = recipes();
    const labelData = [];
    const photoData = [];
    const ingredientsData = [];
    const urlData = [];

    allRecipes.forEach((recipe) => {
      // RECIPE URL
      const recipeURL = recipe.querySelector("#recipeurl").href;
      console.log(recipeURL)
      urlData.push(recipeURL);
      // RECIPE LABEL
      const label = recipe.querySelector("#label").dataset.label;
      labelData.push(label);
      // RECIPE PHOTO
      const photo = recipe.querySelector("#image").dataset.image;
      photoData.push(photo);
      // RECIPE INGREDIENTS
      const ingredients =
        recipe.querySelector("#ingredients").dataset.ingredients;
      ingredientsData.push(ingredients);
    });

    console.log(urlData)
    // TOKEN FOR THE POST
    this.csrfToken = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content");

    // BUILDING POST PARAMS FOR RESPONSE BODY
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
          url: urlData,
        },
      },
    };
    console.log(params);
    console.log(JSON.stringify(params));

    // FETCH CALL WITH RECIPE AND PARTY DATA
    // https://the-supper-club.herokuapp.com/parties
    // http://localhost:3000/parties
    fetch("https://the-supper-club.herokuapp.com/parties", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": this.csrfToken,
      },
      body: JSON.stringify(params),
    })
      .then((response) => response.body)
      .then((data) => {});
  }
}
