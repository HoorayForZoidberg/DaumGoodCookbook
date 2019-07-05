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
if (window.location.pathname.includes('recipes/')) {

  // Add hidden recipe title to navbar
  let title = $("#recipe-title h1").html();
  $("#navbar-title").html(`<h1>${title}</h1>`);
  $('#navbar-title').hide();

  // toggle hidden class on title and navbar title after enough upcscroll
  $(document).scroll(function() {
    var y = $(this).scrollTop();
    if (y > 500) {
      $('#navbar-title').show();
    } else {
      $('#navbar-title').hide();
    }
  });

  // reveal edit buttons when "edit this recipe" is clicked
  $(".edit-mode").click(function(e){
    // e.preventDefault();
    $(".edit-mode a").toggleClass("hidden");
    $(".editable:not(.comments-container)").toggleClass("hidden");
  });

  //initialize cloudinary Blueimp file upload library
  $(function() {
    if($.fn.cloudinary_fileupload !== undefined) {
      $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
    }
  });
}

// PWA-rails initialize
import ProgressiveWebApp from 'pwa-rails';
document.addEventListener( 'turbolinks:load', () => {
    const progressiveWebApp = new ProgressiveWebApp();
})


