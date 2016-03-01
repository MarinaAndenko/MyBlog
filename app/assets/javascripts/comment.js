 jQuery(function($) 
 {
 	     $(document).on('ajax:success', 'form', function(e, data, status, xhr) {
        if ('comment' in data) {
            $("#comments-list").prepend(data.comment);
            $("#commentField").val("");
            $("#comments-count").html("Comments: "+$('#comments-list').children().size());
          }
       });

      $(document).on('ajax:success', '#delete-comment', function(e, data, status, xhr) {
        if('comment_del' in data){
          var parentOfDeleted = this.parentNode;
          parent2 = parentOfDeleted.parentNode;
          parent3 = parent2.parentNode;
          parent3.innerHTML = '';
          parent3.remove();
          $("#comments-count").html("Comments: "+$('#comments-list').children().size());
        }
      });

      $("#scroll").on("click","a", function (event) {
        event.preventDefault();
        var id  = $(this).attr('href'),
        top = $(id).offset().top;
        $('body,html').animate({scrollTop: top}, 1500);
      });
 });
