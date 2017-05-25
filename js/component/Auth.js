import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  graphql,
} from 'react-relay';

import {fetchQuery, environment as environmentFactory} from '../environmentFactory';

import Logout from './Logout';


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


function Role(props) {
  return (
    <li onClick={(event) => {props.onSelectRole(props.role)}}>
      {props.role}
    </li>
  );
}


function RoleList(props) {
  return (
    <ul>
      {props.roles.map((node) =>
        <Role key={node.role} role={node.role} onSelectRole={props.onSelectRole} />
      )}
    </ul>
  );
}


RoleList.propTypes = {
  roles: PropTypes.arrayOf(
    PropTypes.shape({
      role: PropTypes.string.isRequired,
    }).isRequired
  ).isRequired,
  onSelectRole: PropTypes.func.isRequired,
};


class Authentication extends React.Component {
  static propTypes = {
    children: PropTypes.element.isRequired,
  };

  state = {
    token: localStorage.getItem('jwt_token'),
    login: null,
    role: null,
    roles: null,
    status: null,
  };

  whoAmI() {
    return fetchQuery(this.state.token)(
      {text: 'query { jwtLogin jwtRole allStaffRoles{nodes{role}} }'},
    ).then(res => {
      if (res.errors) {
        console.log(res.errors);
        this.setState({status: 'Result Error'});
        return;
      }
      if (res.data) {
        this.setState({
          login: res.data.jwtLogin,
          role: res.data.allStaffRoles.nodes.length == 1 ? res.data.allStaffRoles.nodes[0] : res.data.jwtRole,
          roles: res.data.allStaffRoles.nodes,
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
      return <QueryRenderer environment={environmentFactory(this.state.token)}
        query={graphql`query AuthQuery { jwtLogin jwtRole }`}
        render={({error, props}) => {
          return <div>
            <Logout logout={this.logout} />
            {this.props.children}
          </div>
        }}
      />
    }
    if (this.state.roles) {
      if (this.state.roles.length > 0) {
        return <div>
          <Logout logout={this.logout} />
          <RoleList roles={this.state.roles} onSelectRole={this._handleChangeRole} />
        </div>
      } else {
        return <div>No roles</div>
      }
    }
    return <div>Loading</div>;
  }

}


export default Authentication;
