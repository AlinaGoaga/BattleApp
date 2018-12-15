require 'game'

describe Game do
  subject(:game) { Game.new(player_1, player_2) }
  # create doubles for the players
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#current_player' do
    it 'starts as player 1' do
      expect(game.current_player).to eq player_1
    end
  end

  describe '#opponent' do
    it 'displays the current player\'s opponent' do
      expect(game.opponent).to eq player_2
    end
  end

  describe '#opponent_of' do
    it 'finds the opponent of a player' do
      expect(game.opponent_of(player_1)).to eq player_2
      expect(game.opponent_of(player_2)).to eq player_1
    end
  end

  describe '#switch' do
    it 'switches the player' do
      expect(game.switch).to eq player_2
    end

    it 'switches the current player' do
      game.switch
      expect(game.current_player).to eq player_2
    end

    it 'switches the opponent' do
      game.switch
      expect(game.opponent).to eq player_1
    end
  end

  describe '#game over' do
    it 'stops the game when one of the players is at 0 HP' do
      allow(player_1).to receive(:hit_points).and_return 10
      allow(player_2).to receive(:hit_points).and_return 0
      expect(game.over?).to eq true
    end

    it 'stops the game when one of the players is at 0 HP' do
      allow(player_1).to receive(:hit_points).and_return 0
      allow(player_2).to receive(:hit_points).and_return 10
      expect(game.over?).to eq true
    end

    it 'stops the game when one of the players is at 0 HP' do
      allow(player_1).to receive(:hit_points).and_return 20
      allow(player_2).to receive(:hit_points).and_return 10
      expect(game.over?).to eq false
    end
  end
end
