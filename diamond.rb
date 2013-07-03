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


def line(n, hight)
  ('*' * ((n * 2) - 1)).center((hight * 2) - 1)
end

1.upto(midpoint - 1) do |n|
  puts line(n, midpoint)
end

midpoint.downto(1) do |n|
  puts line(n, midpoint)
end
