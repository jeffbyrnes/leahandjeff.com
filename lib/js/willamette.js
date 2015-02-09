// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation();

$(function() {
    // Yes attendance changes
    $("#group_188795003_1").change(function(event) {
        if (this.checked) {
            $("#rsvp__quantity .ss-required-asterisk").show();
            $("#rsvp__quantity input").attr("required", true);

            // Uncheck Bus Ride "no" answer
            $("#group_514371859_2").prop("checked", false);
        }
    });

    // No attendance changes (quantity & bus ride not required)
    $("#group_188795003_2").change(function(event) {
        if (this.checked) {
            $("#rsvp__quantity .ss-required-asterisk").hide();
            $("#rsvp__quantity input").attr("required", false);

            // Check Bus Ride "no" answer
            $("#group_514371859_2").prop("checked", true);
        }
    });
});
