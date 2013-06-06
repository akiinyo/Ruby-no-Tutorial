# coding: utf-8

def judge(number, call)
  bite = number & call
  eat = 0

  number.zip(call).each do |n, c|
    if n == c
      eat += 1
      bite.each do |b|
        if n == b
          bite.delete(b)
        end
      end
    end
  end

  [eat, bite.size]
end

if $0 == __FILE__
  number = ('0'..'9').to_a.shuffle.slice(0, 3)
  three_eat = false
  count = 1

  while !three_eat
    print 'コールする3桁の番号を入力してください：'

    call = gets.chomp.split('')
    eat, bite = judge(number, call)

    puts "#{eat}EAT-#{bite}BITE"

    if eat == 3
      three_eat = true
      puts "#{count}ターンかかりました"
    end

    count += 1
  end
end
