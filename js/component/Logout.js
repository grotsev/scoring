
import React from 'react';
import PropTypes from 'prop-types';


class Logout extends React.Component {
  static propTypes = {
    logout: PropTypes.func.isRequired,
  };

  render() {
    return <input type="button" onClick={this.props.logout} value="Logout"/>;
  }
}


export default Logout;
