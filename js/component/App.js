import React from 'react';
import * as BS from 'react-bootstrap';

export default function App(props) {
  return (
    <BS.Grid fluid>
      <BS.Row>
        <BS.Col sm={3}>
          <BS.PanelGroup>

            <BS.Panel header='Привлечение'>
              <BS.ListGroup fill>
                <BS.ListGroupItem>Информация по займу</BS.ListGroupItem>
                <BS.ListGroupItem>Данные клиента</BS.ListGroupItem>
                <BS.ListGroupItem>Доходы и расходы</BS.ListGroupItem>
                <BS.ListGroupItem>Электронное досье</BS.ListGroupItem>
                <BS.ListGroupItem>Предварительное предложение</BS.ListGroupItem>
              </BS.ListGroup>
            </BS.Panel>
            
            <BS.Panel header='Заявка'>
              111
            </BS.Panel>

          </BS.PanelGroup>
        </BS.Col>
      </BS.Row>
    </BS.Grid>
  )
}
