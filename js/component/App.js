import React from 'react';
import { Grid, Row, Col, Panel, Badge, Label } from 'react-bootstrap';


function App(props) {
  return (
    <Grid fluid>
      <Row>
        <Col sm={4}>
          <Panel>
            <ul>
              <li>Все <Badge pullRight>131</Badge> <Label bsStyle='danger'>4 new</Label> </li>
              <li>Доработки <Badge pullRight>3</Badge> <Label bsStyle='danger'>1 new</Label> </li>
              <li>Привлечение <Badge pullRight>2</Badge> <Label bsStyle='danger'>2 new</Label> </li>
              <li>Заявка <Badge pullRight>0</Badge> </li>
              <li>Отказано системой <Badge pullRight>1</Badge> </li>
              <li>Отказные ожидание <Badge pullRight>2</Badge> <Label bsStyle='danger'>1 new</Label> </li>
              <li>Не активные <Badge pullRight>0</Badge> </li>
              <li>Завершённые <Badge pullRight>123</Badge> </li>
            </ul>
          </Panel>
        </Col>
      </Row>
    </Grid>
  );
}


export default App;
