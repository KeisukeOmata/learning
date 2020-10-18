import Link from 'next/link';
import Counter from '../components/counter';
import Layout from '../components/layout';
import Image from '../static/image';

const Index = () => (
  <Layout header="次へ" title="トップページ">
    <p> hello world</p>
    {/* <Counter /> */}
    <Image fileName="image.jpg" size="250"/>
    <br></br>
    <Link href="./other">
      <button>next &gt;&gt;</button>
    </Link>
    <br></br>
    <Link href="./fire">
      <button>firebase &gt;&gt;</button>
    </Link>
    <br></br>
    <Link href="./fireFind">
      <button>Find &gt;&gt;</button>
    </Link>
    <br></br>
    <Link href="./fireAdd">
      <button>add &gt;&gt;</button>
    </Link>
    <br></br>
    <Link href="./fireDel">
      <button>delete &gt;&gt;</button>
    </Link>
    <br></br>
    <Link href="./address">
      <button>address &gt;&gt;</button>
    </Link>
  </Layout>
);

export default Index;