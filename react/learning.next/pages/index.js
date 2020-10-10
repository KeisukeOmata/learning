import Link from 'next/link';
import style from '../static/style';

export default () => <div>
  {style}
  <h1>Next.js</h1>
  <p>hello world</p>
  <div>
    <Link href="/other">
      <button>next &gt;&gt;</button>
    </Link>
  </div>
</div>