import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  graphql,
} from 'react-relay';

import environmentFactory from '../environmentFactory';


class AuthenticationForm extends React.Component {
  static propTypes = {
    onAuthenticate: PropTypes.func.isRequired,
  };

  state = {
    login: '',
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


class Authentication extends React.Component {
  static propTypes = {
    children: PropTypes.element.isRequired,
  };

  state = {
    auth: null,
  };

  _handleAuthenticate = (auth) => {
    this.setState({auth});
  }

  _handleLogout = () => {
    this.setState({auth: null});
  };

  render() {
    if (!this.state.auth) {
      return <AuthenticationForm onAuthenticate={this._handleAuthenticate} />
    } else {
      return <QueryRenderer
        environment={environmentFactory()}
        query={graphql`
          query AuthenticationQuery($login: Login!, $password: String!) {
            authenticate(login:$login, password:$password)
          }
        `}
        variables={this.state.auth}
        render={({error, props}) => {
          if (props) {
            if (props.authenticate) {
              return React.cloneElement(this.props.children, {
                environment: environmentFactory(props.authenticate),
                environmentFactory: environmentFactory,
                logout: this._handleLogout,
              });
            }
            else {
              return <div>
                <AuthenticationForm onAuthenticate={this._handleAuthenticate} />
                Invalid Login and Password
              </div>
            }
          } else {
            return <div>Loading</div>;
          }
        }}
      />
    }
  }

}


export default Authentication;
