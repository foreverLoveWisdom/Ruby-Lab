module ActiveRecord
  class Schema
    def self.define(_version)
      puts "Self is: #{inspect}"
      yield
      # instance_eval(&block)
    end

    def self.create_table(table_name, options = {})
      t = Table.new(table_name, options)
      puts "t is: #{t.class}"
      yield(t)
    end
  end
end

class Table
  class << self
    def own_methods
      instance_methods - superclass.instance_methods
    end
  end
  def initialize(name, options)
    @name = name
    @options = options
  end

  def string(value)
    puts "Creating column of type string named #{value}"
  end

  def integer(value)
    puts "Creating column of type integer named #{value}"
  end

  def datetime(value)
    puts "Creating column of type datetime named #{value}"
  end
end

ActiveRecord::Schema.define(version: 20_130_315_230_455) do
  puts "Self is: #{inspect}"
  create_table 'microposts', force: true do |t|
    t.string 'content'
    t.integer 'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end
end

t = Table.new('User', pluralize: true)
puts t.class.own_methods
