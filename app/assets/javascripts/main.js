$(document).ready(function(){
  $('.revoke').click(function(e) {
    id = $(this).siblings("input").val();
    $.post('revoke/' + id, function(data) {
        $(this).parent("tr").fadeOut();
    });
  });
});
