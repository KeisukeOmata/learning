a = [1, 15, 26, 37, 48, 59, 60, 71, 82, 93, 104]

def linear_search(a, target)
  i = 0
  while i <= a.count
    p i
    if a[i] == target
      return "a[#{i}]"  
    else
      i += 1
    end
  end
end

target = 48
p linear_search(a, target)