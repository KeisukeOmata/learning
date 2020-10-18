import React, { FC } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import ResultPage from "./resultPage";
import TopHeader from "../components/topPage/topHeader";
import TopMain from "../components/topPage/topMain";

const TopPage: FC = () => {
  return (
    <>
      <Router>
        <Switch>
          {/* root */}
          <Route exact path="/">
            <TopHeader />
            <TopMain />
          </Route>
          <Route path="/search/:keyword" exact>
            <ResultPage />
          </Route>
        </Switch>
      </Router>
    </>
  );
}

export default TopPage;