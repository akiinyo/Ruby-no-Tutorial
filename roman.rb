roman = {
 'I'    => 1,
 'II'   => 2,
 'III'  => 3,
 'IV'   => 4,
 'V'    => 5,
 'VI'   => 6,
 'VII'  => 7,
 'VIII' => 8,
 'IX'   => 9,
 'X'    => 10,
 'XX'   => 20,
 'XXX'  => 30,
 'XL'   => 40,
 'L'    => 50,
 'LX'   => 60,
 'LXX'  => 70,
 'LXXX' => 80,
 'XC'   => 90,
 'C'    => 100,
 'CC'   => 200,
 'CCC'  => 300,
 'CD'   => 400,
 'D'    => 500,
 'DC'   => 600,
 'DCC'  => 700,
 'DCCC' => 800,
 'CM'   => 900,
 'M'    => 1000,
 'MM'   => 2000,
 'MMM'  => 3000
}

number = ARGV[0].to_i

def can_convert?(number)
  (0 < number) && (number < 4000)
end

if can_convert?(number)
  if roman.has_value?(number)
    puts roman.key(number)
  else
    m = number / 1000
    c = number % 1000 / 100
    x = number % 100 / 10
    i = number % 10

    puts roman.key(m * 1000) + roman.key(c * 100) + roman.key(x * 10) + roman.key(i)
  end
else
  puts 'ローマ数字に変換できるのは1から3999までです！'
end
