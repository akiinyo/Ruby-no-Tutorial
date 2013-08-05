BATTLE_FIELD = Array.new(49, 0)

def direction
  %w(horizontal vertical).sample
end

def build_ships(ship_length)
  ships = []

  3.times do |i|
    head = ((0..46).to_a).sample
    ship_positions = positions(head, ship_length)

    if within_field?(ship_positions) && not_crash?(ship_positions)
      mark(ship_positions, i + 1)
    else
      redo
    end
  end

  3.times{|n| ships << BATTLE_FIELD.each_index.select{|i| BATTLE_FIELD[i + 1] == n + 1 }}
  ships
end

def positions(head, ship_length)
  if direction == 'horizontal'
    (head..(head + ship_length - 1)).to_a
  else
    [head, (head + 7), (head + 7*2)]
  end
end

def within_field?(positions)
  positions.last < 49
end

def not_crash?(positions)
  positions.map{|position| BATTLE_FIELD[position] }.select{|n| !n.zero? }.empty?
end

def mark(positions, num)
  positions.each{|position| BATTLE_FIELD[position] = num }
end

def target(input_position)
  row = input_position.slice(0).upcase
  col = input_position.slice(1).to_i

  case row
  when 'A' then (0 + col)
  when 'B' then (7  + col)
  when 'C' then (14 + col)
  when 'D' then (21 + col)
  when 'E' then (28 + col)
  when 'F' then (35 + col)
  when 'G' then (42 + col)
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

VEGA, ALTAIR, DENEB = build_ships(3)

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
