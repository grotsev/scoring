
import React from 'react';
import PropTypes from 'prop-types';
import {
  QueryRenderer,
  createRefetchContainer,
  graphql,
} from 'react-relay';

class Authentication extends React.Component {
  static defaultProps = {
    login: '',
  };

  static propTypes = {
    environmentFactory: PropTypes.func.isRequired,
    onAuthenticate: PropTypes.func.isRequired,
  };

  state = {
    login: this.props.login,
    password: '',
    sent: null,
  };

  _handleChange = (event) => {
    const target = event.target;
    this.setState({
      [target.name]: target.value
    });
  }

  _handleSubmit = (event) => {
    event.preventDefault();
    this.setState({sent: {login: this.state.login, password: this.state.password}});
    //this.props.onAuthenticate(this.state);
    //this.props.relay.refetch(this.state, null);
  }

  emptyEnvironment = this.props.environmentFactory();

  render() {
    return (
      <form onSubmit={this._handleSubmit}>
        <label>
          Login:
          <input type="text" name="login" value={this.state.login} onChange={this._handleChange} />
        </label>
        <label>
          Password:
          <input type="password" name="password" value={this.state.password} onChange={this._handleChange} />
        </label>
        <input type="submit" value="Log in" />

        { this.state.sent &&
          <QueryRenderer
            environment={this.emptyEnvironment}
            query={graphql`
              query AuthenticationQuery($login: Login!, $password: String!){
                authenticate(login:$login, password:$password)
              }
            `}
            variables={this.state.sent}
            render={({error, props}) => {
              if (props) {
                return <div>{props.authenticate}</div>
              } else {
                return <div>Loading</div>;
              }
            }}
          />
        }
      </form>
    );
  }

}

export default Authentication;
