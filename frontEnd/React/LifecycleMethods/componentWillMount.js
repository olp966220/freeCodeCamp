// catch components at certain points in time
// the main lifecycle methods: componentWillMount() componentDidMount() shouldComponentUpdate() componentDidUpdate() componentWillUnmount()
class MyComponent extends React.Component {
    constructor(props) {
      super(props);
    }
    componentWillMount() {
      // Change code below this line
      console.log(1)
      // Change code above this line
    }
    render() {
      return <div />
    }
  };