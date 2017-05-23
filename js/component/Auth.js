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
          this.setState({token, error: null});
        } else {
          this.setState({error: 'Invalid login or password'});
        }
      }
    }).catch(error => {
      this.setState({error: 'Connection error'});
      console.log(error);
    });
  }

  changeToken = (token) => {
    this.setState({token: token, error: null});
  };

  render() {
    const environment = environmentFactory(this.state.token);
    return <QueryRenderer environment={environment}
      query={graphql`query AuthenticationLoginQuery { jwtLogin jwtRole allStaffRoles{nodes{role}} }`}
      render={({error, props}) => {
        if (this.state.error) {
          return <div>
            <AuthenticationForm onAuthenticate={this._handleAuthenticate} />
            <div>{this.state.error}</div>
          </div>
        }
        if (!props) return <div>Loading</div>;
        if (props.jwtLogin) {
          
          if (props.jwtRole) {
            return React.cloneElement(this.props.children, {
              environment: environment,
              changeToken: this.changeToken,
            });
          }
/*
          switch (props.allStaffRoles.nodes.length) {
            case 0:
              return <div>
                No roles
                <Logout logout={this.props.logout}/>
              </div>
            case 1:
              return this.withRole(props.allStaffRoles.nodes[0].role)
            default:
              return <RoleList roles={props.allStaffRoles.nodes} onSelectRole={this._handleChangeRole} />
          }
*/
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
