// You have access to the state object throughout the life of your component. You can update it, render it in your UI, and pass it as props to child components.
class StatefulComponent extends React.Component {
  constructor(props) {
    super(props);
    // Only change code below this line
    this.state = {
      firstName: "k"
    }
    // Only change code above this line
  }
  render() {
    return (
      <div>
        <h1>{this.state.firstName}</h1>
      </div>
    );
  }
};