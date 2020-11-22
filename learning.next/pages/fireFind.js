import Link from 'next/link'
import Layout from '../components/Layout';
import FireFind from '../components/fireFind';

const Firefind = () => (
  <Layout header="Fire" title="Sample data.">
    <FireFind />
    <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
);

export default Firefind;