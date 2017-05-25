import {
  Environment,
  Network,
  RecordSource,
  Store,
} from 'relay-runtime';


const fetchQuery = (token) => {
  return function(
    operation,
    variables,
  ) {
    var headers = {
      'Content-Type': 'application/json',
    }
    if (token) headers['Authorization'] = `Bearer ${token}`;

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
}


const environment = (token) => {
  return new Environment({
    network: Network.create(fetchQuery(token)),
    store: new Store(new RecordSource()),
  });
};


export {fetchQuery, environment};
