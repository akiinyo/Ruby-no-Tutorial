def next_prime(n)
  num = n.succ
  while !prime?(num)
    num += 1
  end
  num
end

def prime?(n)
  return false if n < 2

  num = 2
  n.times do
    return false if (n%num == 0) && (n != num)
    num += 1
  end
  true
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
