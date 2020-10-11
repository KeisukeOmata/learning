import Link from 'next/link'
import Layout from '../components/layout';
import Counter from '../components/counter';

const Other = () => (
  <Layout header="最後" title="最後のページ">
    <p>hello onother world</p>
    {/* <Counter /> */}
    <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
);

export default Other;