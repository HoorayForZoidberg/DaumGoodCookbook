// ALERTS
import swal from 'sweetalert'

// auto-dismiss flashes after 3 seconds
$('document').ready(function() {
  setTimeout(function() {
    $('.alert-dismissible').slideUp();
  }, 3000);
});


// NAVBAR

// Navbar avatar dropwdown menu toggle
// $(".navbar-wagon .dropdown").click(function(e) {
//   $(".dropdown-toggle").dropdown();
// })


// RECIPE PAGE
if (window.location.pathname.includes('recipe')) {

  // Add hidden recipe title to navbar
  const title = $("#recipe-title>h1").html();
  $("#navbar-recipe-title").html(`<h1>${title}</h1>`);

  // toggle hidden class on title and navbar title after enough upcscroll
  $(document).scroll(function() {
    var y = $(this).scrollTop();
    if (y > 500) {
      $('#navbar-recipe-title').removeClass("hidden");
    } else {
      $('#navbar-recipe-title').addClass("hidden");
    }
  });

  // reveal edit buttons when "edit this recipe" is clicked
  $(".edit-mode").click(function(e){
    // e.preventDefault();
    $(".edit-mode a").toggleClass("hidden");
    $(".editable:not(.comments-container)").toggleClass("hidden");
  });
}


