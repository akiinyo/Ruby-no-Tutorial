class Integer
  ROMAN_M = %W(#{} M MM MMM)
  ROMAN_W = %W(#{} C CC CCC CD D DC DCC DCCC CM)
  ROMAN_X = %W(#{} X XX XXX XL L LX LXX LXXX XC)
  ROMAN_I = %W(#{} I II III IV V VI VII VIII IX)

  def to_roman
    roman = ''
    roman << ROMAN_M[self / 1000]
    roman << ROMAN_W[self % 1000 / 100]
    roman << ROMAN_X[self % 100 / 10]
    roman << ROMAN_I[self % 10]
  end
end

def in_range?(number)
  ('1'..'3999').include? number
end

def integral?(str)
  str =~ /^[0-9]+$/
end

def valid?(number)
  integral?(number) && in_range?(number)
end

number = ARGV[0]

if valid?(number)
  puts number.to_i.to_roman
else
  puts 'ローマ数字に変換できるのは1から3999までの整数です！'
end
