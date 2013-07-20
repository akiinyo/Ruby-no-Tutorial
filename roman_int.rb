class Integer
  ROMAN_M = %W(#{} M MM MMM)
  ROMAN_W = %W(#{} C CC CCC CD D DC DCC DCCC CM)
  ROMAN_X = %W(#{} X XX XXX XL L LX LXX LXXX XC)
  ROMAN_I = %W(#{} I II III IV V VI VII VIII IX)

  def to_roman
    raise RangeError unless in_range?(self)

    roman = ''
    roman << ROMAN_M[self / 1000]
    roman << ROMAN_W[self % 1000 / 100]
    roman << ROMAN_X[self % 100 / 10]
    roman << ROMAN_I[self % 10]
  end

  private

  def in_range?(number)
    (1..3999).include? number
  end
end

begin
  puts Integer(ARGV[0]).to_roman
rescue ArgumentError, RangeError
  puts 'ローマ数字に変換できるのは1から3999までの整数です！'
end
