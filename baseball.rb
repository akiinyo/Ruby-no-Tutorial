class String
  def numeral?
    Integer(self)
    true
  rescue ArgumentError
    false
  end
end

def play_game(io)
  top      = {field: '表', point: []}
  bottom   = {field: '裏', point: []}

  quit_flg = false
  9.times do |i|
    [top, bottom].each do |team|
      print "#{i+1}回#{team[:field]}："

      inputted = io.gets.chomp

      if inputted.numeral?
        team[:point] << inputted.to_i
      elsif inputted == 'quit'
        quit_flg = true
        break
      else
        puts 'oh(∵)数字を入力してください。'
        redo
      end
    end
    break if quit_flg
  end

  [top[:point], bottom[:point]]
end

def display_result(top_point, bottom_point)
  top, bottom = [top_point.inject(0, :+), bottom_point.inject(0, :+)]

  puts "【試合結果】"
  puts "#{top} 対 #{bottom} で"

  if top > bottom
    puts "表チームの勝ちです"
  elsif top == bottom
    puts "引き分けです！延長はありません！"
  else
    puts "裏チームの勝ちです"
  end
end

if $0 == __FILE__
  top_point, bottom_point = play_game(STDIN)
  display_result(top_point, bottom_point)
end
