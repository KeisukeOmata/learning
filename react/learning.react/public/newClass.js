import object from './class.js';
export default class extends object {
  // プロパティは継承元で定義されている
  print(){
    return '<p>new RED: ' + this.red + '</p>'
      + '<p>new GREEN:' + this.green + '</p>'
      + '<p>new BLUE: ' + this.blue + '</p>';
  }
};