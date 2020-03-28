a = [5, 3, 1, 2, 4]

def selection_sort(a)
  l = a.length 
  # l回施行する
  for i in 1..l do
    min = a[i - 1] 
    min_n = i - 1  
    # a[0]から最大値または最小値が確定していく
    for j in  i..(l - 1) do
      # 不等号によって昇順と降順を変更できる
      if min > a[j]  
        min = a[j]  
        min_n = j 
      end
    end
    a[i - 1], a[min_n] = min, a[i - 1]
  end
  return a
end

p selection_sort(a)