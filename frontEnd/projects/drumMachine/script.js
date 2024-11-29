const buttons = document.querySelectorAll('.drum-pad');
const display = document.querySelector('#display');

buttons.forEach(button => {
    button.addEventListener('click', () => {
        display.textContent = button.name;
        const audio = document.getElementById(button.id);
        audio.play();
    });
});