
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
  };

  _handleAuthenticate = (sendLoginPassword) => {
    this.setState({sendLoginPassword});
  }

  _handleSelectRole = (role) => {
    console.log(role);
    //this.setState({sendLoginPassword: event});
  }

  emptyEnvironment = this.props.environmentFactory();

  render() {
    return (
      <div>
        <Authentication onAuthenticate={this._handleAuthenticate} />
        { this.state.sendLoginPassword &&
          <QueryRenderer
            environment={this.emptyEnvironment}
            query={graphql`
              query ApplicationQuery($login: Login!, $password: String!) {
                authenticate(login:$login, password:$password)
              }
            `}
            variables={this.state.sendLoginPassword}
            render={({error, props}) => {
              if (props) {
                const token = props.authenticate;
                if (token) {
                  return <QueryRenderer
                      environment={this.props.environmentFactory(token)}
                      query={graphql`
                        query Application_Roles_Query {
                          allStaffRoles {
                            edges {
                              node {
                                role
                              }
                            }
                          }
                        }
                      `}
                      render={({error, props}) => {
                        if (props) {
                          return <Authorization
                            roles={props.allStaffRoles}
                            onSelectRole={this._handleSelectRole}
                          />
                        } else {
                          return <div>Loading</div>;
                        }
                      }}
                    />
                } else {
                  return <div>Invalid Login and Password</div>
                }
              } else {
                return <div>Loading</div>;
              }
            }}
          />
        }
      </div>
    );
  }

}

export default Application;
