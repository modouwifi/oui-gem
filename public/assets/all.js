$(document).ready(function() {
  $(".js-float-label-wrapper").FloatLabel();

  $(".js-float-option-wrapper").FloatSelect();

  $(document).on("keypress", function(e) {
    if(e.keyCode == 13) {
      e.preventDefault();
    }
  });

  $("input, select").focus(function() {
    $(this).parent(".js-float-label-wrapper ,js-float-option-wrapper").removeClass("error");
  });
});
