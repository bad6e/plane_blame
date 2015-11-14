var totalDepartures = function(id) {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/totaldepartures/' + id,
    dataType: 'json',
    success: function(response){
      $('#airport_stats_1').append("<div class='col-md-4 project'><h3 id='counter'>" + response + "</h3><h4>Total Flights</h4></div>");
    }
  })
}