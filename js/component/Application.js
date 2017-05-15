
import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  createRefetchContainer,
  graphql,
} from 'react-relay';

import Authentication from './Authentication';

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

  _handleAuthenticate = (event) => {
    this.setState({sendLoginPassword: event});
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
              query ApplicationQuery($login: Login!, $password: String!){
                authenticate(login:$login, password:$password)
              }
            `}
            variables={this.state.sendLoginPassword}
            render={({error, props}) => {
              if (props) {
                return <div>{props.authenticate}</div>
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
