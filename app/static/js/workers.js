$(document).ready(function() {
    fetchworkers();
});

function fetchworkers() {
    $.getJSON('/workers/get_workers', {
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
            createworkerList(workers);
    });
}

function createworkerList(){
    var i;
    var html = '';
    for (i=0;i<workers.length;i++)
    {
        html += '<tr>';
        html += '<td>';
        html += workers[i][0];
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
        html += '<td>';
        html += workers[i][8];
        html += '</td>';
        html += '<td>';
    }
    document.getElementById("workerList").innerHTML = html;
}

$(function() {
    $('button').click(function() {
        var name = $('#txtNom').val();
        var lastname = $('#txtPrenom').val();
        var phonenumber = $('#txtNumero').val();
        var legalid = $('#txtCIN').val();
        var address = $('#txtAddresse').val();
        var retrievalrule = $('#txtRecouvrement').val();
        var comments = $('#txtCommentaires').val();
        $.ajax({
            url: '/addNewWorker',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
});
