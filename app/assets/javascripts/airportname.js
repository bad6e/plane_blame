var airportName = function(id) {
    $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/airportname/' + id,
    dataType: 'text',
    success: function(response){
      $('#airport_name').html("<div class='col-md-12 cBusiness'><h3>" + response + "</h3></div>");
    }
  })
}