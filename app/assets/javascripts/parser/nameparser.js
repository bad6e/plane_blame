var nameParser = function(response) {
  var airportName = response['airport_name'].name
  var dataLength  = response['airport_name'].day_length
  $('#airport_name').html("<h2>" + airportName + "</h2>");
  $('#airline_data_range').html("<h4>Based on " + dataLength + " days of flight data</strong></h4></div>");
}