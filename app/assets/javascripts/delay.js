function fetchDelays(id){
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/delays/' + id,
    dataType: 'json',
    success: function(response){
      $('#loaderImg').hide();
      $('#delay_index').html("<div class='col-md-12 cBusiness'><h4><strong>Current Delay Index</strong></h4><div id='delay' class='gauge'></div></div>")
      gauge(response)
    }
  })
}

function gauge(score){
  var gg1 = new JustGage({
    id: "delay",
    value : score,
    min: 0,
    max: 4,
    decimals: 1,
    gaugeWidthScale: 0.6,
    customSectors: [{
      color : "#33CC33",
      lo : 0,
      hi : 1.5
    },{
      color : "#FFFF00",
      lo : 1.51,
      hi : 3
    }, {
      color : "#CC3300",
      lo : 3,
      hi : 4
    }],
    counter: true
  });
}

