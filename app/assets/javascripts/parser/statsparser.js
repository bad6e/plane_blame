var statsParser = function(response) {
  var totalDepartures  = response['airport_name'].total_departures
  var ontimeDepartures = response['airport_name'].on_time_departures
  var lateDepartures   = response['airport_name'].late_departures
  var lastUpdate       = response['airport_name'].last_updated

  $('#airport_stats_1').html("<h3 id='counter'>" + totalDepartures + "</h3><h4>Total Flights</h4>");
  $('#airport_stats_2').html("<h3 id='counter1'>" + ontimeDepartures + "</h3><h4>On Time Departures</h4><p> Last Updated at " + lastUpdate + "</p>");
  $('#airport_stats_3').html("<h3 id='counter2' style='margin-left: 20px;'>" + lateDepartures + "</h3><h4 style='margin-left: 20px;'>Late Departures</h4>");
}


