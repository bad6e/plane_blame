var lateDepartures = function(id) {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/latedepartures/' + id,
    dataType: 'json',
    success: function(response){
      $('#airport_stats_3').append("<div class='col-md-4 project'><h3 id='counter2' style='margin-left: 20px;'>" + response + "</h3><h4 style='margin-left: 20px;'>Late Departures</h4></div>");
    }
  })
}