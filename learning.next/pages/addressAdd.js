import Link from 'next/link';
import Layout from '../components/Layout';
import AddressAdd from '../components/addressAdd';
import firebase from "firebase";

export default () =>(
  <Layout header="Address" title="address create.">
    <AddressAdd />
    <Link href="/address">
      <button>back</button>
    </Link>
  </Layout>
);