import React from 'react';
import * as BS from 'react-bootstrap';
import TreeView from 'react-treeview';


export default function App(props) {
  return (
    <BS.Grid fluid>
      <BS.Row>

        <BS.Col sm={6}>
          <BS.PanelGroup defaultActiveKey='14' accordion>
            <BS.Panel eventKey='1' header='Привлечение' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
              <BS.ListGroup>
                <BS.ListGroupItem>Фамилия: Пушкин</BS.ListGroupItem>
                <BS.ListGroupItem>Имя: Александр</BS.ListGroupItem>
                <BS.ListGroupItem>Отчество: Сергеевич</BS.ListGroupItem>
              </BS.ListGroup>
            </BS.Panel>
            <BS.Panel eventKey='2' header='Заявка' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='3' header='Верификация' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='4' header='Заявка' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='5' header='Оценка залогового имущества' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='6' header='Юридическая проверка' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='7' header='Служба безопасности' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='8' header='Управление кредитными рисками' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='9' header='КК по розничному бизнесу' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='10' header='Кредитный комитет филиала' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='11' header='Дополнительная юридическая экспертиза' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='12' header='Подписание договора' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='13' header='Регистрация залога' title='2017-02-02 13:42&ndash;14:18 Иванов Иван Иванович'>
            </BS.Panel>
            <BS.Panel eventKey='14' bsStyle='primary' header='Заявка'>
              <BS.ListGroup>
                <BS.ListGroupItem header='ИИН'>123456789012</BS.ListGroupItem>
                <BS.ListGroupItem header='Сервис налогового комитета'>
                  <BS.ListGroup>
                    <BS.ListGroupItem header='Фамилия'>Пушкин</BS.ListGroupItem>
                    <BS.ListGroupItem header='Имя'>Александр</BS.ListGroupItem>
                    <BS.ListGroupItem header='Отчество'>Сергеевич</BS.ListGroupItem>
                  </BS.ListGroup>
                </BS.ListGroupItem>
                <BS.ListGroupItem header='Фамилия'>Пушкин</BS.ListGroupItem>
                <BS.ListGroupItem header='Имя'>Александр</BS.ListGroupItem>
                <BS.ListGroupItem header='Отчество'>Сергеевич</BS.ListGroupItem>
                <BS.ListGroupItem header='Продукт'>Кредит</BS.ListGroupItem>
                <BS.ListGroupItem header='Валюта'>KZT</BS.ListGroupItem>
                <BS.ListGroupItem header='Запрашиваемая сумма'>100&nbsp;000</BS.ListGroupItem>
                <BS.ListGroupItem>Доходы
                  <BS.ListGroup>
                    <BS.ListGroupItem>Оклад за последний месяц: 500</BS.ListGroupItem>
                    <BS.ListGroupItem>Средняя сумма ежемесячных доходов / по справке о з/п: 500</BS.ListGroupItem>
                  </BS.ListGroup>
                </BS.ListGroupItem>
              </BS.ListGroup>
              <BS.ButtonToolbar>
                <BS.Button bsStyle='primary'>Далее</BS.Button>
                <BS.Button disabled>Завершить работу</BS.Button>
                <BS.Button>Отменить изменения</BS.Button>
              </BS.ButtonToolbar>
            </BS.Panel>
            <BS.Panel eventKey='15' bsStyle='primary' header='Служба безопасности'>
              <BS.ButtonToolbar>
                <BS.Button bsStyle='primary'>Взять в работу</BS.Button>
              </BS.ButtonToolbar>
            </BS.Panel>
          </BS.PanelGroup>
        </BS.Col>

        <BS.Col sm={6}>
            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Информация по займу</span>}>
              <div>Продукт</div>
              <div>Запрашиваемая сумма</div>
            </TreeView>

            <TreeView defaultCollapsed={false} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Заёмщик</span>}>
              <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Лицо</span>}>
                <span title='Фамилия'>Абисов</span>{' '}
                <span title='Имя'>Абис</span>{' '}
                <span title='Отчество'>Абисович</span>{' '}
                <div title='ИИН'> 123456789012</div>
                <div title='Дата рождения'>1980.01.02</div>
                <div title='Семейное положение'>В браке</div>
                <BS.Image width='96' height='128' title='Фотография' src='images/' />
              </TreeView>
              <TreeView defaultCollapsed={true} nodeLabel={<span className='node text-danger' title=' (не подтверждено)'>Адреса</span>}>
                  <div className='text-success' title='Адрес регистрации (подтверждено)'>
                    <span className='fa fa-fw fa-id-card' />{' '}
                    <span>Казахстан</span>,{' '}
                    <span>Алматинская область</span>,{' '}
                    <span>Аксуйский район</span>,{' '}
                    <span>пос. Жансугуров</span><br />
                    <span>Абая, 25, кв. 2</span>,{' '}
                    <span>622209</span>
                  </div>
                  <div className='text-danger' title='Фактический адрес (не подтверждено)'>
                    <span className='fa fa-fw fa-home' />{' '}
                    <span>Казахстан</span>,{' '}
                    <span>Алматинская область</span>,{' '}
                    <span>Аксуйский район</span>,{' '}
                    <span>пос. Жансугуров</span><br />
                    <span>Абая, 25, кв. 2</span>,{' '}
                    <span>622209</span>
                  </div>
                  <div className='text-warning' title='Рабочий адрес'>
                    <span className='fa fa-fw fa-industry' />{' '}
                    <span>Казахстан</span>,{' '}
                    <span>Алматинская область</span>,{' '}
                    <span>Аксуйский район</span>,{' '}
                    <span>пос. Жансугуров</span><br />
                    <span>Абая, 25, кв. 2</span>,{' '}
                    <span>622209</span>
                  </div>
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
              <TreeView defaultCollapsed={false} nodeLabel={<span className='node text-muted' title='не верифицировано'>Данные о занятости</span>}>
              </TreeView>
              <TreeView defaultCollapsed={false} nodeLabel={<span className='node'>Контактные лица</span>}>
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

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Созаёмщик</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Залогодатель</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Залогодатель</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Гарант</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-user' /> Страховщик</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'><span className='fa fa-fw fa-users' /> Лица</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Адреса</span>}>
            </TreeView>

            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Электронное досье</span>}>
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
