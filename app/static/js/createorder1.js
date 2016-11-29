$(function() {
    $("button#submit").click(function() {
        console.log($('form').serialize())
        $.ajax({
            type: "POST",
            url: "/createordercontinue1",
            data: $('form').serialize(),
            success: function(msg) {
                window.location.href = "/createorder2/"
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