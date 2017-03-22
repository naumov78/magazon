import React from 'react';
import { Link, withRouter } from 'react-router';

class User extends React.Component {
  constructor(props){
    super(props);
  }


  render(){
    return (
      <section>
        <h1>Hello, {this.props.user.first_name} {this.props.user.last_name}!</h1>
      </section>
    );
  }
}

export default User;
