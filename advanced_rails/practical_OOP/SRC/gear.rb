class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  # Method does more than one thing: looping and calculating
  # def diameters
  #   wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  # end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end

puts Gear.new(30, 27, 26, 1.5).gear_inches
puts Gear.new(30, 27).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches
