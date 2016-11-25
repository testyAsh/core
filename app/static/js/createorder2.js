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
        html += '<div class="form-check">'
        html += '<label class="form-check-label">'
        html += '<input type="radio" class="form-check-input" name="inputService" id="optionsRadios'+ jobs[i][0] +'" value="' + jobs[i][0] + '" checked>'
        html += jobs[i][1]
        html += '</label>'
        html += '</div>'
    }
    document.getElementById("jobList").innerHTML = html;
}

$(function() {
    $("button#submit").click(function() {
        $.ajax({
            type: "POST",
            url: "/createordercontinue2",
            data: $('form').serialize(),
            success: function(msg) {
                window.location.href = "/createorder3/"
            },
            error: function() {
                alert("Erreur");
            }
        });
    });
});
