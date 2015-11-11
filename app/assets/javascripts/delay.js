window.onload = function () {
  var gg1 = new JustGage({
    id: "delay",
    value : 3.5,
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
};

