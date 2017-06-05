import React from 'react';
import * as BS from 'react-bootstrap';
import TreeView from 'react-treeview';


export default function App(props) {
  return (
    <BS.Grid fluid>
      <BS.Row>

        <BS.Col sm={6}>
            
            <TreeView defaultCollapsed={true} nodeLabel={<span className='node'>Этап</span>}>
              <div>Заявка</div>
              <div>Служба безопасности</div>
            </TreeView>

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

        <BS.Col sm={6}>

        </BS.Col>

      </BS.Row>
    </BS.Grid>
  )
}
