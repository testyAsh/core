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
    html += '<a href="#" class="list-group-item">Client : '+ data["ClientId"] +'</a>'
    html += '<a href="#" class="list-group-item">Date de contact : '+ data["ContactDate"] +'</a>'
    html += '<a href="#" class="list-group-item">Date d\'execution : '+ data["ExecutionDate"] +'</a>'
    html += '<a href="#" class="list-group-item">Moyen de contact : '+ data["ContactWay"] +'</a>'
    html += '<a href="#" class="list-group-item">Service : '+ data["ServiceId"] +'</a>'
    html += '<a href="#" class="list-group-item">Ouvrier : '+ data["WorkerId"] +'</a>'
 
    document.getElementById("recap").innerHTML = html;
}