ROW = %w(A B C D E F G)
COL = %w(1 2 3 4 5 6 7)

def build_head
  head_row = ROW.sample
  head_col = head_row > 'E' ? COL[0..4].sample : COL.sample

  [head_row, head_col]
end

def direction(head_row, head_col)
  return 'horizontal' if head_row > 'E'
  return 'vertical'   if head_col > '5'

  %w(vertical horizontal).sample
end

def build_ship_by_head(head)
  ship = [head]

  if direction(head[0], head[1]) == 'vertical'
    ship << [ROW[ROW.index(head[0]).succ], head[1]]
    ship << [ROW[ROW.index(head[0]).succ.succ], head[1]]
  else
    ship << [head[0], head[1].succ]
    ship << [head[0], head[1].succ.succ]
  end
end

orion = build_ship_by_head(build_head)
count = 0

while !orion.empty?
  target = []

  print 'Please enter the shooting position：'

  gets.chomp.chars{|char| target << char.upcase }
  count += 1

  if orion.include?(target)
    orion.delete(target)
    if orion.empty?
      puts 'You sunk orion!'
    else
      puts 'hit!'
    end
  else
    puts 'miss'
  end
end

puts "You threw #{count} bombs"
