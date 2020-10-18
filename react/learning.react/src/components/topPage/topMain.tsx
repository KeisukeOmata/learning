import React, { FC, useState } from 'react';
import { useHistory } from 'react-router-dom';
import { createStyles, makeStyles } from '@material-ui/core/styles';
import IconButton from '@material-ui/core/IconButton';
import Paper from '@material-ui/core/Paper';
import InputBase from '@material-ui/core/InputBase';
import SearchIcon from '@material-ui/icons/Search';
import pencil from "../../assets/images/pencil.png";

const useStyle = makeStyles(() =>
  createStyles({
    background: {
      backgroundImage: `url(${pencil})`,
      backgroundSize: 'cover', 
      height: '100vh'
    },
    paper: {
      position: 'relative',
      marginLeft: "auto",
      marginRight: "auto",
      top: "33%",
      width: "45%",
    },
  }),
)

const TopMain: FC = () => {
  const classes = useStyle();
  // react-router-dom
  const history = useHistory();
  const [keyword, setKeyword] = useState("")

  // 画面遷移
  const handleSubmit = () => {
    history.push("/search/" + keyword);
  }
  

  // 入力値をstateに設定
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setKeyword(event.target.value);
  }

  return (
    <div className={classes.background}>
      <Paper className={classes.paper} component="form" onSubmit={handleSubmit}>
        <IconButton type="submit">
          <SearchIcon />
        </IconButton>
        <InputBase placeholder="検索" onChange={handleChange} />
      </Paper>
    </div>
  )
}

export default TopMain;