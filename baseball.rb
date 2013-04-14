class String
  def numeral?
    Integer(self)
    true
  rescue ArgumentError
    false
  end
end

def play_game(points)
  top_point, bottom_point = [], []

  points.each_with_index do |point, i|
    team = i.even? ? top_point : bottom_point
    team << point
  end

  [top_point.inject(:+), bottom_point.inject(:+)]
end

def display_result(top_point, bottom_point)
  top_point    = 0 if top_point.nil?
  bottom_point = 0 if bottom_point.nil?

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

if $0 == __FILE__
  top      = {field: '表', point: 0}
  bottom   = {field: '裏', point: 0}

  points   = []
  quit_flg = false

  9.times do |i|
    [top, bottom].each do |team|
      print "#{i+1}回#{team[:field]}："

      inputted = gets.chomp

      if inputted.numeral?
        points << inputted.to_i
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

  top_point, bottom_point = play_game(points)
  display_result(top_point, bottom_point)
end
