import React from 'react';
import ReactDOM from 'react-dom';
import {
  QueryRenderer,
  graphql,
} from 'react-relay';

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


ReactDOM.render(
  <Authentication>
    <Authorization environmentFactory={()=>{}} environment={{}} logout={()=>{}}>
      <Router>
        <div>
          <Navigation/>
          <main>
            <Route path="/dictionary/country" render={() => <CountryDict/>} />
          </main>
        </div>
      </Router>
    </Authorization>
  </Authentication>
  ,
  document.getElementById('root')
);
