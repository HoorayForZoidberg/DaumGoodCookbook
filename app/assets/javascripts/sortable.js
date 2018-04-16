$(document).ready(function() {
    $(".sortable").sortable({disabled: true, handle: ".handle"});
});

// toggle sortable when edit button is clicked in recipe page
if ($("#recipe")) {
  $(".edit-mode").click(function(e){
    e.preventDefault();
    // get sortable status
    let disabled = $(".sortable").sortable( "option", "disabled" );
    if (disabled) {
      $(".sortable").sortable("enable");
    } else {
      $(".sortable").sortable("disable");
    }
  })
}
