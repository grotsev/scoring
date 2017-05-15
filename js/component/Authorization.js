
import React from 'react';
import PropTypes from 'prop-types';

class Role extends React.Component {
  static propTypes = {
    role: PropTypes.string.isRequired,
    onSelectRole: PropTypes.func.isRequired,
  };

  _handleSelect = (event) => {
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
    roles: PropTypes.arrayOf(
      PropTypes.string.isRequired,
    ).isRequired,
    onSelectRole: PropTypes.func.isRequired,
  };

  render() {
    return (
      <ul>
        {this.props.roles.map((role) =>
          <Role key={role} role={role} onSelectRole={this.props.onSelectRole} />
        )}
      </ul>
    );
  }

}

export default Authorization;
