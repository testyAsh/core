$(document).ready(function() {
    fetchworkersjobs();
});

function fetchworkersjobs() {
    $.getJSON('/workerJobs/get_workerJobs', {
        }, function(data) {
            var i;
            workerjobs = new Array();
            for (i=0;i<data.result.length;i++)
            {
                var workerjob = new Array();
                workerjob[0]=data.result[i].id;
                workerjob[1]=data.result[i].Job_id;
                workerjob[2]=data.result[i].Worker_id;
                workerjobs[i]=job;
            }
            workerjobs.sort();
            createworkerjobList(workersJobs);
    });
}

function createworkerjobList(){
    var i;
    var html = '';
    for (i=0;i<workersJobs.length;i++)
    {
        html += '<tr>';
        html += '<td>';
        html += workersJobs[i][0];
        html += '</td>';
        html += '<td>';
        html += workersJobs[i][1];
        html += '</td>';
        html += '</tr>';
        html += workersJobs[i][2];
        html += '</td>';
        html += '</tr>';
    }
    document.getElementById("workerjobList").innerHTML = html;
}