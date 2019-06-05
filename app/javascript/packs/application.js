import "bootstrap";

import '@fullcalendar/core/main.css';
import '@fullcalendar/timegrid/main.css';

import { Calendar } from '@fullcalendar/core';
import timeGridPlugin from '@fullcalendar/timegrid';

import frLocale from '@fullcalendar/core/locales/fr';
import momentPlugin from '@fullcalendar/moment';
import momentTimezonePlugin from '@fullcalendar/moment-timezone';
import interactionPlugin from '@fullcalendar/interaction';

// import moment from 'moment/moment';
// import momentTimezone from 'moment-timezone/moment-timezone';


document.addEventListener('DOMContentLoaded', function() {
  const calendarEl = document.getElementById('calendar');
  const genericTimeFormat = {
    hour: '2-digit',
    minute: '2-digit',
    'hour12': false
  }

  const calendar = new Calendar(calendarEl, {
    plugins: [
      timeGridPlugin,
      momentPlugin,
      momentTimezonePlugin,
      interactionPlugin
    ],
    titleFormat: 'YYYY-MM-DD',
    slotLabelFormat: genericTimeFormat,
    eventTimeFormat: genericTimeFormat,
    header: {
      left: 'prev,next today',
      center: 'title',
      // right: 'month,agendaWeek,agendaDay'
    },
    eventRender: function() {
      console.log('rendered')
    },
    eventPositioned: function() {
      console.log('positionned')
    },
    dateClick: function(){
      console.log('date clicked')
    },
    eventClick: function(){
      console.log('event clicked')
      console.log(event.currentTarget)
    },
    eventDragStart: function(){
      console.log('event drag start')
    },
    eventDragStop: function(){
      console.log('event drag stop')
    },
    eventDrop: function(){
      console.log('event drop')
      // call ajax?
    },
    selectable: true,
    editable: true,
    locale: 'fr',
    timeZone: 'Europe/Paris',
    timeFormat: 'H(:mm)',
    defaultView: 'timeGridWeek',
    events: {
      url: 'http://localhost:3000/api/v1/bookings',
    }
  });

  const renderCalendar = function(){
    calendar.render()
  }
  setTimeout(renderCalendar, 250);
});
