var airportInformation = function(id) {
  $.ajax({
    type: 'GET',
    url: 'https://localhost:3000/api/v1/total/' + id,
    dataType: 'json',
    success: function(response){
      nameParser(response)
      statsParser(response)
      delayindexParser(response)
      ontimeParser(response)
      $('#loaderImg').hide();
    }
  })
}
