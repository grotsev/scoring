import React from 'react';
import { Grid, Row, Col, Panel, Badge, Label, ListGroup, ListGroupItem,
  Form, FormGroup, FormControl, ControlLabel, PanelGroup,
  Button, Glyphicon
} from 'react-bootstrap';


function App(props) {
  return (
    <Grid fluid>
      <Row>
        <Col sm={4}>
          
          <Panel header='Stage'>
            <ListGroup fill>
              <ListGroupItem>Все <Badge pullRight>20</Badge> <Label bsStyle='danger'>4 new</Label></ListGroupItem>
              <ListGroupItem>Доработки <Badge pullRight>3</Badge> <Label bsStyle='danger'>1 new</Label></ListGroupItem>
              <ListGroupItem>Привлечение <Badge pullRight>2</Badge> <Label bsStyle='danger'>2 new</Label></ListGroupItem>
              <ListGroupItem>Заявка <Badge pullRight>0</Badge></ListGroupItem>
              <ListGroupItem>Отказано системой <Badge pullRight>1</Badge></ListGroupItem>
              <ListGroupItem>Отказные ожидание <Badge pullRight>2</Badge> <Label bsStyle='danger'>1 new</Label></ListGroupItem>
              <ListGroupItem>Не активные <Badge pullRight>0</Badge></ListGroupItem>
              <ListGroupItem>Завершённые <Badge pullRight>12</Badge></ListGroupItem>
            </ListGroup>
          </Panel>
          
          <PanelGroup accordion>
            <Panel header='Filter' eventKey='1'>
              <Form horizontal>
                
                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>ИИН</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>
                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>№ заявки</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>

                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Филиал</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>
                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Менеджер</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>

                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Дата с</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>
                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Дата по</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>

                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Фамилия</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>
                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Имя</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>
                <FormGroup controlId='iin'>
                  <Col sm={4} componentClass={ControlLabel}>Отчество</Col>
                  <Col sm={8}><FormControl type='text' /></Col>
                </FormGroup>

                <FormGroup controlId='iin'>
                  <Col smOffset={4} sm={8}><Button type="submit"><Glyphicon glyph='search' /> Найти</Button></Col>
                </FormGroup>
                
              </Form>
            </Panel>
          </PanelGroup>

        </Col>
      </Row>
    </Grid>
  );
}


export default App;
