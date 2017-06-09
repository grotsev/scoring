import React from 'react';
import {
  Route,
  NavLink,
} from 'react-router-dom';

import * as BS from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

function Navigation(props) {
  return (
    <BS.Navbar fluid>
      <BS.Navbar.Header>
        <BS.Navbar.Brand>
          <a href='/'>greetgo! Scoring</a>
        </BS.Navbar.Brand>
        <BS.Navbar.Toggle />
      </BS.Navbar.Header>
      <BS.Navbar.Collapse>
        <BS.Nav>
          <LinkContainer to="/application"><BS.NavItem eventKey={2}>Applications</BS.NavItem></LinkContainer>
          <BS.NavDropdown eventKey={1} title='Reports' id='report'>
            <LinkContainer to="/report/detail"><BS.MenuItem>Detail</BS.MenuItem></LinkContainer>
            <LinkContainer to="/report/rejection"><BS.MenuItem>Rejection</BS.MenuItem></LinkContainer>
            <LinkContainer to="/report/service-call"><BS.MenuItem>Service calls</BS.MenuItem></LinkContainer>
            <LinkContainer to="/report/application-move"><BS.MenuItem>Application movements</BS.MenuItem></LinkContainer>
            <LinkContainer to="/report/application-activity"><BS.MenuItem>Application activities</BS.MenuItem></LinkContainer>
          </BS.NavDropdown>
          <LinkContainer to="/product-indicatory"><BS.NavItem eventKey={2}>Product indicator</BS.NavItem></LinkContainer>
          <BS.NavDropdown eventKey={3} title='Dictionaries' id='dictionary'>
            <LinkContainer to="/dictionary/country"><BS.MenuItem>Страны</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/idcard-kind"><BS.MenuItem>Документ уд. личн.</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/a"><BS.MenuItem>Должность</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/b"><BS.MenuItem>Ежемесячные расходы, не связанные с получением кредита</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/c"><BS.MenuItem>Иные платежи</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/d"><BS.MenuItem>Кем выдано</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/e"><BS.MenuItem>Курс валюты</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/f"><BS.MenuItem>Отделение</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/g"><BS.MenuItem>Отношение к адресу</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/h"><BS.MenuItem>Отношение к клиенту</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/i"><BS.MenuItem>Отрасль занятости</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/j"><BS.MenuItem>Подписанты</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/k"><BS.MenuItem>Семейное положение</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/l"><BS.MenuItem>Собственный капитал</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/m"><BS.MenuItem>Статус резидентства</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/n"><BS.MenuItem>Тип документа</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/o"><BS.MenuItem>Тип дохода</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/p"><BS.MenuItem>Филиалы</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/q"><BS.MenuItem>Характер занятости</BS.MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/r"><BS.MenuItem>Цель кредитования</BS.MenuItem></LinkContainer>
          </BS.NavDropdown>
        </BS.Nav>
        <BS.Navbar.Form pullRight>
          <span>Служба безопасности</span>{' '}
          <span>Иванов Иван Иванович</span>{' '}
          <BS.Button onClick={props.logout}><span className='fa fa-sign-out' /> Log out</BS.Button>
        </BS.Navbar.Form>
      </BS.Navbar.Collapse>
    </BS.Navbar>
  );
}


export default Navigation;
