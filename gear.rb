class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # ギアインチ＝車輪の直径*ギア比
    # 車輪の直径＝リムの直径+タイヤの厚みの2倍
    diameter * ratio
  end

  def diameter
    wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference # => 91.106186954104

puts Gear.new(52, 11, @wheel).gear_inches # => 137.0909090909091
puts Gear.new(52, 11).ratio # => 4.7272727272727275
