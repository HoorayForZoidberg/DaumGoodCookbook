$(document).ready(function() {
  $(".sortable").sortable({
    disabled: true,
    handle: ".handle",
    update: function(e, ui) {
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });
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
