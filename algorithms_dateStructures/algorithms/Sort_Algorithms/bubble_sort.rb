a = [5, 3, 1, 2, 4]

def bubble_sort(a)
  l = a.length
  # l回施行する
  for i in 1..l do
    # a[l - 1]から最大値もしくは最小値が確定していく
    for j in 1..(l - i) do
      # 不等号によって昇順と降順を変更できる
      if a[j - 1] > a[j]
        a[j], a[j - 1] = a[j - 1], a[j]
      end
    end
  end
  return a
end  

p bubble_sort(a)
