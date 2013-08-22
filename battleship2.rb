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

class BattleShipGame
  attr_reader :count

  def initialize(ships)
    @ships = ships
    @count = 0
  end

  def start
    @ships.each {|ship| ship.deploy }
  end

  def complete?
    @ships.map {|ship| ship.positions }.flatten.empty?
  end

  def judge(position)
    @count += 1

    if miss?(target(position))
      'miss'
    else
      @ships.each do |ship|
        if hit(ship, position)
          if ship.positions.empty?
            return "hit! You sunk #{ship.name}!"
          else
            return 'hit!'
          end
        end
      end
    end
  end

  def miss?(target)
    !(@ships.map {|ship| ship.positions }.flatten.include? target)
  end

  def hit(ship, position)
    ship.positions.delete(target(position))
  end

  def target(position)
    row = position.slice(0).upcase
    col = position.slice(1).to_i

    raise ArgumentError unless position.length == 2
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
end

game = BattleShipGame.new([
  Ship.new(:vega, 3),
  Ship.new(:altair, 3),
  Ship.new(:deneb, 3)
])
game.start

while !game.complete?
  print 'Please enter the shooting position：'
  begin
    puts game.judge(gets.chomp)
  rescue ArgumentError
    puts 'please enter within A1-G7'
  end
end

puts "You threw #{game.count} bombs"
