class Ship
  attr_reader :name, :length, :positions

  def initialize(name, length = 3)
    @name   = name
    @length = length
  end

  def deploy(battle_field)
    max = battle_field.length - @length

    @positions = []
    while @positions.empty?
      head       = ((0..max).to_a).sample
      @positions = ship_positions(head)

      if within_field?(@positions.last) && not_crash?(@positions, battle_field)
        @positions.each {|position| battle_field[position] = 1 }
      else
        @positions = []
      end
    end
  end

  def ship_positions(head)
    if direction == 'horizontal'
      (head...(head + @length)).to_a
    else
      [head, (head + 7), (head + 7*2)]
    end
  end

  def be_hurt(position)
    @positions.delete(position)
  end

  def sunk?
    @positions.empty?
  end

  private

  def direction
    %w(horizontal vertical).sample
  end

  def within_field?(last_position)
    (last_position % 7 != 0) &&
    (last_position % 7 != 1) &&
    (last_position < 49)
  end

  def not_crash?(positions, battle_field)
    battle_field.values_at(*positions).all? {|n| n.zero? }
  end
end

class BattleShipGame
  attr_reader :count

  class << self
    def play(input, output)
      game = BattleShipGame.new([
        Ship.new(:vega),
        Ship.new(:altair),
        Ship.new(:deneb)
      ])
      game.start

      while !game.complete?
        output.print 'Please enter the shooting position：'
        begin
          output.puts game.judge(input.gets.chomp)
        rescue ArgumentError
          output.puts 'please enter within A1-G7'
        end
      end

      output.puts "You threw #{game.count} bombs"
    end
  end

  def initialize(ships)
    @ships = ships
    @count = 0
    @field = Array.new(49, 0)
  end

  def start
    @ships.each {|ship| ship.deploy(@field) }
  end

  def complete?
    @ships.all?(&:sunk?)
  end

  def judge(position)
    @count += 1

    @ships.each do |ship|
      if hit(ship, position)
        if ship.sunk?
          return "hit! You sunk #{ship.name}!"
        else
          return 'hit!'
        end
      end
    end

    'miss'
  end

  private

  def hit(ship, position)
    ship.be_hurt(target(position))
  end

  def target(position)
    raise ArgumentError unless position.length == 2

    row = position.slice(0).upcase
    col = position.slice(1).to_i

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

BattleShipGame.play(STDIN, STDOUT)
