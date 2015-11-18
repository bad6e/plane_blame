var ontimeParser = function(response) {
  var percent = response['airport_name'].on_time_percentage;
  var number  = response['airport_name'].number_of_flights
  var name    = response['airport_name'].airline_names
  var apName  = response['airport_name'].name
  var precentLength = percent.length;
  for (var i = 0; i < precentLength; i++) {
    if(percent[i] == null) {
      $("#airline-" + i +"").html("<div class='progB chart' data-percent=" + percent[i] + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent_two'></span></div></div></div><div class='textP'><h3>" + name[i] + "</h3><p>does not fly here!</p></div>");
      boom(percent[i])
    } else {
      $("#airline-" + i +"").html("<div class='progB chart' data-percent=" + percent[i] + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>" + name[i] + "</h3><p>" + number[i] + " Flights Measured</p></div>");
      boom(percent[i])
    }
  }
  $('#disclaimer').html("<h6>*Considered On Time if actual departure is 15 minutes or less from scheduled departure.</h6>")
}


