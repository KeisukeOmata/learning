import Link from 'next/link';
import Layout from '../components/layout';
import Image from '../static/image';

export default () => (
  <Layout
    header="次へ"
    title="トップページ"
  >
    <p>
      hello world
    </p>
    <Image
      fileName="image.jpg"
      size="250"
    />
    <Link
      href="./other"
    >
      <button>
        next &gt;&gt;
      </button>
    </Link>
  </Layout>
);
