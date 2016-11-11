// $(document).ready(function() {
//     addnonexistingclients();
// });

function hideBoth()  
{  
   document.getElementById("cont1").style.visibility="hidden";  
   document.getElementById("cont2").style.visibility="hidden" ;   
}

// function addnonexistingclients() {
//     $.getJSON('/Findclientrecord', {
//          }, function(data) {
//             // res = parseInt(data.response);
//             var a = JSON.stringify({
//                 "uid": null,
//                 "firstname": null,
//                 "lastname": null,
//                           })
//             var b = JSON.stringify(data.response[0]);

//             return ( a == b);
//             });
// }



$(function() {
    $('button').click(function() {
        var firstname = $('#txtNom').val();
        var lastname = $('#txtPrenom').val();
        // var x = 1;
        // var a = JSON.stringify({
        //         "uid": null,
        //         "firstname": null,
        //         "lastname": null,
        //                   })
       $.ajax({
            url: '/Findclientrecord',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
              console.log(response);
            //   
             if (response.result.length != 0) {
                var i;
              for (i=0;i<response.result.length;i++)
            {
              console.log(response.result[i].firstname);
              console.log(response.result[i].lastname);
             }
             document.getElementById("cont1").style.visibility="visible";
             document.getElementById("cont2").style.visibility="hidden"; 
                
             }
             else {console.log('rien');
             document.getElementById("cont1").style.visibility="hidden";
             document.getElementById("cont2").style.visibility="visible"; }

            //     var i;
            // clients = new Array();
            // for (i=0;i<response.length;i++)
            // {
            //     var client = new Array();
            //     client[0]=response[i].uid;
            //     client[1]=response[i].firstname;
            //     client[2]=response[i].lastname;
                
            //     clients[i]=client;
            //     console.log(client)
            // }
            },
            error: function(error) {
                console.log(error);
            }
        });
       // $.getJSON('/Findclientrecord', {
       //  }, function(data) {
          
       //      var b = JSON.stringify(data.response[0]);
       //      console.log("fooooooooobar");
       //  });        
        // 
          
        // if(x == 1) {
        //             document.getElementById("cont1").style.visibility="visible";
        //             document.getElementById("cont2").style.visibility="hidden"; }
        // $.getJSON('/Findclientrecord', {
        //  }, function(data) {
        //     // res = parseInt(data.response);
        //     var a = JSON.stringify({
        //         "uid": null,
        //         "firstname": null,
        //         "lastname": null,
        //                   })
        //     var b = JSON.stringify(data.response[0]);
        //     console.log("fooooooooobar");
        //     // return ( a == b);
        //     });
         console.log("foobar");

    });
});
