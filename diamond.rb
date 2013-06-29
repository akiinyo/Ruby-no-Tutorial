hight = ARGV[0].to_i

1.upto(hight - 1) do |i|
  print ' ' * (hight - i)
  print '*' * ((i * 2) - 1)
  puts ''
end
