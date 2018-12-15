class Player
  attr_reader :name, :hit_points

  DEFAULT_HIT_POINTS = 30

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @hit_points -= 10
  end

  # def looser?(player)
  #   player.hit_points == 0
  # end
end
