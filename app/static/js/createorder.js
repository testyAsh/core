$(function() {
    $('button').click(function() {

// var selectElmt = document.getElementById("choix");
// var valeurselectionnee = selectElmt.options[selectElmt.selectedIndex].value;
// var textselectionne = selectElmt.options[selectElmt.selectedIndex].text;
$.ajax({
            url: '/addNewOrder',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
                console.log(response);
                if (response.result.length != 0) {
        
             document.getElementById("tab").style.visibility="visible"; 
             var i;
            workers = new Array();
            for (i=0;i<response.result.length;i++)
            {
                var worker = new Array();
                worker[0]=response.result[i].uid;
                worker[1]=response.result[i].firstname;
                worker[2]=response.result[i].lastname;
                worker[3]=response.result[i].phonenumber;
                worker[4]=response.result[i].legalid;
                worker[5]=response.result[i].address;
                worker[6]=response.result[i].retrievalrule;
                worker[7]=response.result[i].comments;
                workers[i]=worker;
                console.log(worker);
            }
            workers.sort();
            createworkerList(workers);
                
             }
                // successAlert = '<div class="alert alert-dismissable alert-success">';
                // successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                // successAlert += 'le nouvel ouvrier a été ajouté avec succès';
                // successAlert += '</div>';
                // document.getElementById("alert-div").innerHTML = successAlert;
            },
            error: function(error) {
                console.log(error);
                // successAlert = '<div class="alert alert-dismissable alert-danger">';
                // successAlert += '<button type="button" class="close" data-dismiss="alert">×</button>';
                // successAlert += "l'ajout du nouvel ouvrier a échoué! Veuillez réessayer.";
                // successAlert += '</div>';
                // document.getElementById("alert-div").innerHTML = successAlert;
            }
        });



});
});

function createworkerList(){
    var i;
    var html = '';
    for (i=0;i<workers.length;i++)
    {
        html += '<tr>';
        html += '<td>';
        html += '<a href="/CreateOrder">'
        html += workers[i][0];
        html += '</a>'
        html += '</td>';
        html += '<td>';
        html += workers[i][1];
        html += '</td>';
        html += '<td>';
        html += workers[i][2];
        html += '</td>';
        html += '<td>';
        html += workers[i][3];
        html += '</td>';
        html += '<td>';
        html += workers[i][4];
        html += '</td>';
        html += '<td>';
        html += workers[i][5];
        html += '</td>';
        html += '<td>';
        html += workers[i][6];
        html += '</td>';
        html += '<td>';
        html += workers[i][7];
        html += '</td>';
    }
    document.getElementById("workerList").innerHTML = html;
}
