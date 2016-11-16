$(document).ready(function (){
  $('.edit-icon').on('click', function() {
    if ($(this).parent().hasClass("edit-banner") || $(this).parent().hasClass("profile-picture")) {
      return
    } else {
      $(this).parent().addClass("hidden");
      $(this).parent().next().removeClass("hidden");
    }
  })
})
