roman_i = %W(#{} I II III IV V VI VII VIII IX)
roman_x = %W(#{} X XX XXX XL L LX LXX LXXX XC)
roman_c = %W(#{} C CC CCC CD D DC DCC DCCC CM)
roman_m = %W(#{} M MM MMM)

def can_convert?(number)
  (1..3999).include? number
end

number = ARGV[0].to_i

if can_convert?(number)
  m = number / 1000
  c = number % 1000 / 100
  x = number % 100 / 10
  i = number % 10

  print roman_m[m]
  print roman_c[c]
  print roman_x[x]
  puts roman_i[i]
else
  puts 'ローマ数字に変換できるのは1から3999までです！'
end
