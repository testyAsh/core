

var add = new Array();
var clientadd = new Array();

$(document).ready(function() {
    fetchworkers();
});

function fetchworkers() {
    $.getJSON('/workers/get_workers_specialised', {
        }, function(data) {
            var i;
            workers = new Array();
            for (i=0;i<data.result.length;i++)
            {
                var worker = new Array();
                worker[0]=data.result[i].uid;
                worker[1]=data.result[i].firstname;
                worker[2]=data.result[i].lastname;
                worker[3]=data.result[i].phonenumber;
                worker[4]=data.result[i].legalid;
                worker[5]=data.result[i].address;
                worker[6]=data.result[i].job;
                worker[7]=data.result[i].retrievalrule;
                worker[8]=data.result[i].comments;
                workers[i]=worker;
                console.log(worker)
            }
            workers.sort();
            add = workers;
            createworkerList(workers);
            fetchclient();
            // var r = fetchlient();
            // console.log(r);
    });
}

function fetchclient() {
    $.getJSON('/FindclientInfos', {
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
            clientadd = clients;
            console.log('clientadd='+ clientadd)
         
            
    });
}

function createworkerList(){
    var i;
    var html = '';
    for (i=0;i<workers.length;i++)
    {
        html += '<div class="form-check">'
        html += '<label class="form-check-label">'
        html += '<input type="radio" class="form-check-input" name="inputWorker" id="optionsRadios'+ workers[i][0] +'" value="' + workers[i][0] + '" checked>'
        html += workers[i][1] + " " + workers[i][2] 
        html += '</label>'
        html += '</div>'
    }
    document.getElementById("workerList").innerHTML = html;
}


    $("button#submit").click(function() {
        $.ajax({
            type: "POST",
            url: "/createordercontinue4",
            data: $('form').serialize(),
            success: function(msg) {

                console.log("add =" + add)

                window.location.href = "/createorder5/"
            },
            error: function() {
                alert("Erreur");
            }
        });
    });


$("button#cancel").click(function() {

        window.location.href = "/index"
        
});




      function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: 36.8617342, lng: 10.276935099999946}
        });

        
        var geocoder = new google.maps.Geocoder();

        // document.getElementById('submit1').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        // });
      }

      function geocodeAddress(geocoder, resultsMap) {

        var address = clientadd[0][5] ;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location,
              icon : 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
           
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
        for (i=0;i<add.length;i++) {
        var address = add[i][5] ;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
    }
      }
