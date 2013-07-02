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


1.upto(midpoint - 1) do |i|
  puts ('*' * ((i * 2) - 1)).center((midpoint * 2) - 1)
end

midpoint.downto(1) do |i|
  puts ('*' * ((i * 2) - 1)).center((midpoint * 2) - 1)
end
