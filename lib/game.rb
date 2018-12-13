class Game
  attr_reader :player_1, :player_2, :current_turn

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_turn = player_1
  end

  def attack(player_2)
    player_2.receive_damage
  end

  def switch
    @current_turn = player_2
  end
end
