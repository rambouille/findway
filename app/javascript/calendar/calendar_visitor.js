// import '@fullcalendar/core/main.css';
// import '@fullcalendar/timegrid/main.css';

// import { Calendar } from '@fullcalendar/core';
// import timeGridPlugin from '@fullcalendar/timegrid';

// import frLocale from '@fullcalendar/core/locales/fr';
// import momentPlugin from '@fullcalendar/moment';
// import momentTimezonePlugin from '@fullcalendar/moment-timezone';
// import interactionPlugin from '@fullcalendar/interaction';

// // import moment from 'moment/moment';
// // import momentTimezone from 'moment-timezone/moment-timezone';

// const displayCalendarVisitor = () => {
//   document.addEventListener('DOMContentLoaded', function() {
//     const calendarEl = document.getElementById('calendar-visitor');

//     const idCoach = window.location.pathname.split('/')[2]
//     var urlApi = `/api/v1/coaches/${idCoach}/availabilities`

//     const genericTimeFormat = {
//       hour: '2-digit',
//       minute: '2-digit',
//       'hour12': false
//     }

//     const calendar = new Calendar(calendarEl, {
//       plugins: [
//         timeGridPlugin,
//         momentPlugin,
//         momentTimezonePlugin,
//         interactionPlugin
//       ],
//       titleFormat: 'DD/MM',
//       slotLabelFormat: genericTimeFormat,
//       eventTimeFormat: genericTimeFormat,
//       minTime: '08:00:00',
//       maxTime: '20:00:00',
//       columnHeaderFormat: 'ddd',
//       slotDuration: '02:00:00',
//       slotLabelInterval: '02:00',
//       minTime: "06:00:00",
//       maxTime: "22:00:00",
//       allDaySlot: false,
//       firstDay: 1,
//       header: false,
//       eventRender: function() {
//         console.log('rendered')
//       },
//       eventPositioned: function() {
//         console.log('positionned')
//       },
//       dateClick: function(){
//         console.log('date clicked')
//       },
//       eventClick: function(){
//         console.log('event clicked')
//         console.log(event.currentTarget)
//       },
//       eventDragStart: function(){
//         console.log('event drag start')
//       },
//       eventDragStop: function(){
//         console.log('event drag stop')
//       },
//       eventDrop: function(){
//         console.log('event drop')
//         // call ajax?
//       },
//       selectable: true,
//       editable: true,
//       locale: 'fr',
//       timeZone: 'Europe/Paris',
//       timeFormat: 'H(:mm)',
//       defaultView: 'timeGridWeek',
//       events: {
//         url: urlApi,
//       }
//     });

//     const renderCalendar = function(){
//       calendar.render()
//     }
//     setTimeout(renderCalendar, 250);
//   });
// }

// export { displayCalendarVisitor };
