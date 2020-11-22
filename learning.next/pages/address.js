import Link from 'next/link';
import Layout from '../components/layout';
import Address from '../components/address';

const address = () =>(
  <Layout header="Address" title="address book.">
    <Address />
      <Link href="/addressAdd">
        <button>add</button>
      </Link>
      <br></br>
      <Link href="/">
      <button>&lt;&lt; back</button>
    </Link>
  </Layout>
);

export default address;