    $("#myForm").submit(function(e) {
        e.preventDefault(); // prevents the form from submitting
        var comment = $("#commentField").val();

        $.ajax({
            type: "POST",
            url: "/posts", // assuming you follow RestFul API
            data: { comment: { body: comment } }, // param[:comment][:body]
            success: function() {
                // that means you have successfully posted your comment
                $("#commentField").val(""); // empty the comment field so that the user could post another comment
                $("#inform").html("Comment posted"); // inform the user about success
            }
        });
    });