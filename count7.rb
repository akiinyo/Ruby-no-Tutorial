def count7(input, output)
  output.print '整数を入力してください:'
  num = input.gets.chomp
  output.puts "#{calculate(num)}個"
end

def calculate(num)
  count = 0

  ('1'..num).each do |n|
    count += 1 if n.include?('7')
  end
  count
end

if $0 == __FILE__
  count7(STDIN, STDOUT)
end
