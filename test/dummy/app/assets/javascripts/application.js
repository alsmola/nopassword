$(document).ready(function(){
  $('#logout').click(function(e) {
    logoutForm = $(this).parents("form");
    logoutForm.submit();
  });

  $('.revoke').click(function(e) {
    id = $(this).siblings("input").val();
    that = this;
    $.post('revoke/' + id, function(data) {
      $(that).parents("tr").fadeOut();
    });
  });
});
