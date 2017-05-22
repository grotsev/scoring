import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  graphql,
} from 'react-relay';

import environmentFactory from '../environmentFactory';


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


class Authorization extends React.Component {
  static propTypes = {
    children: PropTypes.element.isRequired,
    environment: PropTypes.object.isRequired,
    logout: PropTypes.func.isRequired,
  };

  state = {
    role: null,
  };

  _handleChangeRole = (role) => {
    this.setState({role});
  };

  withRole = (role) => {
    return <QueryRenderer
        environment={this.props.environment}
        query={graphql`
          query AuthorizationQuery($role: String!) {
            authorize(role:$role)
          }
        `}
        variables={{role}}
        render={({error, props}) => {
          if (props) {
            if (props.authorize) {
              return React.cloneElement(this.props.children, {
                environment: environmentFactory(props.authorize),
                logout: this.props.logout,
                changeRole: this._handleChangeRole,
              });
            } else {
              return <div>Error: No authorization for role {role}</div>
            }
          } else {
            return <div>Loading</div>;
          }
        }}
      />
  }

  render() {
    if (!this.state.role) {
      return <QueryRenderer
          environment={this.props.environment}
          query={graphql`
            query AuthorizationStaffRolesQuery {
              allStaffRoles {
                nodes {
                  role
                }
              }
            }
          `}
          render={({error, props}) => {
            if (props) {
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
            } else {
              return <div>Loading</div>;
            }
          }}
        />
    } else {
      return this.withRole(this.state.role);
    }
  }

}


export default Authorization;
