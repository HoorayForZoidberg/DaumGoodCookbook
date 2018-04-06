import "bootstrap";

// Navbar avatar dropwdown menu toggle
$(document).ready(function(){
  $( "#navbar-wagon-menu" ).click(function() {
    $('.dropdown-toggle').dropdown();
  });
})
