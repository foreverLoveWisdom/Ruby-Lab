# First we need a base class/or interface => This is called a component
# Ask: What will my basic objects and higher-level objects have in common?
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def fetch_time_required
    0.0
  end
end

# Second is leaf classes, which are simple and indivisible building blocks of the process
# Build 3 leaf classes
class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def fetch_time_required
    1.0
  end
end

class AddLiquidTask < Task
  def initialize
    super('Add liquid ingredients')
  end

  def fetch_time_required
    2.0
  end
end

class MixTask < Task
  def initialize
    super('Mix that batter up')
  end

  def fetch_time_required
    3.0
  end
end

# This class is built to factor out the common behaviors in those composite classes
class CompositeTask < Array
  attr_reader :sub_tasks

  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def [](index)
    sub_tasks[index]
  end

  def []=(index, value)
    sub_tasks[index] = value
  end

  def <<(task)
    sub_tasks << task
  end

  def remove_sub_task(task)
    sub_tasks.delete(task)
  end

  def fetch_time_required
    time = 0.0
    sub_tasks.each { |task| time += task.fetch_time_required }
  end
end

# Last is composite class which is a component, that is also a higher-level object that is built from subcomponents
class MakeBatterTask < CompositeTask
  def initialize
    super('Make Batter')
    sub_tasks << AddDryIngredientsTask.new
    # add_sub_task(AddLiquidTask.new)
    # add_sub_task(MixTask.new)
    puts 'Finish adding sub tasks....'
  end
end

make_batter = MakeBatterTask.new
puts make_batter.inspect
puts(make_batter.sub_tasks[0] = AddLiquidTask.new)
puts make_batter.sub_tasks.inspect
puts make_batter.sub_tasks = AddLiquidTask.new
