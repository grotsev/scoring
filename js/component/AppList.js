import React from 'react';
import * as BS from 'react-bootstrap';
import DateRangePicker from 'react-bootstrap-daterangepicker';
import moment from 'moment';
import * as RT from 'react-router-dom';

import FieldGroup from './FieldGroup';


export default function AppList(props) {
  return (
    <BS.Grid fluid>
      <BS.Row>
        <BS.Col sm={3}>
          
          <BS.Panel>
            <BS.Button bsStyle='primary' block fill><span className='fa fa-plus' /> Create</BS.Button>
          </BS.Panel>

          <BS.Panel>
            <BS.ListGroup fill>
              <BS.ListGroupItem>Все<BS.Badge pullRight>20</BS.Badge> <BS.Label bsStyle='danger'>4 new</BS.Label></BS.ListGroupItem>
              <BS.ListGroupItem>Доработки<BS.Badge pullRight>3</BS.Badge> <BS.Label bsStyle='danger'>1 new</BS.Label></BS.ListGroupItem>
              <BS.ListGroupItem>Привлечение<BS.Badge pullRight>2</BS.Badge> <BS.Label bsStyle='danger'>2 new</BS.Label></BS.ListGroupItem>
              <BS.ListGroupItem>Заявка</BS.ListGroupItem>
              <BS.ListGroupItem>Отказано системой<BS.Badge pullRight>1</BS.Badge></BS.ListGroupItem>
              <BS.ListGroupItem>Отказные ожидание<BS.Badge pullRight>2</BS.Badge> <BS.Label bsStyle='danger'>1 new</BS.Label></BS.ListGroupItem>
              <BS.ListGroupItem>Не активные</BS.ListGroupItem>
              <BS.ListGroupItem>Завершённые<BS.Badge pullRight>12</BS.Badge></BS.ListGroupItem>
              <BS.ListGroupItem><span className='fa fa-bookmark' /> Помеченные<BS.Badge pullRight>1</BS.Badge></BS.ListGroupItem>
            </BS.ListGroup>
          </BS.Panel>
          
          <BS.PanelGroup>
            <BS.Panel>
              <BS.Form>
                <FieldGroup clearable id='iin' type='text' placeholder='ИИН' name='iin' />
                <FieldGroup clearable id='surname' type='text' placeholder='Фамилия' name='surname' />
                <FieldGroup clearable id='name' type='text' placeholder='Имя' name='name' />
                <FieldGroup clearable id='patronymic' type='text' placeholder='Отчество' name='patronymic' />
                <FieldGroup clearable id='filial' type='text' placeholder='Филиал' name='filial' />
                <BS.FormGroup controlId='dateFromTo'>
                  <DateRangePicker startDate={moment('2017-01-01')} endDate={moment('2017-02-03')}>
                    <BS.InputGroup>
                      <BS.FormControl placeholder='Дата заявки с ... по ...'/>
                      <BS.InputGroup.Button><BS.Button><span className='fa fa-times-circle' /></BS.Button></BS.InputGroup.Button>
                    </BS.InputGroup>
                  </DateRangePicker>
                </BS.FormGroup>
                <FieldGroup clearable id='app' type='text' placeholder='№ заявки' name='app' />
                <FieldGroup clearable id='manager' type='text' placeholder='ФИО менеджера' name='manager' />
                <BS.ButtonToolbar>
                  <BS.Button type='submit' bsStyle='primary'><span className='fa fa-search' /> Найти</BS.Button>
                  <BS.Button type='reset'><span className='fa fa-times-circle' /> Очистить</BS.Button>
                </BS.ButtonToolbar>
              </BS.Form>
            </BS.Panel>
          </BS.PanelGroup>

        </BS.Col>

        <BS.Col sm={9}>
          <BS.Table striped hover responsive>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Unmark</BS.Tooltip>}>
                      <span className='fa fa-bookmark' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.Label bsStyle='danger'>new</BS.Label>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.Label bsStyle='danger'>new</BS.Label>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Edit</BS.Tooltip>}>
                      <RT.Link to='app/1'><span className='fa fa-pencil' /></RT.Link>
                    </BS.OverlayTrigger>
                  </div>
                  <div>
                    <BS.OverlayTrigger overlay={<BS.Tooltip id='new'>Mark</BS.Tooltip>}>
                      <span className='fa fa-bookmark-o' />
                    </BS.OverlayTrigger>
                  </div>
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
          </BS.Table>

          <BS.Pagination prev next ellipsis boundaryLinks items={20} maxButtons={5} activePage={20} />
        </BS.Col>

      </BS.Row>
    </BS.Grid>
  );
}
