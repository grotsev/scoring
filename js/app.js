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

import Authentication from './component/Authentication';
import Authorization from './component/Authorization';

//import TodoApp from './components/TodoApp';

const mountNode = document.getElementById('root');

function fetchQuery(
  operation,
  variables,
) {
  var token = localStorage.getItem('jwt_token');
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

const environment = new Environment({
  network: Network.create(fetchQuery),
  store: new Store(new RecordSource()),
});

function environmentZ(token) {
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
}


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

function handleSubmit({login, password}) {
  console.log(login);
}

function handleSelect(role) {
  console.log(login);
}

ReactDOM.render(
  <div>
    <Authentication onSubmit={handleSubmit}/>
    <Authorization roles={["a", "bc", "def"]} onSelect={handleSelect}/>
  </div>,
  mountNode
);
