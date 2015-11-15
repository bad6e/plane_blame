var nameParser = function(response) {
  var airportName = response['airport_name'].name
  $('#airport_name').html("<h3>" + airportName + "</h3>");
}