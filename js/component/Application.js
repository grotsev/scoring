
import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  createRefetchContainer,
  graphql,
} from 'react-relay';

import Authentication from './Authentication';
import Authorization from './Authorization';

class Application extends React.Component {
  static defaultProps = {
    login: '',
  };

  static propTypes = {
    environmentFactory: PropTypes.func.isRequired,
  };

  state = {
    sendLoginPassword: null,
    role: null,
  };

  _handleAuthenticate = (sendLoginPassword) => {
    this.setState({sendLoginPassword});
  }

  _handleSelectRole = (role) => {
    this.setState({role});
  }

  emptyEnvironment = this.props.environmentFactory();

  render() {
    if (!this.state.sendLoginPassword)
      return <Authentication onAuthenticate={this._handleAuthenticate} />
    else
      if (!this.state.role) {
        return <QueryRenderer
          environment={this.emptyEnvironment}
          query={graphql`
            query ApplicationQuery($login: Login!, $password: String!) {
              authenticate(login:$login, password:$password)
            }
          `}
          variables={this.state.sendLoginPassword}
          render={({error, props}) => {
            if (props) {
              if (props.authenticate)
                return <QueryRenderer
                    environment={this.props.environmentFactory(props.authenticate)}
                    query={graphql`
                      query Application_Roles_Query{
                        allStaffRoles { edges{node{role}} }
                      }
                    `}
                    render={({error, props}) => {
                      if (props)
                        return <Authorization roles={props.allStaffRoles} onSelectRole={this._handleSelectRole} />
                      else
                        return <div>Loading</div>;
                    }}
                  />
              else
                return <div>
                  <Authentication onAuthenticate={this._handleAuthenticate} />
                  Invalid Login and Password
                </div>
            } else {
              return <div>Loading</div>;
            }
          }}
        />
      } else {
        return <div>{this.state.role}</div>
      }
  }

}

export default Application;
