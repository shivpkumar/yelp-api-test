$(document).ready(function() {
  $('form').on('submit', function(e) {
    e.preventDefault();
    formData = $(this).serialize();

    $.ajax({
      type: 'post',
      url: '/',
      data: formData
    }).done(function(response) {
      $('#all-listings').html(response);
    });
  });
});
