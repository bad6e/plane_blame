$(document).ready(function(){
   $('#loaderImg').hide();

  $(function(){
      $('#select_origin').autocomplete({
        minLength: 1,
        source: 'https://planeblame.herokuapp.com/api/v1/search',
        focus: function(event, ui) {
          $('#select_origin').val(ui.item.name);
          return false;
        },
        select: function(event, ui) {
          $( "#loaderImg" ).fadeIn(700)
          $('#select_origin').val(ui.item.name);
          $('#link_origin_id').val(ui.item.id);
            airportInformation(ui.item.id);
        }
      })
      .data("uiAutocomplete")._renderItem = function(div, item){
        return $( "<div class='drop_airport activetrigger'></div>")
        .data( "item.autocomplete", item )
        .append(item.name)
        .appendTo( div );
      };
    });
});
