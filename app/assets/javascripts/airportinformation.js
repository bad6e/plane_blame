var airportInformation = function(id) {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/total/' + id,
    dataType: 'json',
    success: function(response){
      $('#loaderImg').hide();
      $('#airport_name').html("<div class='col-md-12 cBusiness'><h3>" + response['airport_name'].name + "</h3></div>");
      $('#airport_stats_1').html("<div class='col-md-4 project'><h3 id='counter'>" + response['airport_name'].total_departures + "</h3><h4>Total Flights</h4></div>");
      $('#airport_stats_2').html("<div class='col-md-4 project'><h3 id='counter1'>" + response['airport_name'].on_time_departures + "</h3><h4>On Time Departures</h4><p> Last Updated at 3:33PM </p></div>");
      $('#airport_stats_3').html("<div class='col-md-4 project'><h3 id='counter2' style='margin-left: 20px;'>" + response['airport_name'].late_departures + "</h3><h4 style='margin-left: 20px;'>Late Departures</h4></div>");
      $('#delay_index').html("<div class='col-md-12 cBusiness'><h4><strong>Current Delay Index</strong></h4><div id='delay' class='gauge'></div></div>");
        gauge(response['airport_name'].delay_index);
    }
  })
}
