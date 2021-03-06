// set minutes
var t = 0
var timeinterval = null;
 
// calculate the seconds (don't change this! unless time progresses at a different speed for you...)
function countdown() {
    setTimeout('Decrement()',1000);
}
function pad(n, width, z) {
  z = z || '0';
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}
function alarm(){
responsiveVoice.speak("Put your pencils down."); 
}
function initializeClock(mins){
  t = mins * 60;
//minutes = document.getElementById("minutes");
//seconds = document.getElementById("seconds");
  if (timeinterval == null) {
    timeinterval = setInterval(function(){
      t--;
      var minutes_elements = document.getElementsByClassName("minutes");
      var seconds_elements = document.getElementsByClassName("seconds");
      for (var i=0; i<minutes_elements.length; i++) {
          minutes = minutes_elements[i];
          seconds = seconds_elements[i];
          if (t < 59) {
              minutes.textContent = 0;
              seconds.textContent = pad(t,2);
          } else {
              minutes.textContent = getminutes();
              seconds.textContent = pad(getseconds(),2);
          }
      }
      if(t<=0){
        clearInterval(timeinterval);
        timeinterval = null;
        slideshow.gotoNextSlide();
        alarm();
      }
    },1000);
  }
}
function resetClock(mins){
    if (timeinterval != null) {
        clearInterval(timeinterval);
        timeinterval = null;
    }
    initializeClock(mins);
}
/*
function Decrement() {
    if (document.getElementById) {
        minutes = document.getElementById("minutes");
        seconds = document.getElementById("seconds");
        // if less than a minute remaining
        if (seconds < 59) {
            seconds.textContent = pad(secs,2);
        } else {
            minutes.textContent = getminutes();
            seconds.textContent = pad(getseconds(),2);
        }
        secs--;
        setTimeout('Decrement()',1000);
    }
}
*/
function getminutes() {
    // minutes is seconds divided by 60, rounded down
    mins = Math.floor(t / 60);
    return mins;
}
function getseconds() {
    // take mins remaining (as seconds) away from total seconds remaining
    mins = Math.floor(t / 60);
    return t-Math.round(mins *60);
}
