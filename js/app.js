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
        <li><NavLink to="/report">Reports</NavLink>
          <Route path="/report" render={() => (
            <ul>
              <li><NavLink to="/report/detail">Detail</NavLink></li>
              <li><NavLink to="/report/rejection">Rejection</NavLink></li>
              <li><NavLink to="/report/service-call">Service calls</NavLink></li>
              <li><NavLink to="/report/app-move">Application movements</NavLink></li>
              <li><NavLink to="/report/app-activity">Application activities</NavLink></li>
            </ul>
          )}/>
        </li>
        <li><NavLink to="/product-indicator">Product indicator</NavLink></li>
        <li><NavLink to="/dictionary">Dictionary management</NavLink>
          <Route path="/dictionary" render={() => (
            <ul>
              <li><NavLink to="/dictionary/country">Страны</NavLink></li>
              <li><NavLink to="/dictionary/idcard-kind">Документ уд. личн.</NavLink></li>
              <li><NavLink to="/dictionary/">Должность</NavLink></li>
              <li><NavLink to="/dictionary/">Ежемесячные расходы, не связанные с получением кредита</NavLink></li>
              <li><NavLink to="/dictionary/">Иные платежи</NavLink></li>
              <li><NavLink to="/dictionary/">Кем выдано</NavLink></li>
              <li><NavLink to="/dictionary/">Курс валюты</NavLink></li>
              <li><NavLink to="/dictionary/">Отделение</NavLink></li>
              <li><NavLink to="/dictionary/">Отношение к адресу</NavLink></li>
              <li><NavLink to="/dictionary/">Отношение к клиенту</NavLink></li>
              <li><NavLink to="/dictionary/">Отрасль занятости</NavLink></li>
              <li><NavLink to="/dictionary/">Подписанты</NavLink></li>
              <li><NavLink to="/dictionary/">Семейное положение</NavLink></li>
              <li><NavLink to="/dictionary/">Собственный капитал</NavLink></li>
              <li><NavLink to="/dictionary/">Статус резидентства</NavLink></li>
              <li><NavLink to="/dictionary/">Тип документа</NavLink></li>
              <li><NavLink to="/dictionary/">Тип дохода</NavLink></li>
              <li><NavLink to="/dictionary/">Филиалы</NavLink></li>
              <li><NavLink to="/dictionary/">Характер занятости</NavLink></li>
              <li><NavLink to="/dictionary/">Цель кредитования</NavLink></li>
            </ul>
          )}/>
        </li>
      </ul>
    </nav>
  </Router>
  ,
  mountNode
);
