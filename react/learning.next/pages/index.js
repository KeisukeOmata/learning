import Link from 'next/link';

export default () => <div>
  <h1>Next.js</h1>
  <p>hello world</p>
  <div>
    <Link href="/other">
      <button>next &gt;&gt;</button>
    </Link>
  </div>
</div>