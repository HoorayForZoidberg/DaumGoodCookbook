// ALERT
import swal from 'sweetalert'

// NAVBAR

// Navbar avatar dropwdown menu toggle
// $(".navbar-wagon .dropdown").click(function(e) {
//   $(".dropdown-toggle").dropdown();
// })


// RECIPE PAGE

// Add recipe title to navbar
$(document).ready(function(){
  if ($("#recipe-title")) {
    const title = $("#recipe-title>div").html();
    $("#navbar-recipe-title").html(title);
  }
})

// toggle hidden class on title and navbar title after enough upcscroll
if ($("#recipe")) {
  $(document).scroll(function() {
    var y = $(this).scrollTop();
    if (y > 500) {
      $('#navbar-recipe-title').removeClass("hidden");
    } else {
      $('#navbar-recipe-title').addClass("hidden");
    }
  });
}

// reveal edit buttons when "edit this recipe" is clicked
if ($("#recipe")) {
  $(".edit-mode").click(function(e){
    e.preventDefault();
    $(".edit-mode a").toggleClass("hidden");
    $(".editable:not(.comments-container)").toggleClass("hidden");
  })
}

