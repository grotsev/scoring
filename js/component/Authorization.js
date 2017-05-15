
import React from 'react';
import PropTypes from 'prop-types';

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

class Authorization extends React.Component {
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

export default Authorization;
