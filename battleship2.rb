class Ship
  attr_reader :name, :length, :positions
  BATTLE_FIELD = Array.new(49, 0)

  def initialize(name, length)
    @name      = name
    @length    = length
  end

  def deploy
    max = BATTLE_FIELD.length - @length

    @length.times do |i|
      head = ((0..max).to_a).sample

      @positions = if direction == 'horizontal'
        (head...(head + @length)).to_a
      else
        [head, (head + 7), (head + 7*2)]
      end

      if within_field?(@positions.last) && not_crash?(@positions)
        @positions.each {|position| BATTLE_FIELD[position] = 1 }
      else
        redo
      end
    end
  end

  def direction
    %w(horizontal vertical).sample
  end

  def within_field?(last_position)
    (last_position % 7 != 0) &&
    (last_position % 7 != 1) &&
    (last_position < 49)
  end

  def not_crash?(positions)
    BATTLE_FIELD.values_at(*positions).all? {|n| n.zero? }
  end
end

def complete?(ships)
  ships.map {|ship| ship.positions }.flatten.empty?
end

def miss?(ships, target)
  !(ships.map {|ship| ship.positions }.flatten.include? target)
end

def target(input_position)
  row = input_position.slice(0).upcase
  col = input_position.slice(1).to_i

  raise ArgumentError unless input_position.length == 2
  raise ArgumentError unless (1..7).include? col

  case row
  when 'A' then (-1 + col)
  when 'B' then (6  + col)
  when 'C' then (13 + col)
  when 'D' then (20 + col)
  when 'E' then (27 + col)
  when 'F' then (34 + col)
  when 'G' then (41 + col)
  else raise ArgumentError
  end
end

vega   = Ship.new(:vega,   3)
altair = Ship.new(:altair, 3)
deneb  = Ship.new(:deneb,  3)

ships = [vega, altair, deneb]
count = 0

ships.each {|ship| ship.deploy }

while !complete?(ships)
  print 'Please enter the shooting position：'

  begin
    input_position = gets.chomp
    count += 1
    if miss?(ships, target(input_position))
      puts 'miss'
    else
      ships.each do |ship|
        if ship.positions.delete target(input_position)
          if ship.positions.empty?
            puts "You sunk #{ship.name}!"
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
