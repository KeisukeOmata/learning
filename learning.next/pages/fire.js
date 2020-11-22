import Link from 'next/link';
import Layout from '../components/Layout';
import Sampledata from '../components/sampleData';

const SampleData = () => (
  <Layout header="Fire" title="Sample data.">
    <Sampledata />
    <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
);

export default SampleData;