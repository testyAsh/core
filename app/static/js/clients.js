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
                console.log(client)
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
        html += '<tr>';
        html += '<td>';
        html += clients[i][0];
        html += '</td>';
        html += '<td>';
        html += clients[i][1];
        html += '</td>';
        html += '<td>';
        html += clients[i][2];
        html += '</td>';
        html += '<td>';
        html += clients[i][3];
        html += '</td>';
        html += '<td>';
        html += clients[i][4];
        html += '</td>';
        html += '<td>';
        html += clients[i][5];
        html += '</td>';
        html += '<td>';
        html += clients[i][6];
        html += '</td>';
        html += '<td>';
    }
    document.getElementById("clientList").innerHTML = html;
}
