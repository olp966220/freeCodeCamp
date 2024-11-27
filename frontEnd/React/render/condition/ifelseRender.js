class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      display: true
    }
    this.toggleDisplay = this.toggleDisplay.bind(this);
  }
  toggleDisplay() {
    this.setState((state) => ({
      display: !state.display
    }));
  }
  render() {
    // Change code below this line
    let content
    if (this.state.display) {
      content = <h1>Displayed!</h1>
    } else {
      content = null
    }
    return (
       <div>
         <button onClick={this.toggleDisplay}>Toggle Display</button>
         {content}
       </div>
    );
  }
};