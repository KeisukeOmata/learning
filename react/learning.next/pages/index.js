import Link from 'next/link';
import Layout from '../components/layout';

export default () => (
  <Layout header="次へ" title="トップページ">
    <p>hello world</p>
    <Link href="./other">
      <button>
        next &gt;&gt;
      </button>
    </Link>
  </Layout>
);
