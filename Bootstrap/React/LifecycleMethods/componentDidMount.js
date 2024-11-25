// This method is called after a component is mounted to the DOM.
// Any calls to setState() here will trigger a re-rendering of your component.
// When you call an API in this method, and set your state with the data that the API returns, it will automatically trigger an update once you receive the data.
class MyComponent extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        activeUsers: null
      };
    }
    componentDidMount() {
      setTimeout(() => {
        this.setState({
          activeUsers: 1273
        });
      }, 2500);
    }
    render() {
      return (
        <div>
          {/* Change code below this line */}
          <h1>Active Users: {this.state.activeUsers}</h1>
          {/* Change code above this line */}
        </div>
      );
    }
  }