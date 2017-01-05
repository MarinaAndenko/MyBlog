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

      $(document).ready(function(){
        var preview = $(".image-field-ed img");
        $(".fileinput").change(function(event){
          var input = $(event.currentTarget);
          var file = input[0].files[0];
          var reader = new FileReader();
          reader.onload = function(e){
            image_base64 = e.target.result;
            preview.attr("src", image_base64);
          };
          reader.readAsDataURL(file);
        });
      });
 });
