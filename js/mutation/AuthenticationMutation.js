
import {
  commitMutation,
  graphql,
} from 'react-relay';
import {ConnectionHandler} from 'relay-runtime';

const mutation = graphql`
  mutation AuthenticationMutation($input: AuthenticationInput!) {
    authentication(input: $input) {
      staffSession {
        token
        login
        role
      }
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
        var token = response.authentication.staffSession.token;
        console.info(token);
        localStorage.setItem('jwt_token', token)
      }
    }
  );
}

export default {commit};
