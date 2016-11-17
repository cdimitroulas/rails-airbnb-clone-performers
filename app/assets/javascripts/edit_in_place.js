$(document).ready(function (){
  $('.edit-icon').on('click', function() {
    if ($(this).parent().hasClass("edit-banner") || $(this).parent().hasClass("profile-picture")) {
      $(this).next().removeClass("hidden");
    } else {
      $(this).parent().addClass("hidden");
      $(this).parent().next().removeClass("hidden");
    }
  })
  $('.show-banner').on('click', function(){
    $('#banner-photo-upload').removeClass("hidden")
  })
  $('.profile-picture').on('click', function(){
    $('#profile-picture-upload').removeClass("hidden")
  })
})
