import React from 'react'
import ReactDOM from 'react-dom'

let dom = document.querySelector('#root');
let element = React.createElement(
  'p', {}, 'Hello React Application!'
);
ReactDOM.render(element, dom);