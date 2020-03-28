# 昇順か降順でソートしてある前提
a = [1, 15, 26, 37, 48, 59, 60, 71, 82, 93, 104]

def binary_serch(a, target)
  first = 0
  last = a.count - 1
  while first <= last
    middle = (first + last) / 2
    if a[middle] == target
      return "a[#{middle}]"
    elsif a[middle] < target
      # 1周目であれば、[60, 71, 82, 93, 104]の配列で2周目に
      first = middle + 1
    else
      # 1周目であれば、[1, 15, 26, 37, 48]の配列で2周目に
      last = middle - 1
    end
  end
  return "not found"
end

target = 71
p binary_serch(a, target)