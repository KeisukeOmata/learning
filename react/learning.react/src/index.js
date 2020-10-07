import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import Square from './square';
import State from './state';
import ListComponent from './listComponent';
import ChildComponent from './childComponent';
import FormComponent from './formComponent';
import SentenceContext from './sentenceContext';

import * as serviceWorker from './serviceWorker';

ReactDOM.render(<App />, document.getElementById('root'));
ReactDOM.render(<Square x="100" y="100" w="100" h="100" c="cyan" />, document.getElementById('square1'));
ReactDOM.render(<Square x="150" y="150" w="100" h="100" c="magenta" />, document.getElementById('square2'));
ReactDOM.render(<State />, document.getElementById('state'));
ReactDOM.render(<ListComponent />, document.getElementById('listComponent'));
ReactDOM.render(<ChildComponent />, document.getElementById('childComponent'));
ReactDOM.render(<FormComponent />, document.getElementById('formComponent'));
ReactDOM.render(<SentenceContext />, document.getElementById('sentenceContext'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();