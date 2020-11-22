import React, { FC, useState, useEffect } from "react";
// URLの値を取得する
import { useParams, useHistory } from 'react-router-dom';
import firebase from '../../firebase';
import { TileDate } from "../../types/types";
import { ParamTypes } from "../../types/paramTypes";
import { createStyles, makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexWrap: "wrap",
      width: "80%",
      textAlign: "center",
      marginTop: "2%",
    },
    tileImage: {
      height: "218px",
      width: "218px",
    },
  }),
);

const ImageItemList: FC = () => {
  // TileDate型のstate: dataとそれを設定するsetData関数
  // stateの初期値は[]
  const [data, setData] = useState<TileDate[]>([]);
  // URLの値を取得する
  const { keyword } = useParams<ParamTypes>();
  // const { keyword } : any = useParams();
  // const { keyword } = useParams() as { 
  //   keyword: string;
  // }
  const classes = useStyles();
  const history = useHistory();
  
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

  return(
    <div className={classes.root}>
      {data.map((tile) => (
        <div>
          {/* onClick属性に無名関数を指定 */}
          <Button onClick={() =>
            // history.pushでURLに引数で渡した文字列を追加する
            history.push("/download/" + tile.title)
          }>
            <img className={classes.tileImage} src={tile.image} alt={tile.title} />
          </Button>
          <h3>{tile.title}</h3>
        </div>
      ))}
    </div>
  )
}

export default ImageItemList;
