class Game
  attr_reader :current_player

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player_2)
    player_2.receive_damage
  end

  def switch
    @current_player = opponent_of(current_player)
  end

  def opponent
    opponent_of(@current_player)
  end

  def opponent_of(the_player)
    @players.reject { |player| player == the_player }.first
  end

  def over?
    @players.any? { |player| player.hit_points == 0 }
  end

  private

  attr_reader :players
end
