$(function() {
        $(document).on('click', 'input[type=submit]', function() {   
          if ($('input[type=text]').val() == '') {
            return false;
          }
        })


        $(document).on('ajax:success', 'form', function(e) {  
          $('#post_comment').val('');
          $('.post_wrapper').prepend('<p>' + e.detail[0] + '</p>');
        })
 });