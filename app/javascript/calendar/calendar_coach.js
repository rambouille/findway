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
      height: 500,
      allDaySlot: false,
      eventDurationEditable: false,
      eventStartEditable: false,
      titleFormat: 'DD/MM',
      slotLabelFormat: genericTimeFormat,
      eventTimeFormat: genericTimeFormat,
      minTime: '8:00:00',
      maxTime: '19:00:00',
      slotDuration: '02:00:00',
      firstDay: 1,
      eventColor: '#F64C72',
      eventBackgroundColor: '#F64C72',
      header: false,
      footer: {
        left: '',
        center: 'prev,next',
        right: ''
      },
      eventRender: function() {
        console.log('rendered')
      },
      eventPositioned: function() {
        console.log('positionned')
      },
      dateClick: function(info){
        Rails.ajax({
          url: '/api/v1/bookings',
          type: 'POST',
          data: info.dateStr,
          success: function(data) {
            location.reload();
          }
        });
    },
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
            var day = data.day;
            var start_hour = data.start_hour;
            var end_hour = data.end_hour;
            if (state === 'booked') {
              var client_firstname = data.client_firstname;
              var client_lastname = data.client_lastname;
              var video_channel = data.video_channel;
              var chat_room_id = data.chat_room_id
              var client_avatar_url = data.client_avatar_urls.bright_face.url;
              var title = `Entretien réservé`;
              var bodyText = `<p style="opacity: 0.6;"><i class="fas fa-user"></i>   ${client_firstname} ${client_lastname}</p>
                          <p style="opacity: 0.6;"><i class="fas fa-calendar-day"></i>   ${day}</p>
                          <p style="opacity: 0.6;"><i class="far fa-clock"></i>   ${start_hour} - ${end_hour}</p>
                          <p style="opacity: 0.6;"><i class="fas fa-video"></i>   ${video_channel}</p>`;
              var bodyImage = `<img src=${client_avatar_url} class="rounded-circle;" width="100px;" alt="avatar"/>`;
              var baliseChat = `<a class="btn btn-outline-primary mt-3" href="/chat_rooms/${chat_room_id}"><i class="fas fa-comments"></i></a>`
              $('#chatButton').html(baliseChat);
              $('#modalTitle').html(title);
              $('#modalBodyText').html(bodyText);
              $('#modalBodyImage').html(bodyImage);
            } else {
              var title = `Entretien proposé`;
              var bodyText = `<p style="opacity: 0.6;"><i class="fas fa-calendar-day"></i>   ${day}</p>
                          <p style="opacity: 0.6;"><i class="far fa-clock"></i>   ${start_hour} - ${end_hour}</p>`;
              $('#modalTitle').html(title);
              $('#modalBodyText').html(bodyText);
            }

          var baliseDelete = `<a data-confirm="Êtes vous sûr de supprimer cette réservation ?" class="btn btn-outline-primary" rel="nofollow" data-method="delete" href="/bookings/${booking_id}">Annuler</a>`;
          $('#delButton').html(baliseDelete);
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
