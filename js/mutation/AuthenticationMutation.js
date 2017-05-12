
import {
  commitMutation,
  graphql,
} from 'react-relay';
import {ConnectionHandler} from 'relay-runtime';

const mutation = graphql`
  mutation AuthenticationMutation($input: AuthenticateInput!) {
    authenticate(input: $input) {
      jwtToken
    }
  }
`;

function commit(
  environment,
  login,
  password
) {
  return commitMutation(
    environment,
    {
      mutation,
      variables: {
        input: {login, password}
      },
      onCompleted: (response) => {
        var token = response.authentication.jwtToken;
        console.info(token);
        localStorage.setItem('jwt_token', token)
      }
    }
  );
}

export default {commit};
