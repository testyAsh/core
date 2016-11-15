

function hideBoth()  
{  
   // document.getElementById("cont1").style.visibility="hidden";  
   document.getElementById("cont2").style.visibility="hidden" ;   
}




$(function() {
    $('button').click(function() {
        var firstname = $('#txtNom').val();
        var lastname = $('#txtPrenom').val();
        
       $.ajax({
            url: '/Findclientrecord',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
              console.log(response);
            //   
             if (response.result.length != 0) {
            //     var i;
            //   for (i=0;i<response.result.length;i++)
            // {
            //   console.log(response.result[i].firstname);
            //   console.log(response.result[i].lastname);
            //  }

             // document.getElementById("cont1").style.visibility="visible";
             document.getElementById("cont2").style.visibility="hidden"; 
             document.getElementById("tab").style.visibility="visible"; 
             var i;
            clients = new Array();
            for (i=0;i<response.result.length;i++)
            {
                var client = new Array();
                client[0]=response.result[i].uid;
                client[1]=response.result[i].firstname;
                client[2]=response.result[i].lastname;
                client[3]=response.result[i].phonenumber;
                client[4]=response.result[i].preferredcontact;
                client[5]=response.result[i].address;
                client[6]=response.result[i].comments;
                clients[i]=client;
                console.log(client);
            }
            clients.sort();
            createclientList(clients);
                
             }
             else {console.log('rien');
             // document.getElementById("cont1").style.visibility="hidden";
             document.getElementById("cont2").style.visibility="visible"; }

            
            },
            error: function(error) {
                console.log(error);
            }
        });
       
         console.log("foobar");

    });
});

// $(function() {
//     $('#button1').click(function() {

//         console.log('button pressed');
//         document.getElementById("tab").style.visibility="visible";
//     $.getJSON('/Findclientrecord', {
//         }, function(data) {
//             var i;
//             clients = new Array();
//             for (i=0;i<data.result.length;i++)
//             {
//                 var client = new Array();
//                 client[0]=data.result[i].uid;
//                 client[1]=data.result[i].firstname;
//                 client[2]=data.result[i].lastname;
//                 client[3]=data.result[i].phonenumber;
//                 client[4]=data.result[i].preferredcontact;
//                 client[5]=data.result[i].address;
//                 client[6]=data.result[i].comments;
//                 clients[i]=client;
//                 console.log(client);
//             }
//             clients.sort();
//             createclientList(clients);
//     });



//     });
// });

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
document.getElementById("cont2").onclick = function () {
        location.href = '/addClient';
    };