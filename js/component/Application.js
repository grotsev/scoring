import React from 'react';
import * as BS from 'react-bootstrap';
import TreeView from 'react-treeview';
import { LinkContainer } from 'react-router-bootstrap';
import {
  Route,
} from 'react-router-dom';

import ApplicationStageList from './ApplicationStageList'


export default function Application(props) {
  return (
    <BS.Grid fluid>
      <BS.Row>

        <BS.Col sm={3}>
          <BS.Nav bsStyle='pills' stacked>
            <LinkContainer to="/application/1/stage/20170506102030"><BS.NavItem>Займ</BS.NavItem></LinkContainer>
            <BS.NavDropdown title='Лица' id='person'>
              <LinkContainer to="/application/1/stage/20170506102131"><BS.MenuItem>ZZZ</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102132"><BS.MenuItem>ZZZ</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102133"><BS.MenuItem>ZZZ</BS.MenuItem></LinkContainer>
            </BS.NavDropdown>
            <LinkContainer to="/application/1/stage/20170506102230"><BS.NavItem>Адреса</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102330"><BS.NavItem>Электронное досье</BS.NavItem></LinkContainer>
            <LinkContainer to="/application/1/stage/20170506102430"><BS.NavItem>Предварительное предложение</BS.NavItem></LinkContainer>
            
            <BS.NavDropdown title='История' id='history'>
              <LinkContainer to="/application/1/stage/20170506102030"><BS.MenuItem>Привлечение</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102130"><BS.MenuItem>Заявка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102230"><BS.MenuItem>Верификация</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102330"><BS.MenuItem>Заявка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102430"><BS.MenuItem>Оценка залогового имущества</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102530"><BS.MenuItem>Юридическая проверка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102630"><BS.MenuItem>Служба безопасности</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102730"><BS.MenuItem>Управление кредитными рисками</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102830"><BS.MenuItem>КК по розничному бизнесу</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506102930"><BS.MenuItem>Кредитный комитет филиала</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506103030"><BS.MenuItem>Дополнительная юридическая экспертиза</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506103130"><BS.MenuItem>Подписание договора</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506103230"><BS.MenuItem>Регистрация залога</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506103330"><BS.MenuItem>Заявка</BS.MenuItem></LinkContainer>
              <LinkContainer to="/application/1/stage/20170506103430"><BS.MenuItem>Служба безопасности
                <BS.ButtonToolbar>
                  <BS.Button>Взять в работу</BS.Button>
                </BS.ButtonToolbar>
              </BS.MenuItem></LinkContainer>
            </BS.NavDropdown>
          </BS.Nav>
        </BS.Col>

        <BS.Col sm={9}>

            <BS.Tabs defaultActiveKey={1} id='root'>
              <BS.Tab eventKey={1} title='Займ'>Займ</BS.Tab>
              <BS.Tab eventKey={2} title='Лица'>Лица</BS.Tab>
              <BS.Tab eventKey={3} title='Адреса'>Адреса</BS.Tab>
              <BS.Tab eventKey={4} title='Электронное досье'>Электронное досье</BS.Tab>
              <BS.Tab eventKey={5} title='Предварительное предложение'>Предварительное предложение</BS.Tab>
            </BS.Tabs>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Займ</span>}>
              <div>Продукт</div>
              <div>Запрашиваемая сумма</div>
              <div><span className='node'><span className='fa fa-fw fa-user' /> Заёмщик</span>
                <BS.FormControl componentClass='select'>
                  <option>Нет</option>
                  <option>Абисов Абис Абисович</option>
                  <option>Абисова Абисса Абисовна</option>
                  <option>{'{88141234-1234-5124-9700-000012233445}'}</option>
                </BS.FormControl>
                <BS.Button><span className='fa fa-fw fa-plus' /> Создать</BS.Button>
              </div>
              <div><span className='node'><span className='fa fa-fw fa-user' /> Созаёмщик</span></div>
              <div><span className='node'><span className='fa fa-fw fa-user' /> Залогодатель</span></div>
              <div><span className='node'><span className='fa fa-fw fa-user' /> Залогодатель</span></div>
              <div><span className='node'><span className='fa fa-fw fa-user' /> Гарант</span></div>
              <div><span className='node'><span className='fa fa-fw fa-user' /> Страховщик</span></div>
            </TreeView>

            <TreeView defaultCollapsed={false} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Лица</span>}>
              <TreeView defaultCollapsed={false} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Абисов Абис Абисович</span>}>
                <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Лицо</span>}>
                  <span title='Фамилия'>Абисов</span>{' '}
                  <span title='Имя'>Абис</span>{' '}
                  <span title='Отчество'>Абисович</span>{' '}
                  <div title='ИИН'> 123456789012</div>
                  <div title='Дата рождения'>1980.01.02</div>
                  <div title='Семейное положение'>В браке</div>
                  <BS.Image width='96' height='128' title='Фотография' src='images/' />
                </TreeView>
                <TreeView defaultCollapsed={false} nodeLabel={<span className='node'><span className='fa fa-fw fa-home' /> Адреса</span>}>
                    <div>
                      <span className='fa fa-fw fa-home' /> Адрес регистрации
                      <BS.FormControl componentClass='select'>
                        <option>Нет</option>
                        <option>пос. Жансугуров, ул. Абая, 25, кв.2</option>
                        <option>пос. Жансугуров, ул. Абая, 12, кв.13</option>
                        <option>{'{88141234-1234-5124-9700-000012233445}'}</option>
                      </BS.FormControl>
                      <BS.Button><span className='fa fa-fw fa-plus' /> Создать</BS.Button>
                    </div>
                    <div><span className='fa fa-fw fa-home' /> Фактический адрес <a href='#'>пос. Жансугуров, ул. Абая, 25, кв.2</a></div>
                    <div><span className='fa fa-fw fa-home' /> Рабочий адрес <a href='#'>пос. Жансугуров, ул. Абая, 12, кв.13</a></div>
                </TreeView>
                <TreeView defaultCollapsed={true} nodeLabel={<span className='node text-danger' title='не подтверждено'>Телефоны</span>}>
                  <div className='text-muted' title='Контактный (не верифицировано)'><span className='fa fa-fw fa-phone' /> +7 701 672 22 22</div>
                  <div className='text-success' title='Домашний (подтверждено)'><span className='fa fa-fw fa-home' /> +7 701 672 22 22</div>
                  <div className='text-danger' title='Мобильный (не подтверждено)'><span className='fa fa-fw fa-mobile' /> +7 777 444 90 24</div>
                  <div className='text-warning' title='Рабочий (сомнительно)'><span className='fa fa-fw fa-industry' /> +7 777 444 90 24</div>
                </TreeView>
                <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Доходы</span>}>
                  <div>Оклад за последний месяц: 500</div>
                  <div>Средняя сумма ежемесячных доходов / Средняя сумма по справке о з/п: 500</div>
                  <div>Ежемесячный доход супруга/ги: 500</div>
                  <div>Дополнительный подтверждённый доход: 500</div>
                </TreeView>
                <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Расходы</span>}>
                  <div>По действующим кредитам</div>
                  <div>Сумма КЛ на кредитных картах</div>
                  <div>Расходы на образование (детский сад, школа, институт)</div>
                  <div>Аренда жилья</div>
                  <div>Расходы на коммунальные услуги</div>
                  <div>Расходы на услуги мобильной связи, Интернет и т.п.</div>
                  <div>Личные платежи</div>
                  <div>Алименты</div>
                  <div>Прочие расходы (лечение, помошь родственникам)</div>
                  <div>Страхование</div>
                  <div>Комиссии</div>
                  <div>Годовой налог на транспорт</div>
                  <div>Итого расходов в месяц</div>
                </TreeView>
                <TreeView defaultCollapsed={true} nodeLabel={<span className='node text-muted' title='не верифицировано'>Данные о занятости</span>}>
                </TreeView>
                <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Контактные лица</span>}>
                  <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Супруг</span>}>
                    <span title='Фамилия'>Абисова</span>{' '}
                    <span title='Имя'>Абисса</span>{' '}
                    <span title='Отчество'>Абисовна</span>{' '}
                    <div title='Контактный'><span className='fa fa-fw fa-phone' /> +7 701 672 22 22</div>
                    <div title='Домашний'><span className='fa fa-fw fa-home' /> +7 701 672 22 22</div>
                    <div title='Мобильный'><span className='fa fa-fw fa-mobile' /> +7 777 444 90 24</div>
                    <div title='Рабочий'><span className='fa fa-fw fa-industry' /> +7 777 444 90 24</div>
                  </TreeView>
                  <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Родитель</span>}>
                  </TreeView>
                  <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Ребёнок</span>}>
                  </TreeView>
                  <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Ребёнок</span>}>
                  </TreeView>
                  <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Коллега</span>}>
                  </TreeView>
                  <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Друг</span>}>
                  </TreeView>
                </TreeView>
              </TreeView>

            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-home' />Адреса</span>}>
              <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-home' /> пос. Жансугуров, ул. Абая, 25, кв.2</span>}>
                <div>Казахстан</div>
                <div>Алматинская область</div>
                <div>Аксуйский район</div>
                <div>пос. Жансугуров</div>
                <div>Абая</div>
                <div>25</div>
                <div>кв. 2</div>
                <div>622209</div>
              </TreeView>
              <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-home' /> пос. Жансугуров, ул. Абая, 12, кв.13</span>}>
                <div>Казахстан</div>
                <div>Алматинская область</div>
                <div>Аксуйский район</div>
                <div>пос. Жансугуров</div>
                <div>Абая</div>
                <div>12</div>
                <div>кв. 13</div>
                <div>622209</div>
              </TreeView>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-file' />Электронное досье</span>}>
              <div>4</div>
              <div>5</div>
            </TreeView>
            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Предварительное предложение</span>}>
              <div>Запрашиваемая сумма</div>
              <div>Сумма предложения</div>
              <div>Ставка</div>
              <div>Срок займа (месяцев)</div>
              <div>Валюта кредита</div>
              <div>Тип погашения</div>
              <div>Ежемесячный платёж</div>
              <div>Ежемесячный платёж предложения</div>
              <div>Клиент согласен: <span className='fa fa-check text-success' /> да</div>
            </TreeView>
        </BS.Col>

      </BS.Row>
    </BS.Grid>
  )
}
