

$(document).ready(function() {
    fetchclients();
});


function fetchclients() {
    $.getJSON('/Findclientrecord', {
        }, function(data) {
            if (data.result.length != 0) {
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
        }

        else {
    
            document.getElementById("submit").style.visibility="hidden"
            document.getElementById("submit1").style.visibility="visible"
            successAlert = '<div class="alert alert-dismissable alert-danger">';
                successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                successAlert += 'Client introuvable, veuillez le rajouter;';
                successAlert += '</div>';
                document.getElementById("alert-div").innerHTML = successAlert;

                
        }
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

    $("button#submit").click(function() {
        $.ajax({
            type: "POST",
            url: "/createordercontinue2",
            data: $("form").serialize(),
            success: function(msg) {
                window.location.href = "/createorder3/"
            },
            error: function() {
                alert("Erreur");
            }
        });
    });


$("button#submit1").click(function() {

        window.location.href = "/addClient"
        
    });

$("button#cancel").click(function() {

        window.location.href = "/index"
        
});
