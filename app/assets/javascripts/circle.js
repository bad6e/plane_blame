var boom = function(percent) {
    var chart = $('.chart'),
        chartNr = $('.chart-content'),
        chartParent = chart.parent(),
        colorRotation =  function(percent) {
                          percent /= 100;
                          return "rgb(" + Math.round(255 * (1-percent)) + ", " + Math.round(255 * percent) + ", 0)";
                          };

    function centerChartsNr() {
        chartNr.css({
            top: (chart.height() - chartNr.outerHeight()) / 2
        });
    }

    if (chart.length) {
        centerChartsNr();
        $(window).resize(centerChartsNr);

        chartParent.each(function () {

            $(this).onScreen({

                doIn: function () {
                    $(this).find('.chart').easyPieChart({
                      animate: 1000,
            lineWidth: 3,
            barColor: colorRotation,
            trackColor:'#dcdcdc',
            lineCap:false,
            lineWidth:'3',
            size:'72',
            scaleColor:false,

            scaleColor:false,
                        animate: 2000,
                        onStep: function (from, to, percent) {
                            $(this.el).find('.percent').text(Math.round(percent));
                        }
                    });
                },
            });
        });
    }
};




