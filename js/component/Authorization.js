
import React from 'react';
import PropTypes from 'prop-types';

import {
  QueryRenderer,
  graphql,
} from 'react-relay';


class Role extends React.Component {
  static propTypes = {
    role: PropTypes.string.isRequired,
    onSelectRole: PropTypes.func.isRequired,
  };

  _handleSelect = (event) => {
    roles: PropTypes.arrayOf(
      PropTypes.string.isRequired,
    ).isRequired,
    this.props.onSelectRole(this.props.role);
  }

  render() {
    return (
      <li onClick={this._handleSelect}>
        {this.props.role}
      </li>
    );
  }

}


class AuthorizationSelect extends React.Component {
  static propTypes = {
    onSelectRole: PropTypes.func.isRequired,
  };

  render() {
    return (
      <ul>
        {this.props.roles.edges.map((edge) =>
          <Role key={edge.node.role} role={edge.node.role} onSelectRole={this.props.onSelectRole} />
        )}
      </ul>
    );
  }

}


class Authorization extends React.Component {
  static propTypes = {
    children: PropTypes.element.isRequired,
    environment: PropTypes.object.isRequired,
    environmentFactory: PropTypes.func.isRequired,
    logout: PropTypes.func.isRequired,
  };

  state = {
    role: null,
  };

  _handleChangeRole = (role) => {
    this.setState({role});
  };

  render() {
    if (!this.state.role) {
      return <QueryRenderer
          environment={this.props.environment}
          query={graphql`
            query AuthorizationStaffRolesQuery {
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
              switch (props.allStaffRoles.length) {
                case 0:
                  return <div>
                    No roles
                    <Logout logout={this.props.logout}/>
                  </div>
                case 1:
                default:
                  return <AuthorizationSelect roles={props.allStaffRoles} onSelectRole={this._handleChangeRole} />
              }
            } else {
              return <div>Loading</div>;
            }
          }}
        />
    } else {
      return <QueryRenderer
          environment={this.props.environment}
          query={graphql`
            query AuthorizationQuery($role: String!) {
              authorize(role:$role)
            }
          `}
          variables={{role: this.state.role}}
          render={({error, props}) => {
            if (props) {
              if (props.authorize) {
                return React.cloneElement(this.props.children, {
                  environment: this.props.environmentFactory(props.authorize),
                  logout: this.props.logout,
                  changeRole: this._handleChangeRole,
                });
              } else {
                return <div>Error: No authorization for role {this.state.role}</div>
              }
            } else {
              return <div>Loading</div>;
            }
          }}
        />
    }
  }

}


export default Authorization;
