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

import {environment as environmentFactory} from './environmentFactory';
import Auth from './component/Auth';
import Navigation from './component/Navigation';
import ApplicationList from './component/ApplicationList';
import Application from './component/Application';
import CountryDict from './component/CountryDict';


ReactDOM.render(
  <Auth render={({token, logout}) => {
    return <div>
      <Router>
        <div>
          <Navigation logout={logout}/>
          <main>

            <Route exact path='/application' render={() => <ApplicationList />} />
            <Route path='/application/:application' component={Application} />

            <Route path='/dictionary/country' render={() => (
              <QueryRenderer environment={environmentFactory(token)}
                query={graphql`
                  query appQuery {
                    currentLogin
                    ...CountryDict_query
                  }
                `}
                render={({error, props}) => {
                  // TODO
                  if (props) return (
                    <CountryDict query={props}/>
                  )
                  return null;
                }}
              />
            )} />

          </main>
        </div>
      </Router>
    </div>
  }} />
  ,
  document.getElementById('root')
);
