
import React from 'react';
import PropTypes from 'prop-types';

class Role extends React.Component {
  static propTypes = {
    role: PropTypes.string.isRequired,
    onSelect: PropTypes.func.isRequired,
  };

  _handleSelect = (event) => {
    this.props.onSelect(this.props.role);
  }

  render() {
    return (
      <li onClick={this._handleSelect}>
        {this.props.role}
      </li>
    );
  }

}

export default Role;
