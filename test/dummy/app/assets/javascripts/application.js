$(document).ready(function(){
  $.ajaxSetup({
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
  });

  $('#logout').click(function(e) {
    logoutForm = $(this).parents("form");
    logoutForm.submit();
  });

  $('.revoke').click(function(e) {
    id = $(this).siblings("input").val();
    that = this;
    $.post('revoke/' + id, { _method: 'delete' }, function(data) {
      $(that).parents("tr").fadeOut();
    });
  });
});
