import React, { FC, useEffect, useState } from "react";
import { useParams } from 'react-router-dom';
import { createStyles, makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import firebase from '../firebase';
import TopHeader from "../components/topPage/topHeader";
import { TileDate } from "../types/types";
import { ParamTypes } from "../types/paramTypes";

const useStyles = makeStyles(() =>
  createStyles({
    tileImage: {
      height: "436px",
      width: "436px",
    },
    main: {
      textAlign: "center",
      marginTop: "5%",
    },
  })
);

const DownloadPage: FC = () => {
  const { keyword } = useParams<ParamTypes>();
  const classes = useStyles();
  const [data, setData] = useState<TileDate[]>([]);
  
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
    setData(temporaryData as TileDate[]);
  }

  // レンダリングが終わった後に呼ばれるhook
  useEffect(() => { 
    getData(keyword);
  // 空の配列を渡すとレンダリング後、1度だけ呼ばれる
  }, []);

  const displayImage = () => {
    return (
      <div>
        {data.map((tile) => (
          <div>
            <img className={classes.tileImage} src={tile.image} alt={tile.title} />
          </div>
        ))}
      </div>
    )
  }

  const downloadButton = () => {
    return (
      <div>
        {data.map((tile) => (
          // variant="contained"で立体的なボタン
          <Button variant="contained" href={tile.downloadURL}>
            無料ダウンロード
          </Button>
        ))}
      </div>
    )
  }
  

    return (
    <div>
      <TopHeader />
      <div className={classes.main}>  
        {displayImage()}
        {downloadButton()}
      </div>
    </div>
  )
}

export default DownloadPage;