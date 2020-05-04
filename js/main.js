
// ********************************************************************************
/*! \brief  jQuery - Einstellungen fuer den Slider
 ******************************************************************************** */

$(window).load(function() {
    
    $("#slider").responsiveSlides({
        auto:       false,
        speed:      500,
        timeout:    4000,
        pager:      false,
        nav:        true,
        random:     false,
        pause:      false,
        pauseControls:  false,
        namespace:  "callbacks",

        before: function () {
            $('.events').append("<li>before event fired.</li>");
        },
        after: function () {
            $('.events').append("<li>after event fired.</li>");
        }
    });

});
