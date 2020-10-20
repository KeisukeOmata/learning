import React, { FC, useState, useEffect } from "react";
// URLの値を取得する
import { useParams } from 'react-router-dom';
import firebase from '../../firebase';
import { TileDate } from "../../types/types";

const ImageItemList: FC = () => {
  // TileDate型のstate: dataとそれを設定するsetData関数
  // stateの初期値は[]
  const [data, setData] = useState<TileDate[]>([]);
  // URLの値を取得する
  const { keyword } = useParams();

  // asyncで非同期処理
  const getData = async (searchWord: string | undefined) => {
    const db = firebase.firestore();
    // Cloud Firestoreからデータを取得する
    const tileDataRef = db.collection("tileData");
    // where(フィールド, 比較演算, 指定する文字列)
    const searchedData = tileDataRef.where("keyword", "array-contains", searchWord);
    // awaitの処理が終わるまで、他の処理は行われない
    const snapShot = await searchedData.get();
    const temporaryData: object[] = [];
    // Cloud Firestoreから取得した値を配列に格納
    snapShot.docs.map(doc => {
      temporaryData.push(doc.data());
    })
    // temporaryDataをobjectの配列型からTileDateの配列型に変換してstateに設定
    setData(temporaryData as TileDate[]);
  }

  // レンダリングが終わった後に呼ばれるhook
  useEffect(() => { 
    getData(keyword);
  // 空の配列を渡すとレンダリング後、1度だけ呼ばれる
  }, []);

  return(
    <div>
      {data.map((tile) => (
        <div>
          <img src={tile.image} alt={tile.title}/>
        </div>
      ))}
    </div>
  )
}

export default ImageItemList;


