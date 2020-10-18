import Link from 'next/link';
import Layout from '../components/Layout';
import AddressShow from '../components/addressShow';
import firebase from "firebase";

const addressShow = () =>(
  <Layout header="Address" title="address book.">
    <AddressShow />
    <div>
      <Link href="/address">
        <button>back</button>
      </Link>
    </div>
  </Layout>
);

export default addressShow;