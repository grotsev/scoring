import React from 'react';
import * as BS from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';


export default function ApplicationStageList(props) {
  return (
    <BS.Panel>
      <BS.ListGroup fill>
        <LinkContainer to="/application/1/stage/20170506102030"><BS.ListGroupItem>Привлечение</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102130"><BS.ListGroupItem>Заявка</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102230"><BS.ListGroupItem>Верификация</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102330"><BS.ListGroupItem>Заявка</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102430"><BS.ListGroupItem>Оценка залогового имущества</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102530"><BS.ListGroupItem>Юридическая проверка</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102630"><BS.ListGroupItem>Служба безопасности</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102730"><BS.ListGroupItem>Управление кредитными рисками</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102830"><BS.ListGroupItem>КК по розничному бизнесу</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506102930"><BS.ListGroupItem>Кредитный комитет филиала</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506103030"><BS.ListGroupItem>Дополнительная юридическая экспертиза</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506103130"><BS.ListGroupItem>Подписание договора</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506103230"><BS.ListGroupItem>Регистрация залога</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506103330"><BS.ListGroupItem>Заявка</BS.ListGroupItem></LinkContainer>
        <LinkContainer to="/application/1/stage/20170506103430"><BS.ListGroupItem>Служба безопасности
          <BS.ButtonToolbar>
            <BS.Button>Взять в работу</BS.Button>
          </BS.ButtonToolbar>
        </BS.ListGroupItem></LinkContainer>
      </BS.ListGroup>
    </BS.Panel>
  )
}
