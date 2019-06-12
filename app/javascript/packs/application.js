import "bootstrap";


// calendars
import { displayCalendarVisitor } from "calendar/calendar_visitor";
import { displayCalendarCoach } from "calendar/calendar_coach";

// if (Window.pathname === "/bookings") {
  displayCalendarCoach();
// };

// displayCalendarVisitor();

// chat
import { scrollLastMessageIntoView } from "chat/scroll";
window.scrollLastMessageIntoView = scrollLastMessageIntoView;
