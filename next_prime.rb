def next_prime(n)
  num = n.succ
  while !prime?(num)
    num += 1
  end
  num
end

def prime?(num)
  return false if num < 2

  (2...num).all? {|n| num%n != 0 }
end

if $0 == __FILE__
  begin
    puts next_prime(Integer(ARGV[0]))
  rescue ArgumentError
    puts '入力できるのは数字のみです。'
  rescue TypeError
    puts '数字を入力してください。'
  end
end
