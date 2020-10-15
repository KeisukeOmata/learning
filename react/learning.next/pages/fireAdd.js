import Link from 'next/link'
import Layout from '../components/Layout';
import FireAdd from '../components/fireAdd';

const fireAdd = () =>(
  <Layout header="Fire" title="add data.">
    <FireAdd />
    <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
 );

export default fireAdd