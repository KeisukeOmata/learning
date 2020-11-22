import Link from 'next/link';
import Layout from '../components/layout';
import Calc from '../components/calc';

const Calculator = () => (
  <Layout
    header="Calc"
    title="calculator">
    <Calc />
    <div>
      <Link href="/">
        <button>&lt;&lt;Top</button>
      </Link>
    </div>
  </Layout>
 );

export default Calculator