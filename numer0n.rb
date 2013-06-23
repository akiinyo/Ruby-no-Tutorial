# coding: utf-8

class Numer0n
  attr_accessor :number, :eat, :bite, :count
  DIGIT = 3

  def initialize
    @number = ('0'..'9').to_a.sample(DIGIT)
    @count  = 0
  end

  def judge(call)
    @bite = @number & call
    @eat  = 0

    @number.zip(call).each do |n, c|
      if n == c
        @eat += 1
        @bite.delete_if {|b| n == b }
      end
    end

    @count += 1
    @bite = @bite.size

    return @eat, @bite
  end

  def valid?(call)
    (call.size == DIGIT) && (call.size == call.uniq.size)
  end

  def display_result
    "#{@eat}EAT-#{@bite}BITE"
  end

  def perfect?
    @eat == DIGIT
  end
end

if $0 == __FILE__
  numer0n = Numer0n.new

  while !numer0n.perfect?
    print 'コールする3桁の番号を入力してください：'
    call = gets.chomp.split('')
    if numer0n.valid?(call)
      numer0n.judge(call)
      puts numer0n.display_result

      if numer0n.perfect?
        puts "#{numer0n.count}ターンかかりました。"
        puts '練習を続けますか？続ける場合は1を、終了する場合には2を入力してください。'

        case gets.chomp
        when '1'
          numer0n = Numer0n.new
          puts '新しい番号を作成しました。'
        when '2'
          puts '終了します。おつかれさまでした。'
        else
          puts 'ぺろーん。'
        end
      end

    else
      puts '( ∵)コールできるのは *重複のない3桁* の番号だけです(∵ )'
    end
  end
end
