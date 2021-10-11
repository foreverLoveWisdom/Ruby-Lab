module ActiveRecord
  class Schema
    def self.define(_version, &block)
      puts "Block is: #{block}"
      instance_eval(&block)
    end

    def self.create_table(table_name, options = {}, &block)
      t = Table.new(table_name, options)
      t.instance_eval(&block)
    end
  end
end

class Table
  def initialize(name, options)
    @name    = name
    @options = options
  end

  def integer(value)
    puts "Creating column of type integer named #{value}"
  end

  def datetime(value)
    puts "Creating column of type datetime named #{value}"
  end

  def string(value)
    puts "Creating column of type string named #{value}"
  end
end

ActiveRecord::Schema.define(version: 20_130_315_230_445) do
  puts "Self inside first block is: #{inspect}"

  create_table 'microposts', force: true do |t|
    t.string 'content'
    t.integer 'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end
end
