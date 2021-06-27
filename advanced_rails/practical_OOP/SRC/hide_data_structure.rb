class ObscuringReference
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def diameters
    # This depends upon the array's structure
    # If this data's data structure changes,
    # the code will need to be changed
    # In ruby it is easy to separate structure from meaning. I can use Ruby Struct class to wrap a structure
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end
end

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # All it knows now is diameters return an Enumerable and respond to rim and tire
  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end
