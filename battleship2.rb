BATTLE_FIELD = Array.new(49, 0)

def direction
  %w(horizontal vertical).sample
end

def build_ships(ship_names, ship_length)
  mark_on_field(ship_names.size, ship_length)

  ship_names.each_with_index.map do |name, n|
    ship_positions = BATTLE_FIELD.each_index.select {|i| BATTLE_FIELD[i + 1] == n + 1 }

    {name: name, positions: ship_positions}
  end
end

def mark_on_field(number, ship_length)
  number.times do |i|
    head = ((0..46).to_a).sample
    ship_positions = positions(head, ship_length)

    if within_field?(ship_positions) && not_crash?(ship_positions)
      ship_positions.each {|position| BATTLE_FIELD[position] = i + 1 }
    else
      redo
    end
  end
end

def positions(head, ship_length)
  if direction == 'horizontal'
    (head...(head + ship_length)).to_a
  else
    [head, (head + 7), (head + 7*2)]
  end
end

def within_field?(positions)
  positions.last < 49
end

def not_crash?(positions)
  BATTLE_FIELD.values_at(*positions).all? {|n| n.zero? }
end

def target(input_position)
  row = input_position.slice(0).upcase
  col = input_position.slice(1).to_i

  raise ArgumentError unless input_position.length == 2
  raise ArgumentError unless (1..7).include? col

  case row
  when 'A' then (0 + col)
  when 'B' then (7  + col)
  when 'C' then (14 + col)
  when 'D' then (21 + col)
  when 'E' then (28 + col)
  when 'F' then (35 + col)
  when 'G' then (42 + col)
  else raise ArgumentError
  end
end

def complete?(ships)
  ships.map {|ship| ship[:positions] }.flatten.empty?
end

def miss?(ships, target)
  !(ships.map {|ship| ship[:positions] }.flatten.include? target)
end


ships = build_ships(%w(vega altair deneb), 3)
count = 0

while !complete?(ships)
  print 'Please enter the shooting position：'

  begin
    input_position = gets.chomp
    count += 1
    if miss?(ships, target(input_position))
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
  rescue ArgumentError
    puts 'please enter within A1-G7'
  end

end

puts "You threw #{count} bombs"
