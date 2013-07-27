row = %w(A B C D E F G)
col = %w(1 2 3 4 5 6 7)

head_row = row.sample

if head_row > 'E'
  head_col = col[0..4].sample
else
  head_col = col.sample
end

orion = [[head_row, head_col]]

if head_row > 'E'
  direction = 'horizontal'
elsif head_col > '5'
  direction = 'vertical'
else
  direction = %w(vertical horizontal).sample
end

if direction == 'vertical'
  orion << [row[row.index(orion[0][0]).succ], orion[0][1]]
  orion << [row[row.index(orion[0][0]).succ.succ], orion[0][1]]
else
  orion << [orion[0][0], orion[0][1].succ]
  orion << [orion[0][0], orion[0][1].succ.succ]
end

while !orion.empty?
  target = []

  print 'Please enter the shooting position：'

  gets.chomp.chars{|char| target << char.upcase }

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
