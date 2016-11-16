$(document).ready(function() {
    fetchjobs();
});

function fetchjobs() {
    $.getJSON('/jobs/get_jobs', {
        }, function(data) {
            var i;
            jobs = new Array();
            for (i=0;i<data.result.length;i++)
            {
                var job = new Array();
                job[0]=data.result[i].uid;
                job[1]=data.result[i].name;
                jobs[i]=job;
            }
            jobs.sort();
            createjobList(jobs);
    });
}

function createjobList(){
    var i;
    var html = '';
    for (i=0;i<jobs.length;i++)
    {
        html += '<tr>';
        html += '<td>';
        html += jobs[i][0];
        html += '</td>';
        html += '<td>';
        html += jobs[i][1];
        html += '</td>';
    }
    document.getElementById("jobList").innerHTML = html;
}