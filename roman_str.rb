number = '%04d' % ARGV[0]

m = %W(#{} M MM MMM)
c = %W(#{} C CC CCC CD D DC DCC DCCC CM)
x = %W(#{} X XX XXX XL L LX LXX LXXX XC)
i = %W(#{} I II III IV V VI VII VIII IX)

def can_convert?(number)
  ('0001'..'3999').include? number
end

if can_convert?(number)
  roman = ''
  [m, c, x, i].each_with_index do |digit, n|
    roman << digit[number[n].to_i]
  end
  puts roman
else
  puts 'ローマ数字に変換できるのは1から3999までです！'
end
