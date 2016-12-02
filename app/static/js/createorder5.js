$(document).ready(function() {
    fetchrecap();
});

function fetchrecap() {
    $.getJSON('/get_recap', {
        }, function(data) {
            console.log(data.result);
            createrecap(data.result);
    });
}

function createrecap(data){
    var i;
    var html = '';
    html += '<a href="#" class="list-group-item">Client : '+ data["Clientprenom"] + ' '+ data["clientnom"] +'</a>'
    html += '<a href="#" class="list-group-item">Téléphone client : '+ data["telclient"] +'</a>'
    html += '<a href="#" class="list-group-item">Adresse client : '+ data["Adressclient"] +'</a>'
    html += '<a href="#" class="list-group-item">Moyen de contact : '+ data["ContactWay"] +'</a>'
    html += '<a href="#" class="list-group-item">Service : '+ data["Service"] +'</a>'
    html += '<a href="#" class="list-group-item">Ouvrier : '+ data["Workerprenom"] + ' '+ data["Workernom"] +'</a>'
    html += '<a href="#" class="list-group-item">Téléphone ouvrier : '+ data["Workertel"] +'</a>'
    html += '<a href="#" class="list-group-item">Date de contact : '+ data["ContactDate"] +'</a>'
    html += '<a href="#" class="list-group-item">Date d\'execution : '+ data["ExecutionDate"] +'</a>'
   
    
 
    document.getElementById("recap").innerHTML = html;
}