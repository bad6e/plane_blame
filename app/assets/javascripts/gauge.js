function gauge(score){
  var gg1 = new JustGage({
    id: "delay",
    value : score,
    min: 0,
    max: 5,
    decimals: 1,
    label: "Delay Index",
    relativeGaugeSize: true,
    gaugeWidthScale: 0.6,
    customSectors: [{
      color : "#33CC33",
      lo : 0,
      hi : 1.5
    },{
      color : "#FFFF00",
      lo : 1.51,
      hi : 3.5
    }, {
      color : "#CC3300",
      lo : 3.51,
      hi : 5
    }],
    counter: true
  });
}
