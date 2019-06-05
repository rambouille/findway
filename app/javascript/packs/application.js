import "bootstrap";

import '@fullcalendar/core/main.css';
import '@fullcalendar/timegrid/main.css';

import { Calendar } from '@fullcalendar/core';
import timeGridPlugin from '@fullcalendar/timegrid';
import momentTimezonePlugin from '@fullcalendar/moment-timezone';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ timeGridPlugin, momentTimezonePlugin ],
    titleFormat: '{MMMM {D}}, YYYY',
    defaultView: 'timeGridWeek',
    timeZone: 'Europe/Paris',
    events: {
      url: 'http://localhost:3000/api/v1/bookings',
    }
    // events: [
    //   {
    //     title  : 'event1',
    //     start  : '2019-06-04'
    //   },
    //   {
    //     title  : 'event2',
    //     start  : '2019-06-04',
    //     end    : '2019-06-06'
    //   },
    //   {
    //     title  : 'event3',
    //     start  : '2019-06-08T12:30:00'
    //     allDay : false // will make the time show
    //   }
    // ]
  });

  calendar.render();
});
