require 'player'

describe Player do
  subject(:mario) { Player.new('Mario') }
  subject(:luigi) { Player.new('Luigi') }

  describe '#name' do
    it 'returns the name' do
      expect(mario.name).to eq 'Mario'
    end

    describe '#hit_points' do
      it 'returns the hit points' do
        expect(mario.hit_points).to eq described_class::DEFAULT_HIT_POINTS
      end
    end

    describe '#attack' do
      it 'damages the player' do
        expect(luigi).to receive(:receive_damage)
        mario.attack(luigi)
      end
    end

    describe '#receive_damage' do
      it 'removes 10 points from the hit points' do
        expect { luigi.receive_damage }.to change { luigi.hit_points }.by(-10)
      end
    end
  end
end
