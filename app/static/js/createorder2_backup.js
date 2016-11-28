$(document).ready(function() {
    fetchclients();
});

function fetchclients() {
    $.getJSON('/clients/get_clients', {
        }, function(data) {
            var i;
            clients = new Array();
            for (i=0;i<data.result.length;i++)
            {
                var client = new Array();
                client[0]=data.result[i].uid;
                client[1]=data.result[i].firstname;
                client[2]=data.result[i].lastname;
                client[3]=data.result[i].phonenumber;
                client[4]=data.result[i].preferredcontact;
                client[5]=data.result[i].address;
                client[6]=data.result[i].comments;
                clients[i]=client;
                console.log(client);
            }
            clients.sort();
            createclientList(clients);
    });
}

function createclientList(){
    var i;
    var html = '';
    for (i=0;i<clients.length;i++)
    {
        html += '<div class="form-check">'
        html += '<label class="form-check-label">'
        html += '<input type="radio" class="form-check-input" name="inputClient" id="optionsRadios'+ clients[i][0] +'" value="' + clients[i][0] + '" checked>'
        html += clients[i][1] + " " + clients[i][2]
        html += '</label>'
        html += '</div>'
    }
    document.getElementById("clientList").innerHTML = html;
}

$(function() {
    $("button#submit").click(function() {
        $.ajax({
            type: "POST",
            url: "/createordercontinue2",
            data: $('form').serialize(),
            success: function(msg) {
                window.location.href = "/createorder3/"
            },
            error: function() {
                alert("Erreur");
            }
        });
    });
});
