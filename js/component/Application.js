import React from 'react';
import * as BS from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';
import {
  Route,
  Link,
  Redirect,
} from 'react-router-dom';
import moment from 'moment';
import DateRangePicker from 'react-bootstrap-daterangepicker';

import ApplicationStageList from './ApplicationStageList'
import FieldGroup from './FieldGroup';


export default function Application(props) {
  return (
    <BS.Grid fluid>
      <BS.Row style={{marginBottom: 15}}>
        <BS.Col sm={3}>
          <BS.ButtonToolbar>
            <BS.Button block><span className='fa fa-play' /> Взять в работу</BS.Button>
          </BS.ButtonToolbar>
        </BS.Col>
          <BS.ButtonToolbar>
            <BS.ButtonGroup>
              <BS.Button title='Предыдущая проблема'><span className='fa fa-step-backward' /></BS.Button>
              <BS.Button title='Следующая проблема'><span className='fa fa-step-forward' /></BS.Button>
            </BS.ButtonGroup>
          </BS.ButtonToolbar>
        <BS.Col sm={9}>
        </BS.Col>
      </BS.Row>
      <BS.Row>

        <BS.Col sm={3}>
          <BS.Nav bsStyle='pills' stacked>
            <LinkContainer to="/application/1/stage/20170506102030/contract"><BS.NavItem>Контракт</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102030/offer"><BS.NavItem>Предварительное предложение</BS.NavItem></LinkContainer>
            <BS.NavDropdown title='История' id='history'>
              <LinkContainer to="/application/1/stage/20170506100630/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Привлечение</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506100730/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Заявка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506100830/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Верификация</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506100930/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Заявка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101030/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Оценка залогового имущества</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101130/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Юридическая проверка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101230/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Служба безопасности</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101330/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Управление кредитными рисками</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101430/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>КК по розничному бизнесу</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101430/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Кредитный комитет филиала</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101630/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Дополнительная юридическая экспертиза</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101730/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Подписание договора</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101830/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Регистрация залога</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506101930/contract"><BS.MenuItem title='Иванов Иван Иванович 20 июня 14:42'>Заявка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102030/contract"><BS.MenuItem>Служба безопасности</BS.MenuItem></LinkContainer>
            </BS.NavDropdown>
          </BS.Nav>
          <hr />
          <h6>Физические лица</h6>
          <BS.Nav bsStyle='pills' stacked>
            <LinkContainer to="/application/1/stage/20170506102030/person/12"><BS.NavItem>Абисов Абис Абисович</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102030/person/13"><BS.NavItem>Абисова Абисса Абисовна</BS.NavItem></LinkContainer>
          </BS.Nav>
          <hr />
          <h6>Адреса</h6>
          <BS.Nav bsStyle='pills' stacked>
            <LinkContainer to="/application/1/stage/20170506102030/address/2"><BS.NavItem>пос. Жансугуров, ул. Абая, 25, кв.2</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102030/address/13"><BS.NavItem>пос. Жансугуров, ул. Абая, 12, кв.13</BS.NavItem></LinkContainer>
          </BS.Nav>
          <hr />
          <h6>Сканы</h6>
          <BS.Nav bsStyle='pills' stacked>
            <LinkContainer to="/application/1/stage/20170506102030/scan/1"><BS.NavItem title='Иванов Иван Иванович 20 июня 14:42'>Удостоверение личности / Абисов Абис Абисович</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102030/scan/2"><BS.NavItem title='Иванов Иван Иванович 20 июня 14:42'>Удостоверение личности / Абисова Абисса Абисовна</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102030/scan/3"><BS.NavItem title='Иванов Иван Иванович 20 июня 14:42'>Свидетельство о браке / Абисовы</BS.NavItem></LinkContainer>
          </BS.Nav>
        </BS.Col>

        <BS.Col sm={9}>

          <Route path='/application/1/stage/20170506102030/contract' render={() => (
            <div>
              <BS.Nav bsStyle='tabs' style={{marginBottom: 15}}>
                <LinkContainer to="/application/1/stage/20170506102030/contract/condition"><BS.NavItem>Условия</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/contract/person"><BS.NavItem>Ответственные лица</BS.NavItem></LinkContainer>
              </BS.Nav>

              <Route exact path='/application/1/stage/20170506102030/contract' render={() => (
                <Redirect to='/application/1/stage/20170506102030/contract/condition' />
              )}/>

              <Route path='/application/1/stage/20170506102030/contract/condition' render={() => (
                <BS.Form horizontal>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Продукт</BS.Col>
                    <BS.Col sm={8}>
                      <BS.FormControl componentClass='select'>
                        <option></option>
                        <option>Кредит</option>
                        <option>Депозит</option>
                      </BS.FormControl>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Сумма</BS.Col>
                    <BS.Col sm={8}><BS.FormControl type='text' /></BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Валюта</BS.Col>
                    <BS.Col sm={8}>
                      <BS.FormControl componentClass='select'>
                        <option></option>
                        <option>USD</option>
                        <option>KZT</option>
                      </BS.FormControl>
                    </BS.Col>
                  </BS.FormGroup>
                </BS.Form>
              )} />

              <Route path='/application/1/stage/20170506102030/contract/person' render={() => (
                <BS.Form>

                  <BS.FormGroup controlId='product'>
                    <BS.InputGroup>
                      <BS.DropdownButton componentClass={BS.InputGroup.Button} title='Заёмщик' id='zzz'>
                        <BS.MenuItem key='1'>Заёмщик</BS.MenuItem>
                        <BS.MenuItem key='2'>Залогодатель</BS.MenuItem>
                        <BS.MenuItem key='3'>Гарант</BS.MenuItem>
                        <BS.MenuItem key='4'>Страховщик</BS.MenuItem>
                      </BS.DropdownButton>
                      <BS.InputGroup.Addon><Link to="/application/1/stage/20170506102030/person/12"><span className='fa fa-fw fa-pencil' /></Link></BS.InputGroup.Addon>
                      <BS.FormControl componentClass='select'>
                        <option></option>
                        <option>Абисов Абис Абисович</option>
                        <option>Абисова Абисса Абисовна</option>
                        <option>[Новое физическое лицо]</option>
                        <option>[Новое юридическое лицо]</option>
                      </BS.FormControl>
                      <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                    </BS.InputGroup>
                  </BS.FormGroup>

                  <BS.ButtonToolbar>
                    <BS.DropdownButton title={<span><span className='fa fa-fw fa-plus' /> Добавить</span>} id='zzz'>
                      <BS.MenuItem key='1'>Заёмщик</BS.MenuItem>
                      <BS.MenuItem key='2'>Залогодатель</BS.MenuItem>
                      <BS.MenuItem key='3'>Гарант</BS.MenuItem>
                      <BS.MenuItem key='4'>Страховщик</BS.MenuItem>
                    </BS.DropdownButton>
                  </BS.ButtonToolbar>

                </BS.Form>
              )} />
            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/offer' render={() => (
            <div>
              <div>Запрашиваемая сумма</div>
              <div>Сумма предложения</div>
              <div>Ставка</div>
              <div>Срок займа (месяцев)</div>
              <div>Валюта кредита</div>
              <div>Тип погашения</div>
              <div>Ежемесячный платёж</div>
              <div>Ежемесячный платёж предложения</div>
              <div>Клиент согласен: <span className='fa fa-check text-success' /> да</div>
            </div>
          )} />

          <Route path='/application/1/stage/20170506102030/person/12' render={() => (
            <div>
              <BS.Nav bsStyle='tabs' style={{marginBottom: 15}}>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/person"><BS.NavItem>Личные данные</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/address"><BS.NavItem>Адреса</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/phone"><BS.NavItem>Телефоны</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/income"><BS.NavItem>Доходы</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/expenses"><BS.NavItem>Расходы</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/employment"><BS.NavItem>Занятость</BS.NavItem></LinkContainer>
                <LinkContainer to="/application/1/stage/20170506102030/person/12/kin"><BS.NavItem>Контактные лица</BS.NavItem></LinkContainer>
              </BS.Nav>

              <Route exact path='/application/1/stage/20170506102030/person/12' render={() => (
                <Redirect to='/application/1/stage/20170506102030/person/12/person' />
              )}/>

              <Route path='/application/1/stage/20170506102030/person/12/person' render={() => (
                <BS.Form horizontal>

                  <BS.FormGroup controlId='product' validationState='error'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>ИИН</BS.Col>
                    <BS.Col sm={8}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='123456789012' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-search' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Фамилия</BS.Col>
                    <BS.Col sm={8}><BS.FormControl type='text' value='Абисов' /></BS.Col>
                  </BS.FormGroup>
                  
                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Имя</BS.Col>
                    <BS.Col sm={8}><BS.FormControl type='text' value='Абис' /></BS.Col>
                  </BS.FormGroup>
                  
                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Отчество</BS.Col>
                    <BS.Col sm={8}><BS.FormControl type='text' value='Абисович' /></BS.Col>
                  </BS.FormGroup>
                  
                  <BS.FormGroup controlId='dateFromTo'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Дата рождения</BS.Col>
                    <BS.Col sm={8}>
                      <DateRangePicker startDate={moment('2017-01-01')} endDate={moment('2017-02-03')}>
                        <BS.InputGroup>
                          <BS.FormControl />
                        </BS.InputGroup>
                      </DateRangePicker>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Семейное положение</BS.Col>
                    <BS.Col sm={8}>
                      <BS.FormControl componentClass='select'>
                        <option></option>
                        <option>В браке</option>
                        <option>Вне брака</option>
                      </BS.FormControl>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Фотография</BS.Col>
                    <BS.Col sm={8}>
                      <BS.Image width='96' height='128' title='Фотография' src='images/' />
                    </BS.Col>
                  </BS.FormGroup>

                </BS.Form>
              )} />

              <Route path='/application/1/stage/20170506102030/person/12/address' render={() => (
                <BS.Form horizontal>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Адрес регистрации</BS.Col>
                    <BS.Col sm={8}>
                      <BS.InputGroup>
                        <BS.InputGroup.Addon><Link to="/application/1/stage/20170506102030/person/12"><span className='fa fa-fw fa-pencil' /></Link></BS.InputGroup.Addon>
                        <BS.FormControl componentClass='select'>
                          <option></option>
                          <option>пос. Жансугуров, ул. Абая, 25, кв.2</option>
                          <option>пос. Жансугуров, ул. Абая, 12, кв.13</option>
                          <option>[Новый]</option>
                        </BS.FormControl>
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Фактический адрес</BS.Col>
                    <BS.Col sm={8}>
                      <BS.InputGroup>
                        <BS.InputGroup.Addon><Link to="/application/1/stage/20170506102030/person/12"><span className='fa fa-fw fa-pencil' /></Link></BS.InputGroup.Addon>
                        <BS.FormControl componentClass='select'>
                          <option></option>
                          <option>пос. Жансугуров, ул. Абая, 25, кв.2</option>
                          <option>пос. Жансугуров, ул. Абая, 12, кв.13</option>
                          <option>[Новый]</option>
                        </BS.FormControl>
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={4} componentClass={BS.ControlLabel}>Рабочий адрес</BS.Col>
                    <BS.Col sm={8}>
                      <BS.InputGroup>
                        <BS.InputGroup.Addon><Link to="/application/1/stage/20170506102030/person/12"><span className='fa fa-fw fa-pencil' /></Link></BS.InputGroup.Addon>
                        <BS.FormControl componentClass='select'>
                          <option></option>
                          <option>пос. Жансугуров, ул. Абая, 25, кв.2</option>
                          <option>пос. Жансугуров, ул. Абая, 12, кв.13</option>
                          <option>[Новый]</option>
                        </BS.FormControl>
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                </BS.Form>
              )} />

              <Route path='/application/1/stage/20170506102030/person/12/phone' render={() => (
                <BS.Form>
                
                  <BS.FormGroup controlId='product'>
                    <BS.InputGroup>
                      <BS.DropdownButton componentClass={BS.InputGroup.Button} title='Мобильный' id='zzz'>
                        <BS.MenuItem key='1'>Мобильный</BS.MenuItem>
                        <BS.MenuItem key='2'>Контактный</BS.MenuItem>
                        <BS.MenuItem key='3'>Рабочий</BS.MenuItem>
                        <BS.MenuItem key='4'>Домашний</BS.MenuItem>
                      </BS.DropdownButton>
                      <BS.FormControl type='tel' value='+7 701 672 22 22' />
                      <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                    </BS.InputGroup>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.InputGroup>
                      <BS.DropdownButton componentClass={BS.InputGroup.Button} title='Контактный' id='zzz'>
                        <BS.MenuItem key='1'>Мобильный</BS.MenuItem>
                        <BS.MenuItem key='2'>Контактный</BS.MenuItem>
                        <BS.MenuItem key='3'>Рабочий</BS.MenuItem>
                        <BS.MenuItem key='4'>Домашний</BS.MenuItem>
                      </BS.DropdownButton>
                      <BS.FormControl type='tel' value='+7 701 672 22 20' />
                      <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                    </BS.InputGroup>
                  </BS.FormGroup>

                  <BS.ButtonToolbar>
                    <BS.DropdownButton title={<span><span className='fa fa-fw fa-plus' /> Добавить</span>} id='zzz'>
                      <BS.MenuItem key='1'>Мобильный</BS.MenuItem>
                      <BS.MenuItem key='2'>Контактный</BS.MenuItem>
                      <BS.MenuItem key='3'>Рабочий</BS.MenuItem>
                      <BS.MenuItem key='4'>Домашний</BS.MenuItem>
                    </BS.DropdownButton>
                  </BS.ButtonToolbar>

                </BS.Form>
              )} />

              <Route path='/application/1/stage/20170506102030/person/12/income' render={() => (
                <BS.Form horizontal>
                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Оклад за последний месяц</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Средняя сумма ежемесячных доходов / Средняя сумма по справке о з/п</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Ежемесячный доход супруга/ги</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Дополнительный подтверждённый доход</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Итого в месяц</BS.Col>
                    <BS.Col sm={4}>
                      <BS.FormControl.Static>100500</BS.FormControl.Static>
                    </BS.Col>
                  </BS.FormGroup>
                </BS.Form>
              )} />

              <Route path='/application/1/stage/20170506102030/person/12/expenses' render={() => (
                <BS.Form horizontal>
                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>По действующим кредитам</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Сумма КЛ на кредитных картах</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Расходы на образование (детский сад, школа, институт)</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Аренда жилья</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Расходы на коммунальные услуги</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Расходы на услуги мобильной связи, Интернет и т.п.</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Личные платежи</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Алименты</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Прочие расходы (лечение, помошь родственникам)</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Страхование</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Комиссии</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Годовой налог на транспорт</BS.Col>
                    <BS.Col sm={4}>
                      <BS.InputGroup>
                        <BS.FormControl type='text' value='500' />
                        <BS.InputGroup.Addon><span className='fa fa-fw fa-times-circle' /></BS.InputGroup.Addon>
                      </BS.InputGroup>
                    </BS.Col>
                  </BS.FormGroup>

                  <BS.FormGroup controlId='product'>
                    <BS.Col sm={8} componentClass={BS.ControlLabel}>Итого в месяц</BS.Col>
                    <BS.Col sm={4}>
                      <BS.FormControl.Static>100500</BS.FormControl.Static>
                    </BS.Col>
                  </BS.FormGroup>
                </BS.Form>
              )} />

              <Route path='/application/1/stage/20170506102030/person/12/kin' render={() => (
                <BS.Form>

                  <BS.FormGroup controlId='product'>
                    <BS.InputGroup>
                      <BS.DropdownButton componentClass={BS.InputGroup.Button} title='Супруг' id='zzz'>
                        <BS.MenuItem key='1'>Супруг</BS.MenuItem>
                        <BS.MenuItem key='2'>Родитель</BS.MenuItem>
                        <BS.MenuItem key='3'>Ребёнок</BS.MenuItem>
                        <BS.MenuItem key='4'>Коллега</BS.MenuItem>
                        <BS.MenuItem key='5'>Друг</BS.MenuItem>
                      </BS.DropdownButton>
                      <BS.InputGroup.Addon><Link to="/application/1/stage/20170506102030/person/12"><span className='fa fa-fw fa-pencil' /></Link></BS.InputGroup.Addon>
                      <BS.FormControl componentClass='select'>
                        <option></option>
                        <option>Абисов Абис Абисович</option>
                        <option>Абисова Абисса Абисовна</option>
                        <option>[Новое физическое лицо]</option>
                      </BS.FormControl>
                      <BS.InputGroup.Addon><span className='fa fa-fw fa-minus' /></BS.InputGroup.Addon>
                    </BS.InputGroup>
                  </BS.FormGroup>

                  <BS.ButtonToolbar>
                    <BS.DropdownButton title={<span><span className='fa fa-fw fa-plus' /> Добавить</span>} id='zzz'>
                      <BS.MenuItem key='1'>Супруг</BS.MenuItem>
                      <BS.MenuItem key='2'>Родитель</BS.MenuItem>
                      <BS.MenuItem key='3'>Ребёнок</BS.MenuItem>
                      <BS.MenuItem key='4'>Коллега</BS.MenuItem>
                      <BS.MenuItem key='5'>Друг</BS.MenuItem>
                    </BS.DropdownButton>
                  </BS.ButtonToolbar>

                </BS.Form>
              )} />

            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/person/13' render={() => (
            <div>
            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/address/2' render={() => (
            <div>
              <div>Казахстан</div>
              <div>Алматинская область</div>
              <div>Аксуйский район</div>
              <div>пос. Жансугуров</div>
              <div>Абая</div>
              <div>25</div>
              <div>кв. 2</div>
              <div>622209</div>
            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/address/13' render={() => (
            <div>
              <div>Казахстан</div>
              <div>Алматинская область</div>
              <div>Аксуйский район</div>
              <div>пос. Жансугуров</div>
              <div>Абая</div>
              <div>12</div>
              <div>кв. 13</div>
              <div>622209</div>
            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/scan/1' render={() => (
            <div>
            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/scan/2' render={() => (
            <div>
            </div>
          )} />

          <Route exact path='/application/1/stage/20170506102030/scan/3' render={() => (
            <div>
            </div>
          )} />

        </BS.Col>

      </BS.Row>
    </BS.Grid>
  )
}
