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
  Link
} from 'react-router-dom'

import Authentication from './component/Authentication';
import Authorization from './component/Authorization';
import Logout from './component/Logout';

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
  /*<Authentication environmentFactory={environmentFactory}>
    <Authorization environmentFactory={()=>{}} environment={{}} logout={()=>{}}>
      <Logout logout={()=>{}} />
    </Authorization>
  </Authentication>*/
  <Router>
    <nav>
      <ul>
        <li><Link to="/report">Reports</Link>
          <Route path="/report" render={() => (
            <ul>
              <li><Link to="/report/detail">Detail</Link></li>
              <li><Link to="/report/rejection">Rejection</Link></li>
              <li><Link to="/report/service-call">Service calls</Link></li>
              <li><Link to="/report/app-move">Application movements</Link></li>
              <li><Link to="/report/app-activity">Application activities</Link></li>
            </ul>
          )}/>
        </li>
        <li><Link to="/product-indicator">Product indicator</Link></li>
        <li><Link to="/dictionary">Dictionary management</Link></li>
      </ul>
    </nav>
  </Router>
  ,
  mountNode
);
