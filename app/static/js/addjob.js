$(function() {
    $('button').click(function() {
        var name = $('#txtNom').val();
        $.ajax({
            url: '/addNewJob',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
         console.log("foobar");
    });
});
