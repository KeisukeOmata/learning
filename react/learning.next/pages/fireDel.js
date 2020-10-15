import Link from 'next/link'
import Layout from '../components/Layout';
import FireDel from '../components/fireDel';

const fireDel = () => (
  <Layout header="Fire" title="delete data.">
    <FireDel />
    <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
);

export default fireDel;