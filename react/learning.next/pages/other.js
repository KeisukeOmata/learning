import Link from 'next/link'
import Layout from '../components/layout';

export default () => (
  <Layout header="最後" title="最後のページ">
    <p>hello onother world</p>
    <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
)