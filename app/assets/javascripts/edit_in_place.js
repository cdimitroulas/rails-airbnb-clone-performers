$(document).ready(function (){

  //Form is shown when clicking on the pencil icons
  $('.edit-icon').on('click', function() {
    if ($(this).parent().hasClass("edit-banner") || $(this).parent().hasClass("profile-picture")) {
      $(this).next().removeClass("hidden");
    } else {
      $(this).parent().addClass("hidden");
      $(this).parent().next().removeClass("hidden");
    }
  })

  //Image upload button shown on banner when clicking anywhere on the banner
  $('.show-banner').on('click', function(){
    $('#banner-photo-upload').removeClass("hidden");
  })

  //Image upload button shown by profile picture when clicking anywhere on the picture
  $('.profile-picture').on('click', function(){
    $('#profile-picture-upload').removeClass("hidden");
  })

})
