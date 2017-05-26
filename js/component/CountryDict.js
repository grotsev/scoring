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
    <li onClick={(event) => {props.onSelect(props.role)}}>
      {props.node.country}
    </li>
  );
}


function CountryList(props) {
  return (
    <ul>
      {props.countries.map((node) =>
        <Country key={node.country} node={node} onSelect={props.onSelect} />
      )}
    </ul>
  );
}


CountryList.propTypes = {
  countries: PropTypes.arrayOf(
    PropTypes.shape({
      country: PropTypes.string.isRequired,
    }).isRequired
  ).isRequired,
  onSelect: PropTypes.func.isRequired,
};


class CountryDict extends React.Component {

  render() {
    return <CountryList countries={this.props.query.allCountries.nodes} />
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
