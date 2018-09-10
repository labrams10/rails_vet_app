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
})

$(function() {
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

        // $('#foodbrand_name').append( JSON.stringify(foodbrand));

        // var $ol = foodbrand["name"]
        // need to do some formatting. Trying to append something that won't work (a hash)
        // $("#foodbrand_name").append(foodbrand["name"])
      }
    });
    e.preventDefault();
  })
})

