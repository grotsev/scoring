
import React from 'react';
import PropTypes from 'prop-types';

import Role from './Role';

class Authorization extends React.Component {
  static propTypes = {
    roles: PropTypes.arrayOf(
      PropTypes.string.isRequired,
    ).isRequired,
    onSelect: PropTypes.func.isRequired,
  };

  render() {
    return (
      <ul>
        {this.props.roles.map((role) =>
          <Role key={role} role={role} onSelect={this.props.onSelect} />
        )}
      </ul>
    );
  }

}

export default Authorization;
