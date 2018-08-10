class Rover
  attr_accessor :position
  attr_accessor :facing
  def initialize(facing:, coordinates:)
    @position = coordinates
    @facing = facing
    @compass = [:N, :E, :S, :W].freeze
  end

  def move(movements)
    movements.each do |move|
      move_index = @compass.find_index(move)
      move_forward if move == @facing
      if @facing == @compass[move_index - 1]
        rotate_anti_clockwise
        move_forward
      end
      if @facing == @compass[move_index + 1]
        rotate_clockwise
        move_forward
      end
    end
  end

  private

  def move_forward
    position[1] += 1 if @facing == :N
    position[0] += 1 if @facing == :E
    position[1] -= 1 if @facing == :S
    position[0] -= 1 if @facing == :W
  end

  def move_backward
    position[1] -= 1 if @facing == :N
    position[0] -= 1 if @facing == :E
    position[1] += 1 if @facing == :S
    position[0] += 1 if @facing == :W
  end

  def rotate_clockwise
    index = @compass.find_index(@facing)
    @facing = @compass[index - 1]
  end

  def rotate_anti_clockwise
    index = @compass.find_index(@facing)
    @facing = @compass[index + 1]
  end
end
