import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  graphql,
} from 'react-relay';

import {fetchQuery, environment as environmentFactory} from '../environmentFactory';


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
    token: localStorage.getItem('jwt_token'),
    loginPassword: null,
    error: null,
  };

  _handleAuthenticate = (loginPassword) => {
    fetchQuery()(
      {text:'query ($login: Login!, $password: String!) {authenticate(login:$login, password:$password)}'},
      loginPassword
    ).then(res => {
      if (res.errors) {
        this.setState({error: 'Result error'});
        console.log(res.errors);
      } else {
        const token = res.data.authenticate;
        if (token) {
          localStorage.setItem('jwt_token', token);
          this.setState({token, loginPassword, error: null});
        } else {
          this.setState({error: 'Invalid login or password'});
        }
      }
    }).catch(error => {
      this.setState({error: 'Connection error'});
      console.log(error);
    });
  }

  _handleLogout = () => {
    this.setState({token: null, error: null});
  };

  render() {
    const environment = environmentFactory(this.state.token);
    return <QueryRenderer
      environment={environment}
      query={graphql`
        query AuthenticationLoginQuery {
          jwtLogin
        }
      `}
      render={({error, props}) => {
        if (this.state.error) {
          return <div>
            <AuthenticationForm onAuthenticate={this._handleAuthenticate} />
            <div>{this.state.error}</div>
          </div>
        }
        if (!props) return <div>Loading</div>;
        if (props.jwtLogin) {
          return React.cloneElement(this.props.children, {
            environment: environment,
            logout: this._handleLogout,
          });
        }
        return <div>
          <AuthenticationForm onAuthenticate={this._handleAuthenticate} />
          {this.state.error && <div>{this.state.error}</div>}
        </div>
      }}
    />
  }

}


export default Authentication;
