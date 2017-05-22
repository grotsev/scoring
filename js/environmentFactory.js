import {
  Environment,
  Network,
  RecordSource,
  Store,
} from 'relay-runtime';


export default (token) => {
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
