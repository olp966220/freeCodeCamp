const breakLength = document.getElementById("break-length");
const sessionLength = document.getElementById("session-length");
const timerLabel = document.getElementById("timer-label");
const timeLeft = document.getElementById("time-left");
const startStop = document.getElementById("start_stop");
const reset = document.getElementById("reset");
const breakDecrement = document.getElementById("break-decrement");
const breakIncrement = document.getElementById("break-increment");
const sessionDecrement = document.getElementById("session-decrement");
const sessionIncrement = document.getElementById("session-increment");
const audio = document.getElementById("beep");

reset.addEventListener("click", () => {
    breakLength.innerText = "5";
    sessionLength.innerText = "25";
    timeLeft.innerText = "25:00";
    timerLabel.innerText = "Session";
    minutes = undefined;
    seconds = undefined;
    clearInterval(countdown);
    startStop.innerText = "Start";
    audio.pause();
    audio.currentTime = 0;
});

breakDecrement.addEventListener("click", () => {
    if (parseInt(breakLength.innerText) > 1) {
        breakLength.innerText = parseInt(breakLength.innerText) - 1;
    }
});

breakIncrement.addEventListener("click", () => {
    if (parseInt(breakLength.innerText) < 60) {
        breakLength.innerText = parseInt(breakLength.innerText) + 1;
    }
});

sessionDecrement.addEventListener("click", () => {
    if (parseInt(sessionLength.innerText) > 1) {
        sessionLength.innerText = parseInt(sessionLength.innerText) - 1;
    }
});

sessionIncrement.addEventListener("click", () => {
    if (parseInt(sessionLength.innerText) < 60) {
        sessionLength.innerText = parseInt(sessionLength.innerText) + 1;
    }
});

let countdown;
let seconds;
let minutes;

startStop.addEventListener("click", () => {
    if (startStop.innerText === "Start") {
        startStop.innerText = "Stop";
        if (minutes === undefined) {
            minutes = parseInt(sessionLength.innerText);
            seconds = 0;
        }
        countdown = setInterval(() => {
            if (seconds === 0) {
                if (minutes === 0) {
                    timeLeft.innerText = "00:00";
                    if (timerLabel.innerText === "Session") {
                        timerLabel.innerText = "Break";
                        audio.play();
                        minutes = parseInt(breakLength.innerText);
                    } else {
                        timerLabel.innerText = "Session";
                        minutes = parseInt(sessionLength.innerText);
                    }
                    seconds = 0;
                }
                minutes--;
                seconds = 59;
            } else {
                seconds--;
            }
            timeLeft.innerText = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
        }, 1000);
    } else {
        startStop.innerText = "Start";
        // Keep current time displayed rather than resetting
        clearInterval(countdown);
    }
});