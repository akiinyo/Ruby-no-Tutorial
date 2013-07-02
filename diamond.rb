midpoint = ARGV[0].to_i

1.upto(midpoint - 1) do |i|
  print ' ' * (midpoint - i)
  print '*' * ((i * 2) - 1)
  puts ''
end

midpoint.downto(1) do |i|
  print ' ' * (midpoint - i)
  print '*' * ((i * 2) - 1)
  puts ''
end
