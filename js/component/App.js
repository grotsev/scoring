import React from 'react';
import { Grid, Row, Col, Panel, Badge, Label, ListGroup, ListGroupItem,
  Form, FormGroup, FormControl, ControlLabel, PanelGroup,
  ButtonToolbar, Button, Glyphicon, OverlayTrigger, Tooltip, InputGroup,
  Table, Pagination
} from 'react-bootstrap';
import DateRangePicker from 'react-bootstrap-daterangepicker';
import moment from 'moment';

import FieldGroup from './FieldGroup';


function App(props) {
  return (
    <Grid fluid>
      <Row>
        <Col sm={3}>
          
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
          
          <PanelGroup>
            <Panel header='Filter'>
              <Form>
                <FieldGroup clearable id='iin' type='text' placeholder='ИИН' name='iin' />
                <FieldGroup clearable id='surname' type='text' placeholder='Фамилия' name='surname' />
                <FieldGroup clearable id='name' type='text' placeholder='Имя' name='name' />
                <FieldGroup clearable id='patronymic' type='text' placeholder='Отчество' name='patronymic' />
                <FieldGroup clearable id='filial' type='text' placeholder='Филиал' name='filial' />
                <FormGroup controlId='dateFromTo'>
                  <DateRangePicker startDate={moment('2017-01-01')} endDate={moment('2017-02-03')}>
                    <InputGroup>
                      <FormControl placeholder='Дата заявки с ... по ...'/>
                      <InputGroup.Button><Button><Glyphicon glyph='remove-sign' /></Button></InputGroup.Button>
                    </InputGroup>
                  </DateRangePicker>
                </FormGroup>
                <FieldGroup clearable id='app' type='text' placeholder='№ заявки' name='app' />
                <FieldGroup clearable id='manager' type='text' placeholder='ФИО менеджера' name='manager' />
                <ButtonToolbar>
                  <Button type='submit'><Glyphicon glyph='search' /> Найти</Button>
                  <Button type='reset'><Glyphicon glyph='remove-sign' /> Очистить</Button>
                </ButtonToolbar>
              </Form>
            </Panel>
          </PanelGroup>

        </Col>

        <Col sm={9}>
          <Table striped hover responsive>
            <thead>
              <tr>
                <th></th>
                <th>
                  <div className='text-nowrap'>ИИН</div>
                  <div className='text-nowrap'>ФИО клиента</div>
                </th>
                <th>
                  <div className='text-nowrap'>Филиал</div>
                  <div className='text-nowrap'>Время создания</div>
                  <div className='text-nowrap'>Номер заявки</div>
                </th>
                <th>
                  <div className='text-nowrap'>Продукт</div>
                  <div className='text-nowrap'>Создавший менеджер</div>
                </th>
                <th>Исполнитель</th>
                <th>
                  <div className='text-nowrap'>Этап</div>
                  <div className='text-nowrap'>Текущий исполнитель</div>
                </th>
                <th>Комментарий</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                   <Label bsStyle='danger'>new</Label>
                </td>
                <td>
                  <div>850118400153</div>
                  <div>Абисов</div>
                  <div>Абис</div>
                  <div>Абисович</div>
                </td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>09-02-2017 09:45</div>
                  <div>2</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td></td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>14-02-2017 10:41</div>
                  <div>3</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td>
                  <div>850118400153</div>
                  <div>Абисов</div>
                  <div>Абис</div>
                  <div>Абисович</div>
                </td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>09-02-2017 09:45</div>
                  <div>2</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td></td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>08-02-2017 16:53</div>
                  <div>1</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td></td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>14-02-2017 10:41</div>
                  <div>3</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td>
                  <div>850118400153</div>
                  <div>Абисов</div>
                  <div>Абис</div>
                  <div>Абисович</div>
                </td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>09-02-2017 09:45</div>
                  <div>2</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td></td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>08-02-2017 16:53</div>
                  <div>1</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td></td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>14-02-2017 10:41</div>
                  <div>3</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td>
                  <div>850118400153</div>
                  <div>Абисов</div>
                  <div>Абис</div>
                  <div>Абисович</div>
                </td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>09-02-2017 09:45</div>
                  <div>2</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
              <tr>
                <td>
                  <OverlayTrigger overlay={<Tooltip id='new'>Edit</Tooltip>}>
                    <Button><Glyphicon glyph='pencil' /></Button>
                  </OverlayTrigger>
                </td>
                <td></td>
                <td>
                  <div className='text-nowrap'>Карагандинский филиал</div>
                  <div className='text-nowrap'>08-02-2017 16:53</div>
                  <div>1</div>
                </td>
                <td>
                  <div>Автокредитование</div>
                  <div>Гай</div>
                  <div>Юлий</div>
                  <div>Цезарь</div>
                </td>
                <td></td>
                <td>
                  <div>Привлечение</div>
                </td>
                <td></td>
              </tr>
            </tbody>
          </Table>

          <Pagination prev next ellipsis boundaryLinks items={20} maxButtons={5} activePage={20} />
        </Col>

      </Row>
    </Grid>
  );
}


export default App;
