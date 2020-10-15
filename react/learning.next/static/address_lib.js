// 共通処理をクラス化
class Lib {
  static deepcopy(val) {
    // JSON.parseでJSONオブジェクトに変換
    // JSON.stringifyでjsのオブジェクトや値をJSON文字列に変換
    return JSON.parse(JSON.stringify(val));
  }

  // firebaseでは . # $ [ ] が保存できない
  // メールアドレスの.を＊に置換する
  static encodeEmail(val) {
    return val.split(".").join("*");
  }

  // メールアドレスの*を.に置換する
  static decodeEmail(val) {
    return val.split("*").join(".");
  }
}

export default Lib;