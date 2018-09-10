class FoodbrandPresenter {
  constructor(foodbrand) {
    this.foodbrand = foodbrand
  }

  name() {
    return this.foodbrand.name
  }

  foodbrandEl() {
    return `<li> ${this.name()} </li>`
  }
}
