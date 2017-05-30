import React from 'react';

import {FormGroup, FormControl, ControlLabel, InputGroup, Button, Glyphicon} from 'react-bootstrap';


export default function FieldGroup({ id, label, help, clearable, ...props }) {
  return (
    <FormGroup controlId={id}>
      {label && <ControlLabel>{label}</ControlLabel>}
      {' '}
      <InputGroup>
        <FormControl {...props} />
        {clearable && <InputGroup.Button><Button><Glyphicon glyph='remove-sign' /></Button></InputGroup.Button>}
      </InputGroup>
      {help && <HelpBlock>{help}</HelpBlock>}
    </FormGroup>
  );
}
