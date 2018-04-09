import "bootstrap";

// Navbar avatar dropwdown menu toggle
$(document).ready(function(){
  $(".navbar-wagon .dropdown").click(function() {
    $(".dropdown-toggle").dropdown();
  });
})

// Add recipe title to navbar
$(document).ready(function(){
  if ($("#recipe-title")) {
    const title = $("#recipe-title>div").html();
    $("#navbar-recipe-title").html(title);
  }
})

// toggle hidden class on title and navbar title after enough upcscroll
$(document).scroll(function() {
  var y = $(this).scrollTop();
  if (y > 500) {
    $('#navbar-recipe-title').removeClass("hidden");
  } else {
    $('#navbar-recipe-title').addClass("hidden");
  }
})
