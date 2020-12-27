class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
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

  def defaults
    {
      chainring: 40,
      cog: 18
    }
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