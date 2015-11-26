var airportInformation = function(id) {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/airports/' + id,
    dataType: 'json',
    success: function(response){
      var scroll = $('#search_bar')[0];
      nameParser(response);
      statsParser(response);
      delayindexParser(response);
      ontimeParser(response);
      $('#loaderImg').hide();
      scroll.scrollIntoView();
    }
  })
}



