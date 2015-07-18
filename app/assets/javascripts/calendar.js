$(document).on('ready page:load', function(){

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        dayClick: function() {
          var moment = $('#calendar').fullCalendar('getDate');
          if (confirm("Create a new event for this day?")) {
            window.location = "events/new";
          }
        },
        events: '/events.json',
        eventClick: function(event) {
          window.location.href(event_path(event));
        }
    });

    $('#tabs').tabs({
      show: function (event, ui) {
        $('#calendar').fullCalendar('render');
      }
    });

});