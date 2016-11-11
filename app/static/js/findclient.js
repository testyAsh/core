$(document).ready(function() {
    addnonexistingclients();
});

function hideBoth()  
{  
   document.getElementById("cont1").style.visibility="hidden";  
   document.getElementById("cont2").style.visibility="hidden" ;   
}

function addnonexistingclients() {
    $.getJSON('/Findclientrecord', {
         }, function(data) {
            // res = parseInt(data.result);
            var a = JSON.stringify({
                "uid": null,
                "firstname": null,
                "lastname": null,
                          })
            var b = JSON.stringify(data.result[0]);

            return ( a == b);
            });
}

    //         var i;
    //         clients = new Array();
    //         for (i=0;i<data.result.length;i++)
    //         {
    //             var client = new Array();
    //             client[0]=data.result[i].uid;
    //             client[1]=data.result[i].firstname;
    //             client[2]=data.result[i].lastname;
    //             client[3]=data.result[i].phonenumber;
    //             client[4]=data.result[i].preferredcontact;
    //             client[5]=data.result[i].address;
    //             client[6]=data.result[i].comments;
    //             clients[i]=client;
    //             console.log(client)
    //         }
    //         clients.sort();
    //         createclientList(clients);


$(function() {
    $('button').click(function() {
        var firstname = $('#txtNom').val();
        var lastname = $('#txtPrenom').val();
        var a = JSON.stringify({
                "uid": null,
                "firstname": null,
                "lastname": null,
                          })
        var x = 1;

 $.getJSON('/Findclientrecord', {
          firstname,
          lastname,
        }, function(data) {
          
            var b = JSON.stringify(data.result[0]);
            console.log("fooooooooobar");
        });        
        // $.ajax({
        //     url: '/Findclientrecord',
        //     data: $('form').serialize(),
        //     type: 'POST',
        //     // success: function(response) {
        //     //     console.log(response);
        //     // },
        //     // error: function(error) {
        //     //     console.log(error);
        //     // }
        // });
          
        // if(x == 1) {
        //             document.getElementById("cont1").style.visibility="visible";
        //             document.getElementById("cont2").style.visibility="hidden"; }
        // $.getJSON('/Findclientrecord', {
        //  }, function(data) {
        //     // res = parseInt(data.result);
        //     var a = JSON.stringify({
        //         "uid": null,
        //         "firstname": null,
        //         "lastname": null,
        //                   })
        //     var b = JSON.stringify(data.result[0]);
        //     console.log("fooooooooobar");
        //     // return ( a == b);
        //     });
         console.log("foobar");

    });
});
