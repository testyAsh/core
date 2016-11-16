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
                successAlert = '<div class="alert alert-dismissable alert-success">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += 'le nouvel ouvrier a été ajouté avec succès';
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            },
            error: function(error) {
                console.log(error);
                successAlert = '<div class="alert alert-dismissable alert-danger">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += "l'ajout du nouvel ouvrier a échoué! Veuillez réessayer.";
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            }
        });
         console.log("foobar");
    });
});
