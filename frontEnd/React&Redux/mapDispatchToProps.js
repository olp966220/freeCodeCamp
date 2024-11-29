// The mapDispatchToProps() function is used to provide specific action creators to your React components so they can dispatch actions against the Redux store
const addMessage = (message) => {
    return {
      type: 'ADD',
      message: message
    }
  };
  
  // Change code below this line
  const mapDispatchToProps = (dispatch) => {
    return {
      submitNewMessage: function(message) {
        dispatch(addMessage(message));
      }
    }
  }