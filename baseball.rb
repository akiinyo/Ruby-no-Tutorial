top     = {field: '表', point: 0}
bottom  = {field: '裏', point: 0}

class String
  def numeral?
    Integer(self)
    true
  rescue ArgumentError
    false
  end
end

def play_game(top, bottom)
  quit_flg = false

  9.times do |i|
    [top, bottom].each do |team|
      print "#{i+1}回#{team[:field]}："

      inputted = gets.chomp

      if inputted.numeral?
        team[:point] += inputted.to_i
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
end

def display_result(top_point, bottom_point)
  puts "【試合結果】"
  puts "#{top_point} 対 #{bottom_point} で"

  if top_point > bottom_point
    puts "表チームの勝ちです"
  elsif top_point == bottom_point
    puts "引き分けです！延長はありません！"
  else
    puts "裏チームの勝ちです"
  end
end

play_game(top, bottom)
display_result(top[:point], bottom[:point])
