module ActiveRecord
  class Schema
    def self.define(_version)
      yield
    end

    def self.create_table(table_name, options = {})
      t = Table.new(table_name, options)
      yield(t)
    end
  end
end

class Table
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

  def datime(value)
    puts "Creating column of type datetime named #{value}"
  end
end

ActiveRecord::Schema.define(version: 20_130_315_230_455) do
  create_table 'microposts', force: true do |t|
    t.string 'content'
    t.integer 'user_id'
    t.integer 'created_at'
    t.integer 'updated_at'
  end
end
