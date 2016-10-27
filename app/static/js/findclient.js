$(function() {
    $('button').click(function() {
        var firstname = $('#txtNom').val();
        var lastname = $('#txtPrenom').val();
        $.ajax({
            url: '/Findclientrecord',
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
