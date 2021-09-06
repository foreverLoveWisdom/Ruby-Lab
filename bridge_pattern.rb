class Abstraction
  def initialize(implementation)
    @implementation = implementation
  end

  def operation
    "Abstraction: Base operation with: #{@implementation.operation_implementation}"
  end
end

class ExtendedAbstraction < Abstraction
  def operation
    "ExtendedAbstraction: Extended operation with: #{@implementation.operation_implementation}"
  end
end

class Implementation
  def operation_implementation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
