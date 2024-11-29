const clear = document.getElementById('clear');
const decimal = document.getElementById('decimal');
const display = document.getElementById('display');
const numbers = document.querySelectorAll('.number');
const operators = document.querySelectorAll('.operator');
const equal = document.getElementById('equal');

clear.addEventListener('click', () => {
    display.textContent = 0;
});

let firstNumber = '';
let operator = '';
let nextNumber = '';

decimal.addEventListener('click', () => {
    if (nextNumber.includes('.')) return;
    display.textContent += '.';
    nextNumber += '.';
});

operators.forEach(op => {
    op.addEventListener('click', () => {
        if (firstNumber === '') {
            firstNumber = display.textContent;
            operator = op.textContent;
        } else if (nextNumber === '') {
            operator = op.textContent;
            console.log(operator);
        }
    });
});

numbers.forEach(number => {
    number.addEventListener('click', () => {
        if (operator === '') {
            if (display.textContent === '0' || firstNumber === display.textContent) {
                display.textContent = number.textContent;
            } else {
                display.textContent += number.textContent;
            }
            firstNumber = display.textContent;
        } else {
            if (nextNumber === '') {
                display.textContent = number.textContent;
            } else {
                display.textContent += number.textContent;
            }
            nextNumber = display.textContent;
        }
    });
});

equal.addEventListener('click', calculate);

function calculate() {
    if (firstNumber === '' || operator === '' || nextNumber === '') return;
    
    let result;
    const a = parseFloat(firstNumber);
    const b = parseFloat(nextNumber);
    
    switch(operator) {
        case '+':
            result = a + b;
            break;
        case '-':
            result = a - b;
            break;
        case '*':
            result = a * b;
            break;
        case '/':
            result = b !== 0 ? a / b : 'Error';
            break;
    }
    
    display.textContent = result;
    firstNumber = result.toString();
    operator = '';
    nextNumber = '';
    console.log(firstNumber);
    console.log(nextNumber);
    console.log(operator);
}
