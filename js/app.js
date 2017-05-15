import React from 'react';
import ReactDOM from 'react-dom';

import {
  QueryRenderer,
  graphql,
} from 'react-relay';
import {
  Environment,
  Network,
  RecordSource,
  Store,
} from 'relay-runtime';

import Application from './component/Application';

const mountNode = document.getElementById('root');

/*

        <QueryRenderer
          environment={this.props.emptyEnvironment}
          query={graphql`
            query AuthenticationQuery($login: Login!, $password: String!){
              authenticate(login:$login, password:$password)
            }
          `}
          variables={{
            login:this.state.login,
            password:this.state.password
          }}
          render={({error, props}) => {
            if (props) {
              return <div>{props.authenticate}</div>;
            } else {
              return <div>Loading</div>;
            }
          }}
        />

ReactDOM.render(
  <QueryRenderer
    environment={environment}
    query={graphql`
      query appQuery {
        allCurrencies {
          nodes {
            currency
          }
        }
      }
    `}
    variables={{}}
    render={({error, props}) => {
      if (props) {
        return <div>Ok</div>;
      } else {
        return <div>Loading</div>;
      }
    }}
  />,
  mountNode
);
*/

const environmentFactory = (token) => {
  return new Environment({
    network: Network.create(
        function fetchQuery(
          operation,
          variables,
        ) {
          var headers = {
            'Content-Type': 'application/json',
          }
          if (token) headers['Authorization'] = 'Bearer ' + token;

          return fetch('/graphql', {
            method: 'POST',
            headers,
            body: JSON.stringify({
              query: operation.text,
              variables,
            }),
          }).then(response => {
            return response.json();
          });
        }
      ),
    store: new Store(new RecordSource()),
  });
};

ReactDOM.render(
  <Application environmentFactory={environmentFactory}/>,
  mountNode
);
