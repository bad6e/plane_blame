var delayindexParser = function(response) {
  var airportName = response['airport_name'].name
  var delayIndex  = response['airport_name'].delay_index
  $('#delay_index').html("<div class='col-md-12 cBusiness'><h4><strong>Current Delay Index at " + airportName + "</strong></h4><div id='delay' class='gauge'></div></div>");
  gauge(delayIndex);
  $('#delay_key').html("<p>0 = No Delays 5 = You better bring a good book!</p>");
  $('#delay_warn').html("**** THIS HAS BEEN DISABLED BECAUSE FLIGHT STATS API EVALUATION TRIAL ENDED ****");
  $('#airline_title').html("<h4><strong>Percentage of On-Time Departures for each Major Airline.</strong></h4>");
}
