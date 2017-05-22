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

import {
  HashRouter as Router,
  Route,
  Link,
  NavLink,
} from 'react-router-dom';

import Authentication from './component/Authentication';
import Authorization from './component/Authorization';
import Logout from './component/Logout';
import Navigation from './component/Navigation';
import CountryDict from './component/CountryDict';

const mountNode = document.getElementById('root');

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
  <Router>
    <Authentication environmentFactory={environmentFactory}>
      <Authorization environmentFactory={()=>{}} environment={{}} logout={()=>{}}>
          <div>
            <Navigation/>
            <main>
              <Route path="/dictionary/country" render={() => <CountryDict/>} />
            </main>
          </div>
      </Authorization>
    </Authentication>
  </Router>
  ,
  mountNode
);
