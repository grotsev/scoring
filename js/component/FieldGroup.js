import React from 'react';

import * as BS from 'react-bootstrap';

export default function FieldGroup({ id, label, help, clearable, ...props }) {
  return (
    <BS.FormGroup controlId={id}>
      {label && <BS.ControlLabel>{label}</BS.ControlLabel>}
      {' '}
      <BS.InputGroup>
        <BS.FormControl {...props} />
        {clearable && <BS.InputGroup.Button><BS.Button><BS.Glyphicon glyph='remove-sign' /></BS.Button></BS.InputGroup.Button>}
      </BS.InputGroup>
      {help && <HelpBlock>{help}</HelpBlock>}
    </BS.FormGroup>
  );
}
