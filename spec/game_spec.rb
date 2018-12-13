require 'game'

describe Game do
  subject(:game) { Game.new }
  # create doubles for the players
  let(:luigi) { double :player }

  describe '#attack' do
    it 'damages the player' do
      expect(luigi).to receive(:receive_damage)
      game.attack(luigi)
    end
  end
end
