import React from 'react';
import PropTypes from 'prop-types';
import {
  Route,
} from 'react-router-dom';
import {
  createFragmentContainer,
  graphql,
} from 'react-relay';


function Country(props) {
  return (
    <tr onClick={(event) => {props.onSelect(props.node.country)}}>
      <td>{props.node.country}</td>
    </tr>
  );
}


function CountryTable(props) {
  return (
    <table>
      <thead>
        <tr>
          <th>Country</th>
        </tr>
      </thead>
      <tbody>
        {props.countries.map((node) =>
          <Country key={node.country} node={node} onSelect={props.onSelect} />
        )}
      </tbody>
    </table>
  );
}

CountryTable.propTypes = {
  countries: PropTypes.arrayOf(
    PropTypes.shape({
      country: PropTypes.string.isRequired,
    }).isRequired
  ).isRequired,
  onSelect: PropTypes.func.isRequired,
};


class CountryDict extends React.Component {

  _handleSelect = (country) => {
    alert(country);
  }

  render() {
    return <CountryTable countries={this.props.query.allCountries.nodes} onSelect={this._handleSelect} />
  }
}


export default createFragmentContainer(CountryDict, {
  query: graphql`
    fragment CountryDict_query on Query {
      allCountries {
        nodes {
          country
        }
      }
    }
  `,
});
