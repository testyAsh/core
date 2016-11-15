$(document).ready(function() {
    fetchbookings();
});

function fetchbookings() {
    $.getJSON('/orders/get_orders', {
        }, function(data) {
            var i;
            orders = new Array();
            for (i=0;i<data.result.length;i++)
            {
                var order = new Array();
                order[0]=data.result[i].uid;
                order[1]=data.result[i].state;
                order[2]=data.result[i].clientid;
                order[3]=data.result[i].workerid;
                order[4]=data.result[i].contactthrough;
                order[5]=data.result[i].insertiondate;
                order[6]=data.result[i].executiondate;
                order[7]=data.result[i].clientpaidfees;
                order[8]=data.result[i].reportedpaidfees;
                order[9]=data.result[i].retrievalreceived;
                orders[i]=order;
                console.log(order);
            }
            orders.sort();
            createorderList(orders);
    });
}

function createorderList(){
    var i;
    var html = '';
    for (i=0;i<orders.length;i++)
    {
        html += '<tr>';
        html += '<td>';
        html += orders[i][0];
        html += '</td>';
        html += '<td>';
        html += orders[i][1];
        html += '</td>';
        html += '<td>';
        html += orders[i][2];
        html += '</td>';
        html += '<td>';
        html += orders[i][3];
        html += '</td>';
        html += '<td>';
        html += orders[i][4];
        html += '</td>';
        html += '<td>';
        html += orders[i][5];
        html += '</td>';
        html += '<td>';
        html += orders[i][6];
        html += '</td>';
        html += '<td>';
        html += orders[i][7];
        html += '</td>';
        html += '<td>';
        html += orders[i][8];
        html += '</td>';
        html += '<td>';
        html += orders[i][9];
        html += '</td>';
        html += '<td>';
    }
    document.getElementById("orderList").innerHTML = html;
}
