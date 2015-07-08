$(document).on('ready page:load', function(){

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        dayClick: function() {
          var moment = $('#calendar').fullCalendar('getDate');
          if (confirm("Create a new event for this day?")) {
            window.location.replace("events/new");
          }
        },
        events: '/events.json',
        eventClick: function(event) {
          window.location.replace(event_path(event));
        }
    });

    $('#tabs').tabs({
      show: function (event, ui) {
        $('#calendar').fullCalendar('render');
      }
    });

});