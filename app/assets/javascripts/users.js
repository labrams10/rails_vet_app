$(document).ready(function() {
  $("a.load_animals").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      dataType: "json",
      method: "GET",
      url: this.href
    }).done(function(animals) {
      $("#animals_list").html("");
      if (animals.length > 0) {
        animals.forEach(function(animal) {
          let newAnimal = new AnimalPresenter(animal);
          console.log(newAnimal.animalEl());
          $("#animals_list").append(newAnimal.animalEl());
        });
      } else {
        $("#animals_list").append("You currently have no animals on file. Go to 'My Pets' to add a new friend.")
      }
    })
  })

  $("#new_foodbrand").on("submit", function(e) {
    // e.target.dataset.disableWith

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(foodbrand) {
        $("#foodbrand_name").val("")
        let newFoodbrand = new FoodbrandPresenter(foodbrand);
        console.log(newFoodbrand.foodbrandEl());
        $("#foodbrands_list").append(newFoodbrand.foodbrandEl());
        //TODO: figure out how to enable button after form-submit
      }
    });
    e.preventDefault();
    $("#foodbrand_submit").prop('disabled', false)
  })

  $("a.next_animal").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      dataType: "json",
      method: "GET",
      url: this.href
    }).done(function(animal) {

    })
  })
})
