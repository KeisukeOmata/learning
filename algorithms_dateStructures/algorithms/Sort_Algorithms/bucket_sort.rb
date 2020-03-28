a = [5, 3, 1, 2, 4, 18, 0, 29, 11, 8]

def bucket_sort(a)
  l = a.length
  # バケツを配列内の最大値(m)プラス1個(0の分)用意
  b = []
  m = a.max
  for i in 0..m do
    b[i] = 0
  end
  # 配列内の値(n)に対応するバケツ(b[n])に1を代入
  for j in 1..l do
    n = a[j - 1]
    b[n] = 1
  end
  # あとは1が代入されているインデックス番号を配列に再代入するだけ
  index = 0
  for k in 0..m do
    if b[k] == 1
      a[index] = k
      index += 1
    end
  end
  return a
end

p bucket_sort(a)