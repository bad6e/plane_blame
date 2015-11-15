var airportInformation = function(id) {
  $.ajax({
    type: 'GET',
    url: 'https://planeblame.herokuapp.com/api/v1/total/' + id,
    dataType: 'json',
    success: function(response){
      var percentSW  = response['airport_name'].sw_on_time_percentage
      var percentUA  = response['airport_name'].ua_on_time_percentage
      var percentFR  = response['airport_name'].frontier_on_time_percentage
      var percentDE  = response['airport_name'].delta_on_time_percentage
      var percentAA  = response['airport_name'].american_on_time_percentage
      var percentJB  = response['airport_name'].jetblue_on_time_percentage
      var percentSP  = response['airport_name'].spirit_on_time_percentage
      var percentVI  = response['airport_name'].virgin_on_time_percentage

      var numberSW  = response['airport_name'].sw_number_flights
      var numberUA  = response['airport_name'].ua_number_flights
      var numberFR  = response['airport_name'].frontier_number_flights
      var numberDE  = response['airport_name'].delta_number_flights
      var numberAA  = response['airport_name'].american_number_flights
      var numberJB  = response['airport_name'].jetblue_number_flights
      var numberSP  = response['airport_name'].spirit_number_flights
      var numberVI  = response['airport_name'].virgin_number_flights

      $('#loaderImg').hide();
      $('#airport_name').html("<div class='col-md-12 cBusiness'><h3>" + response['airport_name'].name + "</h3></div>");
      $('#airport_stats_1').html("<div class='col-md-4 project'><h3 id='counter'>" + response['airport_name'].total_departures + "</h3><h4>Total Flights</h4></div>");
      $('#airport_stats_2').html("<div class='col-md-4 project'><h3 id='counter1'>" + response['airport_name'].on_time_departures + "</h3><h4>On Time Departures</h4><p> Last Updated at 3:33PM </p></div>");
      $('#airport_stats_3').html("<div class='col-md-4 project'><h3 id='counter2' style='margin-left: 20px;'>" + response['airport_name'].late_departures + "</h3><h4 style='margin-left: 20px;'>Late Departures</h4></div>");
      $('#delay_index').html("<div class='col-md-12 cBusiness'><h4><strong>Current Delay Index</strong></h4><div id='delay' class='gauge'></div></div>");
        gauge(response['airport_name'].delay_index);
      $('#airline_stats_title').html("<div class='row'><div class='col-md-12 cBusiness'><h4><strong>Percentage of On-Time Departures for each Major Airline.</strong></h4></div></div>");

      $('#southwest').html("<div class='progB chart' data-percent=" + percentSW + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>Southwest</h3><p>" + numberSW + " Flights Measured</p></div>");
      boom(percentSW);

      $('#united').html("<div class='progB chart' data-percent=" + percentUA + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>United</h3><p>" + numberUA + " Flights Measured</p></div>");
      boom(percentUA);

      $('#frontier').html("<div class='progB chart' data-percent=" + percentFR + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>Frontier</h3><p>" + numberFR + " Flights Measured</p></div>");
      boom(percentFR);

      $('#delta').html("<div class='progB chart' data-percent=" + percentDE + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>Delta</h3><p>" + numberDE + " Flights Measured</p></div>");
      boom(percentDE);

      $('#american').html("<div class='progB chart' data-percent=" + percentAA + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>American</h3><p>" + numberAA + " Flights Measured</p></div>");
      boom(percentAA);

      $('#jetblue').html("<div class='progB chart' data-percent=" + percentJB + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>JetBlue</h3><p>" + numberJB + " Flights Measured</p></div>");
      boom(percentJB);

      $('#spirit').html("<div class='progB chart' data-percent=" + percentSP + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>Spirit</h3><p>" + numberSP + " Flights Measured</p></div>");
      boom(percentSP);

      $('#virgin').html("<div class='progB chart' data-percent=" + percentVI + " data-animate='3500'><div class='chart chart-content'><div class='percentage' data-percent=''><span class='percent'></span></div></div></div><div class='textP'><h3>Virgin</h3><p>" + numberVI + " Flights Measured</p></div>");
      boom(percentVI);

      $('#disclaimer').html("<h6>*Considered On Time if actual departure is 15 minutes or less from scheduled departure.</h6>")
    }
  })
}
