$( document ).ready( function() {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/departures',
    dataType: 'json',
    success: function(response){
      setTimeout(function(){
        $('.odometer1').children().html(response['total_flights'].total);
      }, 1);
      setTimeout(function(){
        $('.odometer2').children().html(response['total_flights'].on_time_departures);
      }, 1);
      setTimeout(function(){
        $('.odometer3').children().html(response['total_flights'].late_departures);
      }, 1);
    }
  })
})
