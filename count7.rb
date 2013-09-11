def calculate(num)
  count = 0

  ('1'..num).each do |n|
    count += 1 if n.include?('7')
  end
  count
end
