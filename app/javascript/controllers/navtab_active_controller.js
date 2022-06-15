import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["tab", "content"];

  show(event) {
    this.tabTargets.forEach((tab) => {
      tab.classList.remove("btn-dark");
      // tab.classList.add("btn-outline-dark");
    });
    event.currentTarget.classList.add("btn-dark");
    this.contentTargets.forEach((content) => {
      // console.log("hello");
      // console.log(content.dataset.attribute);
      // console.log(event.currentTarget.innerText);
      content.classList.add("d-none");
      content.classList.remove("display-a");
      if (event.currentTarget.innerText === content.dataset.attribute) {
        content.classList.remove("d-none");
        content.classList.add("display-a");
      }
    });
  }

  next(event) {
    console.log("work");

    const activeTab = document.querySelector(".btn-dark");
    if (activeTab.nextElementSibling) {
      // activeTab.nextElementSibling.classList.remove("btn-outline-dark");
      activeTab.nextElementSibling.classList.add("btn-dark");
      activeTab.classList.remove("btn-dark");
      // activeTab.classList.add("btn-outine-dark");
    }

    const activeContent = document.querySelector(".display-a");
    if (activeContent.nextElementSibling) {
      activeContent.nextElementSibling.classList.remove("d-none");
      activeContent.nextElementSibling.classList.add("display-a");
      activeContent.classList.remove("display-a");
      activeContent.classList.add("d-none");
    }

    const finalTab = document.querySelector(".final-tab");
    const nextBtn = document.querySelector(".next-tab");
    if (finalTab.classList.contains("btn-dark")) {
      nextBtn.classList.add("d-none");
    }



    // this.tabTargets.forEach((tab) => {
    //   if (tab.classList.contains("btn-dark")) {
    //     console.log(tab.nextElementSibling);
    //     tab.classList.remove("btn-dark");
    //     tab.nextElementSibling.classList.add("btn-dark");
    //   }
    // });
  }
}
