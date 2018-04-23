// gives sortable properties to an element based on class
function sortable(selector, enabled=false) {
  $(selector).sortable({
    disabled: !enabled,
    handle: ".handle",
    update: function(e, ui) {
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });
};

// call sortable on dom load
$(sortable(".sortable"));


// toggle sortable when edit link is clicked in recipe page
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
