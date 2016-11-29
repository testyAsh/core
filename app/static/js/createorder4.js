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
            createworkerList(workers);
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