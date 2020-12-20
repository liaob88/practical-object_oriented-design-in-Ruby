class RevealingReferences
  attr_reader :wheels
  # data = [[1,2], [3,4], [5,6], ...]
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end

  private
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end
end