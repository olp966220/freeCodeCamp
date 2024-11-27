// Handle action is the job of a reducer function.
// the reducer function must always return a new copy of state and never modify state directly.
const defaultState = {
  login: false
};

const reducer = (state = defaultState, action) => {
  // Change code below this line
  if (action.type == 'LOGIN') {
      return {
        ...state,
        login: true
      }
  }
  return state
  // Change code above this line
};

const store = Redux.createStore(reducer);

const loginAction = () => {
  return {
    type: 'LOGIN'
  }
};