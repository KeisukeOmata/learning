import React, { FC } from "react";
import firebase from'../../firebase';

const ImageItemList: FC = () => {
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
  }

  return(
    <>
      
    </>
  )
}


