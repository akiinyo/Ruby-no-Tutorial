class String
  def numeral?
    Integer(self)
    true
  rescue ArgumentError
    false
  end

  def last(n = 1)
    self.reverse[0, n]
  end
end

def perform_count7(input, output)
  output.print '整数を入力してください:'
  num = input.gets.chomp

  if num.numeral?
    output.puts "#{count7(num)}個"
  else
    output.puts 'ぶー'
  end
end

def count7(num)
  ('1'..num).to_a.count {|n| n.last(2).include?('7') }
end

if $0 == __FILE__
  perform_count7(STDIN, STDOUT)
end
