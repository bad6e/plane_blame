$(document).ready(function(){
  $(function(){
      $('#select_origin').autocomplete({
        minLength: 1,
        source: 'http://localhost:3000/api/v1/search',
        focus: function(event, ui) {
          $('#select_origin').val(ui.item.name);
          return false;
        },
        select: function(event, ui) {
          $('#select_origin').val(ui.item.name);
          $('#link_origin_id').val(ui.item.id);

          totalDepartures(ui.item.id);
          ontimeDepartures(ui.item.id);
          lateDepartures(ui.item.id);
        }
      })
      .data("uiAutocomplete")._renderItem = function(div, item){
        return $( "<div></div>")
        .data( "item.autocomplete", item )
        .append( "<div class='drop_airport activetrigger'>" + item.name + "</div>" )
        .appendTo( div );
      };
    });
});



