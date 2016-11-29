$(function() {
    $("button#submit").click(function() {
        console.log($('form').serialize())
        $.ajax({
            type: "POST",
            url: "/createordercontinue",
            data: $('form').serialize(),
            success: function(msg) {
                window.location.href = "/createorder1/"
            },
            error: function() {
                alert("Erreur");
            }
        });
    });
});

$("button#cancel").click(function() {

        window.location.href = "/index"
        
});