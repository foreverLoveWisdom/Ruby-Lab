array_second = <<~RUBY
  def second
    self[1]
  end
RUBY

a = [1, 2, 3]
a.instance_eval(array_second)

puts a.first
puts a.last

str = 'ruby.devscoop.fr'
str.instance_eval do
  def /(other)
    split(other)
  end
end
# puts str./('.')

class User
  def initialize(email)
    @email = email
  end

  attr_reader :email
end

u = User.new('ruby@devscoop.fr')

puts u.instance_eval('email', __FILE__, __LINE__)

puts(u.instance_eval { email })

# Possible to access private methods
class User
  def initialize(email)
    @email = email
  end

  private

  def secret_key
    'XX-XXXX-XXXXXX-XX'
  end
end

u = User.new('ruby@devscoop.fr')
puts u.instance_eval('secret_key', __FILE__, __LINE__)
puts(u.instance_eval { secret_key })
