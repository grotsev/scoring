
import React from 'react';
import PropTypes from 'prop-types';

class Authorization extends React.Component {
  static propTypes = {
    roles: PropTypes.arrayOf(
      PropTypes.string.isRequired,
    ).isRequired,
    onSelect: PropTypes.func.isRequired,
  };

  _handleSelect = (event) => {
    this.props.onSelect(this.state);
  }

  render() {
    return (
      <ul>
        {this.props.roles.map((role) =>
          <li key={role} onClick={this._handleSelect}>
            {role}
          </li>
        )}
      </ul>
    );
  }

}

export default Authorization;
