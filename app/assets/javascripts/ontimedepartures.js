var ontimeDepartures = function(id) {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/ontimedepartures/' + id,
    dataType: 'json',
    success: function(response){
      $('#airport_stats_2').html("<div class='col-md-4 project'><h3 id='counter1'>" + response + "</h3><h4>On Time Departures</h4><p> Last Updated at 3:33PM </p></div>");
    }
  })
}