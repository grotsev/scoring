import React from 'react';
import PropTypes from 'prop-types';

import * as BS from 'react-bootstrap';

import FieldGroup from './FieldGroup';
import {fetchQuery} from '../environmentFactory';


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
      <BS.Form inline onSubmit={this._handleSubmit}>
        <FieldGroup id='login' type='text' label='Login' name='login' value={this.state.login} onChange={this._handleChange} />
        {' '}
        <FieldGroup id='password' type='password' label='Password' name='password' value={this.state.password} onChange={this._handleChange} />
        {' '}
        <BS.Button type="submit"><span className='fa fa-sign-in' /> Log in</BS.Button>
      </BS.Form>
    );
  }

}


class Auth extends React.Component {
  state = {
    token: localStorage.getItem('jwt_token'),
    login: null,
    role: null,
    roles: null,
    status: null,
  };

  whoAmI() {
    return fetchQuery(this.state.token)(
      {text: 'query { currentLogin currentRol availableRole{nodes} }'},
    ).then(res => {
      if (res.errors) {
        console.log(res.errors);
        this.setState({status: 'Result Error'});
        return;
      }
      if (res.data) {
        this.setState({
          login: res.data.currentLogin,
          role: res.data.availableRole.nodes.length == 1 ? res.data.availableRole.nodes[0] : res.data.currentRol,
          roles: res.data.availableRole.nodes,
        });
      } else {
        this.setState({status: 'No data'});
      }
    })
  }

  changeToken = (token) => {
    if (token) localStorage.setItem('jwt_token', token)
    this.setState(this.newTokenState(token));
  };

  logout = () => {
    localStorage.removeItem('jwt_token');
    this.setState({
      token: null,
      login: null,
      role: null,
      roles: null,
      status: null,
    });
  }

  _handleAuthenticate = (loginPassword) => {
    fetchQuery(this.state.token)(
      {text:'query ($login: Login!, $password: String!) {authenticate(login:$login, password:$password)}'},
      loginPassword
    ).then(res => {
      if (res.errors) {
        console.log(res.errors);
        this.setState({status: 'Result Error'});
      } else {
        const token = res.data.authenticate;
        if (token) {
          localStorage.setItem('jwt_token', token);
          this.setState({
            token,
            login: null,
            role: null,
            roles: null,
            status: null,
          });
          return this.whoAmI();
        } else {
          this.setState({status: 'Invalid login or password'});
        }
      }
    }).catch(error => {
      console.log(error);
      this.setState({status: 'Connection error'});
    });
  }

  _handleChangeRole = (role) => {
    fetchQuery(this.state.token)(
      {text:'query ($role: String!) { authorize(role:$role) }'},
      {role:role}
    ).then(res => {
      if (res.errors) {
        console.log(res.errors);
        this.setState({status: 'Result Error'});
      } else {
        const token = res.data.authorize;
        if (token) {
          localStorage.setItem('jwt_token', token);
          this.setState({
            token,
            status: null,
          });
          return this.whoAmI();
        } else {
          this.setState({status: 'Invalid role'});
        }
      }
    }).catch(error => {
      console.log(error);
      this.setState({status: 'Connection error'});
    });
  };

  componentDidMount() {
    if (this.state.token) this.whoAmI();
  }

  render() {
    if (!this.state.login) {
      return <div>
        <AuthenticationForm onAuthenticate={this._handleAuthenticate} />
        {this.state.status && <div>{this.state.status}</div>}
      </div>
    }
    if (this.state.role && this.state.role != 'anonymous') {
      return this.props.render({
        token: this.state.token,
        logout: this.logout,
      })
    }
    if (this.state.roles) {
      if (this.state.roles.length > 0) {
        return <div>
          <BS.Button onClick={this.logout}><span className='fa fa-sign-out' /> Log out</BS.Button>
          <BS.ListGroup>
            {this.state.roles.map((node) =>
              <BS.ListGroupItem key={node.role} onClick={(event) => {this._handleChangeRole(node.role)}}>
                {node.role}
              </BS.ListGroupItem>
            )}
          </BS.ListGroup>
        </div>
      } else {
        return <div>No roles</div>
      }
    }
    return <div>Loading</div>;
  }

}


export default Auth;
