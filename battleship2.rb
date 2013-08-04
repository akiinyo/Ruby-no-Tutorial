BATTLE_FIELD = Array.new(49)

def direction
  %w(horizontal vertical).sample
end

def build_three_ships
  ships = []

  3.times{|i| mark_on_field(i) }
  3.times{|mark| ships << BATTLE_FIELD.each_index.select{|i| BATTLE_FIELD[i] == mark }}
  ships
end

def mark_on_field(mark)
  head = ((0..46).to_a).sample

  if direction == 'horizontal'
    3.times do |i|
      BATTLE_FIELD[head + i] = mark
    end
  else
    3.times do |i|
      if head + (7 * i) > 48
        BATTLE_FIELD[(head + (7 * i) - 49)] = mark
      else
        BATTLE_FIELD[(head + (7 * i))] = mark
      end
    end
  end
end

def target(input_position)
  row = input_position.slice(0).upcase
  col = input_position.slice(1).to_i

  case row
  when 'A' then (-1 + col)
  when 'B' then (6  + col)
  when 'C' then (13 + col)
  when 'D' then (20 + col)
  when 'E' then (27 + col)
  when 'F' then (34 + col)
  when 'G' then (41 + col)
  end
end

def complete?
  ships.map{|ship| ship[:positions] }.flatten.empty?
end

def miss?(target)
  !(ships.map{|ship| ship[:positions] }.flatten.include? target)
end

def ships
  [
    {name: 'vega',   positions: VEGA},
    {name: 'altair', positions: ALTAIR},
    {name: 'deneb',  positions: DENEB}
  ]
end

VEGA, ALTAIR, DENEB = build_three_ships


count  = 0

while !complete?
  print 'Please enter the shooting position：'

  input_position = gets.chomp
  count += 1

  if miss? target(input_position)
    puts 'miss'
  else
    ships.each do |ship|
      if ship[:positions].delete target(input_position)
        if ship[:positions].empty?
          puts "You sunk #{ship[:name]}!"
        else
          puts 'hit!'
        end
      end
    end
  end
end

puts "You threw #{count} bombs"
