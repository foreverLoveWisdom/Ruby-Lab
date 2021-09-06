class Counter
  def initialize
    @x = 0
  end

  def get_x
    @x
  end

  def incr
    @x += 1
  end

  def decr
    @x -= 1
  end
end

c = Counter.new
puts c.get_x
puts c.incr
puts c.decr
puts c.get_x

Counter = lambda do
  x     = 0
  puts "Current x value: #{x}"
  get_x = -> { x }
  incr  = -> { x += 1 }
  decr  = -> { x -= 1 }
  { get_x: get_x, incr: incr, decr: decr }
end

counter = Counter.call
puts counter
puts counter[:get_x].call
puts counter[:incr].call
puts counter[:incr].call

counter_2 = Counter.call
puts counter_2[:get_x].call
puts counter_2[:incr].call
puts counter_2[:decr].call
