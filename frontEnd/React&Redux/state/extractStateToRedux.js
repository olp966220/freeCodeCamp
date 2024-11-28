// define ADD, addMessage(), messageReducer(), and store here:
const ADD = 'ADD';
const addMessage = (message) => {
  return {
    type: ADD,
    message: message
  }
}
const messageReducer = (defaultState=[], action) => {
  switch(action.type) {
    case ADD:
      return [
        ...defaultState,
        action.message
      ]
    default:
      return defaultState;
  }
}
const store = Redux.createStore(messageReducer);