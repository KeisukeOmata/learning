import React, { Component } from 'react';
import Head from 'next/head';
import Header from '../components/header';
import Footer from '../components/footer';
import style from '../static/style';

// レイアウトコンポーネント
// 各コンポーネントをimport
// static/styleをimport
// ここでスタイルを纏める
class Layout extends Component {
  render() {
    return (
      <div>
        {/* <head>の設定 */}
        <Head>
          <title>{this.props.title}</title>
          <meta charSet='utf-8' />
          <meta name='viewport' content='initial-scale=1.0, width=device-width' />
        </Head>
        {/* スタイルシートの読み込み */}
        {style}
        <Header
          header={this.props.header}
          title={this.props.title}
        />
        {this.props.children}
        <Footer
          footer="2020 omata keisuke"
        />
      </div>
    );
  };
};

export default Layout;