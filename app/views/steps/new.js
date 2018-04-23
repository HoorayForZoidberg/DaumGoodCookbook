// Display step addition menu when plus button is clicked
$(".new-step .new-step-form").removeClass("hidden");
$(".new-step a").addClass("hidden");

// Remove step-addition menu when cancel button is clicked
$(".cancel-step").click(function(e){
  e.preventDefault();
  $(".new-step .new-step-form").addClass("hidden");
  $(".new-step a").removeClass("hidden");
});

