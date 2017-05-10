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
/*
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
ReactDOM.render(
  <Authentication environment={environment}/>,
  mountNode
);
