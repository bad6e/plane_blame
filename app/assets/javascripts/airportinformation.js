var airportInformation = function(id) {
  $.ajax({
    type: 'GET',
    url: 'https://planeblame.herokuapp.com/api/v1/airports/' + id,
    dataType: 'json',
    success: function(response){
      var scroll = $('#search_bar')[0];
      $('#all_html').hide();
      nameParser(response);
      statsParser(response);
      delayindexParser(response);
      ontimeParser(response);
      $('#loaderImg').hide();
      $('#all_html').fadeIn(1000)
      scroll.scrollIntoView();
    }
  })
}



