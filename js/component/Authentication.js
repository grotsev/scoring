
import React from 'react';
import PropTypes from 'prop-types';

class Authentication extends React.Component {
  static defaultProps = {
    login: '',
  };

  static propTypes = {
    onAuthenticate: PropTypes.func.isRequired,
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
    this.props.onAuthenticate(this.state);
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
