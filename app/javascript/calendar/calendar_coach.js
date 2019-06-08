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

const displayCalendarCoach = () => {
  document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar-coach');

    const urlApi = '/api/v1/bookings';

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
      titleFormat: 'DD/MM',
      slotLabelFormat: genericTimeFormat,
      eventTimeFormat: genericTimeFormat,
      minTime: '08:00:00',
      maxTime: '20:00:00',
      firstDay: 1,
      header: {
        left: '',
        center: 'title',
        right: 'prev,next today,month,agendaWeek,agendaDay'
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
      // eventClick: function(info) {
      //   console.log('event clicked')
      //   console.log(event.currentTarget)
      //   console.log(info.el)
      //   info.el.remove();
      //   const destroyDispo = (event) => {
      //     const req = new XMLHttpRequest();
      //     req.open('DELETE', '/api/v1/bookings', false);
      //     req.send(null);
      //   }
    // },
    eventDragStart: function(){
      console.log('event drag start')
    },
    eventDragStop: function(){
      console.log('event drag stop')
    },

    eventClick: function(event, jsEvent, view) {
      const booking_id = event.event._def.extendedProps.booking_id;
      const client_id = event.event._def.extendedProps.client_id;
      const state = event.event._def.extendedProps.state;
      fetch(`/api/v1/bookings/${booking_id}`)
        .then(response => response.json())
        .then((data) => {
            var state = data.state;
            var start_time = data.start_time;
            var end_time = data.end_time;
            if (state === 'booked') {
              var client_firstname = data.client_firstname;
              var client_lastname = data.client_lastname;
              var title = `Entretien réservé`;
              var body = `avec : ${client_firstname} ${client_lastname}`;
            } else {
              var title = `Entretien proposé`;
              var body = ``;
            }
        $('#modalTitle').html(title);
        $('#modalBody').html(body);
        $('#eventUrl').attr('href',event.url);
        $('#calendarModal').modal();
        });
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
        url: urlApi,
      }
    });

    const renderCalendar = function(){
      calendar.render()
    }
    setTimeout(renderCalendar, 250);
  });
}

export { displayCalendarCoach };
