roman_m = %W(#{} M MM MMM)
roman_c = %W(#{} C CC CCC CD D DC DCC DCCC CM)
roman_x = %W(#{} X XX XXX XL L LX LXX LXXX XC)
roman_i = %W(#{} I II III IV V VI VII VIII IX)

def can_convert?(number)
  (1..3999).include? number
end

number = ARGV[0].to_i

if can_convert?(number)
  m = number / 1000
  c = number % 1000 / 100
  x = number % 100 / 10
  i = number % 10

  roman = ''
  roman << roman_m[m]
  roman << roman_c[c]
  roman << roman_x[x]
  roman << roman_i[i]

  puts roman
else
  puts 'ローマ数字に変換できるのは1から3999までです！'
end
