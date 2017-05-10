
import AuthenticationMutation from '../mutation/AuthenticationMutation';

import React from 'react';
import {
  createFragmentContainer,
  graphql,
} from 'react-relay';

const PropTypes = require('prop-types');

class Authentication extends React.Component {
  static defaultProps = {
    login: '',
  };

  static propTypes = {
    login: PropTypes.string,
    onAuthenticated: PropTypes.func.isRequired,
  };

  state = {
    login: this.props.login,
    password: '',
  };

  _handleChange = (event) => {
    const target = event.target;
    this.setState({
      [target.name]: target.value
    });
  }

  _handleSubmit = (event) => {
    event.preventDefault();
    console.info(this.state);
    AuthenticationMutation.commit(
      this.props.environment,
      this.state.login,
      this.state.password
    );
    console.info(this.state);
  }

  render() {
    return (
      <form onSubmit={this._handleSubmit}>
        <label>
          Login:
          <input type="text" name="login" value={this.state.login} onChange={this._handleChange} />
        </label>
        <label>
          Password:
          <input type="password" name="password" value={this.state.password} onChange={this._handleChange} />
        </label>
        <input type="submit" value="Log in" />
      </form>
    );
  }

}

export default Authentication;
