$(function() {
    $('button').click(function() {
        var name = $('#txtNom').val();
        var lastname = $('#txtPrenom').val();
        var phonenumber = $('#txtNumero').val();
        var legalid = $('#txtCIN').val();
        var address = $('#txtAddresse').val();
        var retrievalrule = $('#txtRecouvrement').val();
        var comments = $('#txtCommentaires').val();
        $.ajax({
            url: '/addNewWorker',
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
