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
                successAlert = '<div class="alert alert-dismissable alert-success">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += 'le nouveau client a été ajouté avec succès';
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            },
            error: function(error) {
                console.log(error);
                successAlert = '<div class="alert alert-dismissable alert-danger">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += "l'ajout du nouveau client a échoué! Veuillez réessayer.";
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            }
        });
         console.log("foobar");
    });
});
