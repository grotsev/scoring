import React from 'react';
import {
  Route,
  NavLink,
} from 'react-router-dom';

import { Navbar, Nav, NavItem, NavDropdown, MenuItem, Glyphicon } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

function Navigation(props) {
  return (
    <Navbar>
      <Navbar.Header>
        <Navbar.Brand>
          <a href='/'>greetgo! Scoring</a>
        </Navbar.Brand>
        <Navbar.Toggle />
      </Navbar.Header>
      <Navbar.Collapse>
        <Nav>
          <LinkContainer to="/application"><NavItem eventKey={2}>Applications</NavItem></LinkContainer>
          <NavDropdown eventKey={1} title='Reports' id='report'>
            <LinkContainer to="/report/detail"><MenuItem>Detail</MenuItem></LinkContainer>
            <LinkContainer to="/report/rejection"><MenuItem>Rejection</MenuItem></LinkContainer>
            <LinkContainer to="/report/service-call"><MenuItem>Service calls</MenuItem></LinkContainer>
            <LinkContainer to="/report/app-move"><MenuItem>Application movements</MenuItem></LinkContainer>
            <LinkContainer to="/report/app-activity"><MenuItem>Application activities</MenuItem></LinkContainer>
          </NavDropdown>
          <LinkContainer to="/product-indicatory"><NavItem eventKey={2}>Product indicator</NavItem></LinkContainer>
          <NavDropdown eventKey={3} title='Dictionaries' id='dictionary'>
            <LinkContainer to="/dictionary/country"><MenuItem>Страны</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/idcard-kind"><MenuItem>Документ уд. личн.</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/a"><MenuItem>Должность</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/b"><MenuItem>Ежемесячные расходы, не связанные с получением кредита</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/c"><MenuItem>Иные платежи</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/d"><MenuItem>Кем выдано</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/e"><MenuItem>Курс валюты</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/f"><MenuItem>Отделение</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/g"><MenuItem>Отношение к адресу</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/h"><MenuItem>Отношение к клиенту</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/i"><MenuItem>Отрасль занятости</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/j"><MenuItem>Подписанты</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/k"><MenuItem>Семейное положение</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/l"><MenuItem>Собственный капитал</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/m"><MenuItem>Статус резидентства</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/n"><MenuItem>Тип документа</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/o"><MenuItem>Тип дохода</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/p"><MenuItem>Филиалы</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/q"><MenuItem>Характер занятости</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/r"><MenuItem>Цель кредитования</MenuItem></LinkContainer>
          </NavDropdown>
        </Nav>
        <Nav pullRight>
          <NavItem onClick={props.logout}><Glyphicon glyph='log-out' /> Log out</NavItem>
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
}


export default Navigation;
