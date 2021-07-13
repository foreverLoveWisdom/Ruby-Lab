# frozen_string_literal: true

class Hammer
  def swing!
    'swing the hammer'
  end
end

class Tool
  def initialize(adapter)
    @adapter = adapter
  end

  def use_tool
    @adapter.use_tool
  end
end

class HammerAdapter
  def initialize(hammer)
    @hammer = hammer
  end

  def use_tool
    @hammer.swing!
  end
end

hammer         = Hammer.new
hammer_adapter = HammerAdapter.new(hammer)
tool           = Tool.new(hammer_adapter)
tool.use_tool
