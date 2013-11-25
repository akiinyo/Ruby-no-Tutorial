def prime?(n)
  num = 2
  n.times do
    return false if (n%num == 0) && (n != num)
    num += 1
  end
  true
end
