$(function() {
    $('button').click(function() {
        var lastname = $('#txtNom').val();
        var firstname = $('#txtPrenom').val();
        var phonenumber = $('#txtNumero').val();
        var preferredcontact = $('#txtContactVia').val();
        var address = $('#txtAddresse').val();
        var comments = $('#txtCommentaires').val();
        $.ajax({
            url: '/addNewClient',
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