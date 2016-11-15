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
                successAlert += 'Ajout du nouveau metier reussi.';
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            },
            error: function(error) {
                console.log(error);
                successAlert = '<div class="alert alert-dismissable alert-danger">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += "Eched d'ajout du nouveau metier.";
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;
            }
        });
         console.log("foobar");
    });
});
