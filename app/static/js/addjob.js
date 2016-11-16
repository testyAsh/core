$(function() {
    $('button').click(function() {
        var name = $('#txtNom').val();
        $.ajax({
            url: '/addNewJob',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
                console.log(response);
                successAlert = '<div class="alert alert-dismissable alert-success">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += 'le nouveau métier a été ajouté avec succès';
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            },
            error: function(error) {
                console.log(error);
                successAlert = '<div class="alert alert-dismissable alert-danger">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += "l'ajout du nouveau métier a échoué! Veuillez réessayer.";
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            }
        });
         console.log("foobar");
    });
});
