# frozen_string_literal: true

# The Context defines the interface of interest to clients.
class Context
  # The Context maintains a reference to one of the Strategy objects. The
  # Context does not know the concrete class of a strategy. It should work with
  # all strategies via the Strategy interface.
  attr_writer :strategy

  # Usually, the Context accepts a strategy through the constructor, but also
  # provides a setter to change it at runtime.
  def initialize(strategy)
    @strategy = strategy
  end

  # The Context delegates some work to the Strategy object instead of
  # implementing multiple versions of the algorithm on its own.
  def do_some_business_logic
    # ...
    puts 'Context: Sorting data using the strategy (not sure how it\'ll do it)'
    result = strategy.do_algorithm(%w[a b c d e])
    print result.join(',')
    # ...
  end

  private

  attr_reader :strategy
end

# Actually, no need to declare an interface in Ruby. What is the point of Duck Typing?
# The Strategy interface declares operations common to all supported versions of
# some algorithm.
#
# The Context uses this interface to call the algorithm defined by Concrete
# Strategies.
class Strategy
  # @abstract
  #
  # @param [Array] data
  def do_algorithm(_data)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Strategies implement the algorithm while following the base Strategy
# interface. The interface makes them interchangeable in the Context.
class ConcreteStrategyA < Strategy
  # @param [Array] data
  #
  # @return [Array]
  def do_algorithm(data)
    data.sort
  end
end

class ConcreteStrategyB < Strategy
  # @param [Array] data
  #
  # @return [Array]
  def do_algorithm(data)
    data.sort.reverse
    # And some other complicated things that are totally different from other strategies
  end
end

# The client code picks a concrete strategy and passes it to the context. The
# client should be aware of the differences between strategies in order to make
# the right choice.
context = Context.new(ConcreteStrategyA.new)
puts 'Client: Strategy is set to normal sorting.'
context.do_some_business_logic
puts "\n\n"

puts 'Client: Strategy is set to reverse sorting.'
context.strategy = ConcreteStrategyB.new # Be able to change the strategy through the writer
context.do_some_business_logic

puts "\n\n"
puts %w[a b c d e].inspect
