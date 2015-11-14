var airportName = function(id) {
  debugger
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/airportname/' + id,
    dataType: 'json',
    success: function(response){
      $('#airport_name').prepend("<div class='col-md-12 cBusiness'><h3>" + response + "</h3></div>");
    }
  })
}