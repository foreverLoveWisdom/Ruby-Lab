require 'Forwardable'

class Computer
  extend Forwardable
  # Rails way
  # delegate :read, :write, to: :@memory

  def initialize
    @memory = Memory.new
  end

  def_delegators :@memory, :read, :write

  # This is method delegation
  # And this is public => every one can uses it and I don't want this. So, think twice about delegation
  # def write(data)
  #   @memory.write(data)
  # end

  # def read(index)
  #   @memory.read(index)
  # end
end

class Memory
  def initialize
    @data = []
  end

  private

  def write(data)
    @data << data
  end

  def read(index)
    @data[index]
  end
end

computer = Computer.new
computer.inspect
computer.write('First memory address')
# puts computer.inspect
# puts computer.read(0)
