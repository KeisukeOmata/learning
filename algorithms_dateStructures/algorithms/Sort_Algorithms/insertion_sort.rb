a = [5, 3, 1, 2, 4]

def insertion_sort(a)
  l = a.length
  # l - 1回施行する
  for i in 1..(l - 1) do
    n = a[i]
    j = i - 1
    while j >= 0
      # 不等号によって昇順と降順を変更できる
      if n > a[j]
        a[j], a[j+1] = a[j+1], a[j]
      end
      j -= 1
    end
  end
  return a
end

p insertion_sort(a)