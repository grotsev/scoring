import React from 'react';
import {
  Route,
  NavLink,
} from 'react-router-dom';

import { Navbar, Nav, NavItem, NavDropdown, MenuItem} from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

function Navigation(props) {
  return (
    <Navbar>
      <Navbar.Header>
        <Navbar.Brand>
          <a href='#'>greetgo! Scoring</a>
        </Navbar.Brand>
        <Navbar.Toggle />
      </Navbar.Header>
      <Navbar.Collapse>
        <Nav>
          <NavDropdown eventKey={1} title='Reports' id='report'>
            <LinkContainer to="/report/detail"><MenuItem>Detail</MenuItem></LinkContainer>
            <LinkContainer to="/report/rejection"><MenuItem>Rejection</MenuItem></LinkContainer>
            <LinkContainer to="/report/service-call"><MenuItem>Service calls</MenuItem></LinkContainer>
            <LinkContainer to="/report/app-move"><MenuItem>Application movements</MenuItem></LinkContainer>
            <LinkContainer to="/report/app-activity"><MenuItem>Application activities</MenuItem></LinkContainer>
          </NavDropdown>
          <LinkContainer to="/product-indicatory"><NavItem eventKey={2}>Product indicator</NavItem></LinkContainer>
          <NavDropdown eventKey={3} title='Dictionary management' id='dictionary'>
            <LinkContainer to="/dictionary/country"><MenuItem>Страны</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/idcard-kind"><MenuItem>Документ уд. личн.</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Должность</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Ежемесячные расходы, не связанные с получением кредита</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Иные платежи</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Кем выдано</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Курс валюты</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Отделение</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Отношение к адресу</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Отношение к клиенту</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Отрасль занятости</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Подписанты</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Семейное положение</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Собственный капитал</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Статус резидентства</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Тип документа</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Тип дохода</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Филиалы</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Характер занятости</MenuItem></LinkContainer>
            <LinkContainer to="/dictionary/"><MenuItem>Цель кредитования</MenuItem></LinkContainer>
          </NavDropdown>
        </Nav>
        <Nav pullRight>
          Logout
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
}


export default Navigation;
