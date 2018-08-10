require 'rover'

describe Rover do
  context 'given a starting point and an empty movement array' do
    it 'can return 0,0 when given no movement' do
      rover = Rover.new(facing: :N, coordinates: [0, 0])
      rover.move([])
      expect(rover.position).to eq([0, 0])
    end

    it 'can return 29,31 when given no movement' do
      rover = Rover.new(facing: :N, coordinates: [29, 31])
      rover.move([])
      expect(rover.position).to eq([29, 31])
    end
  end

  context 'given a starting point and a movement array' do
    it 'can return 0, 6 when given [N, N, N]' do
      rover = Rover.new(facing: :N, coordinates: [0, 0])
      rover.move([:N, :N, :N])
      expect(rover.position).to eq([0, 3])
    end

    it 'can return 0, 6 when given [N, N, N, N, N, N]' do
      rover = Rover.new(facing: :N, coordinates: [0, 0])
      rover.move([:N, :N, :N, :N, :N, :N])
      expect(rover.position).to eq([0, 6])
    end

    it 'can return 1, 2 when given [N, N, E]' do
      rover = Rover.new(facing: :N, coordinates: [0, 0])
      rover.move([:N, :N, :E])
      expect(rover.position).to eq([1, 2])
    end

    it 'can return 2, 4 when given [N, N, E] from a different start' do
      rover = Rover.new(facing: :N, coordinates: [1, 2])
      rover.move([:N, :N, :E])
      expect(rover.position).to eq([2, 4])
    end

    it 'can return 9, 9 when given [S, W] from a different start' do
      rover = Rover.new(facing: :S, coordinates: [10, 10])
      rover.move([:S, :W])
      expect(rover.position).to eq([9, 9])
    end
  end
end
