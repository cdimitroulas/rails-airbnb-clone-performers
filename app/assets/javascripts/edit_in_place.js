$(document).ready(function (){
  $('.edit-icon').on('click', function() {
    $(this).parent().addClass("hidden")
    $(this).parent().next().removeClass("hidden")
  })
})
