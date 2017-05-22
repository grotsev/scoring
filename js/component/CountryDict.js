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
    </li>
  );
}


function CountryList(props) {
  return (
    <ul>
      {props.countries.map((node) =>
        <Country key={node.country} role={node.country} onSelect={props.onSelect} />
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
    return (
      //<CountryList countries={props.allCountries.nodes} />
      <div>123</div>
    )
  }
}


export default createFragmentContainer(
  CountryDict,
  graphql`
  fragment CountryDict_list on Query {
    allCountries {
      nodes {
        country
      }
    }
  }
  `,
);
