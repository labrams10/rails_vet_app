class AnimalPresenter {
  constructor(animal) {
    this.animal = animal
  }

  name() {
    return this.animal.name
  }

  animalEl() {
    return `<li> ${this.name()} </li>`
  }
}



