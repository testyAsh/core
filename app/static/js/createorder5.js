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
    html += '<a href="#" class="list-group-item list-group-item-info">Client</a>'
    html += '<a href="#" class="list-group-item">Nom : '+ data["Clientprenom"] + ' '+ data["clientnom"] +'</a>'
    html += '<a href="#" class="list-group-item">Téléphone : '+ data["telclient"] +'</a>'
    html += '<a href="#" class="list-group-item">Adresse : '+ data["Adressclient"] +'</a>'
    html += '<a href="#" class="list-group-item">Moyen de contact : '+ data["ContactWay"] +'</a>'
    html += '<a href="#" class="list-group-item list-group-item-success">Service</a>'
    html += '<a href="#" class="list-group-item">Type : '+ data["Service"] +'</a>'
    html += '<a href="#" class="list-group-item">Date de contact : '+ data["ContactDate"] +'</a>'
    html += '<a href="#" class="list-group-item">Date d\'execution : '+ data["ExecutionDate"] +'</a>'
    html += '<a href="#" class="list-group-item list-group-item-warning">Ouvrier</a>'
    html += '<a href="#" class="list-group-item">Nom : '+ data["Workerprenom"] + ' '+ data["Workernom"] +'</a>'
    html += '<a href="#" class="list-group-item">Téléphone : '+ data["Workertel"] +'</a>'
   
    
 
    document.getElementById("recap").innerHTML = html;
}