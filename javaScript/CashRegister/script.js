let price = 1.87;
let cid = [
  ['PENNY', 1.01],
  ['NICKEL', 2.05],
  ['DIME', 3.1],
  ['QUARTER', 4.25],
  ['ONE', 90],
  ['FIVE', 55],
  ['TEN', 20],
  ['TWENTY', 60],
  ['ONE HUNDRED', 100]
];
const currencyUnits = [
  ['PENNY', 0.01],
  ['NICKEL', 0.05],
  ['DIME', 0.1],
  ['QUARTER', 0.25],
  ['ONE', 1],
  ['FIVE', 5],
  ['TEN', 10],
  ['TWENTY', 20],
  ['ONE HUNDRED', 100]
];

let cash = document.getElementById('cash');
const purchaseBtn = document.getElementById('purchase-btn');
const changeDue = document.getElementById('change-due');

const changeReturn = (change, msg = '') => {
  for (let i = currencyUnits.length - 1; i >= 0; i--) {
    if (cid[i][1] === 0) continue;
    const sumCid = cid.reduce((acc, curr) => acc + curr[1], 0); 
    if (Number(change) === sumCid && msg === '') {
      return `CLOSED ${cid.filter(item => item[1] > 0).reverse().map(item => ` ${item[0]}: $${item[1]}`).join('')}`;
    };
    if (change >= currencyUnits[i][1]) {
      const count = Math.floor(change / currencyUnits[i][1]);
      const limitChange = Math.min((count * currencyUnits[i][1]).toFixed(2), cid[i][1]);
      change = (change - limitChange).toFixed(2);
      msg += ` ${currencyUnits[i][0]}: $${parseFloat(limitChange)}`;
      if (Number(change) === 0) {
        return `OPEN ${msg}`;
      };
    };
  };
  return 'INSUFFICIENT_FUNDS';
};

purchaseBtn.addEventListener('click', () => {
  if (parseFloat(cash.value) < price) {
    alert('Customer does not have enough money to purchase the item');
  } else if (parseFloat(cash.value) === price) {
    changeDue.textContent = 'No change due - customer paid with exact cash';
  } else {
    const change = (cash.value - price).toFixed(2);
    changeDue.textContent = `Status: ${changeReturn(change)}`;
  };
});
