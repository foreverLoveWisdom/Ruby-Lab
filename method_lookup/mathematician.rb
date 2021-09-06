class Person
  attr_accessor :first_name, :last_name

  def lectures
    puts 'A lecture from God...'
  end
end

module Employee
  def lectures
    puts 'A lecture from the employee'
  end
end

module Professor
  def lectures
    puts 'A lecture from the professor'
  end
end

class Mathematician < Person
  include Professor
  include Employee

  def method_missing(meth, *args)
    return puts "I can respond to the method, '#{meth}' at run time" if meth == :lecture

    puts "The method: #{meth} with the args: #{args} is not defined in the class: #{self.class}"
  end
end

newton            = Mathematician.new
newton.first_name = 'Tien'
# puts newton.class.ancestors
puts newton.lecture(1, 2, 3, a: 'hihi')
puts newton.respond_to? :lecture
