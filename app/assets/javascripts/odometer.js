$( document ).ready( function() {
    $.ajax({
      type: 'GET',
      url: 'http://localhost:3000/api/v1/total/1',
      dataType: 'json',
      success: function(response){
        setTimeout(function(){
          $('.odometer1').children().html(response['airport_name'].total_departures);
        }, 1);
        setTimeout(function(){
          $('.odometer2').children().html(response['airport_name'].total_departures);
        }, 1);
        setTimeout(function(){
          $('.odometer3').children().html(response['airport_name'].total_departures);
        }, 1);
      }
    })

})
