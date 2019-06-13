import "bootstrap";


// calendars
import { displayCalendarVisitor } from "calendar/calendar_visitor";
import { displayCalendarCoach } from "calendar/calendar_coach";


// if (window.location.pathname === "/dashboard_coach") {
  displayCalendarCoach();
// }


// displayCalendarVisitor();

// chat
import { scrollLastMessageIntoView } from "chat/scroll";
window.scrollLastMessageIntoView = scrollLastMessageIntoView;

// change mouse cursor on card coach
// const card = document.querySelector(".card-index");
// card.addEventListener("mouseover", {
//   cursor = "grab";
// })

document.querySelector(".card-index").style.cursor = "pointer";
