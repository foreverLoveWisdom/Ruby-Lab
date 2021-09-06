# Identify free variable
def larger_than(amount)
  lambda do |a|
    puts "Amount is: #{amount}"
    a > amount
  end
end

# free_var = 10
# closure = larger_than(free_var)
# puts closure.call(2)
# free_var = -2
# closure = larger_than(free_var)
# puts closure.call(2)

new_db = lambda do
  database = {}

  insert = lambda do |artist, album|
    database[artist] = album
    database[artist]
  end

  dump = -> { database }

  delete = ->(artist) { database.delete(artist) }

  { insert: insert, dump: dump, delete: delete }
end

db = new_db.call
# db[:insert].call('Eagles', 'Hell Freezes Over')
# db[:insert].call('Pink', 'Floyd')
# puts db[:dump].call
# db[:delete].call('Pink')
# db[:insert].call('Pink Floyd', 'The Wall')
# puts db[:dump].call
# puts db[:delete].call('Pink Floyd')
# puts db[:dump].call

def complement(predicate)
  lambda do |value|
    !predicate.call(value)
  end
end

complement = lambda do |var|
  # puts "Var is: #{var.inspect}"
  lambda do |inner_var|
    var.call(inner_var)
  end
end

is_even = lambda do |value|
  value.even?
end

outmost_lam = complement.call(is_even)
# puts outmost_lam.call(3)

is_even = lambda do |_test|
  # puts 'A test for free variable'
end

outmost_lam_2 = complement.call(is_even)
# puts outmost_lam_2.call(3)

# arr = []
# result = [1, 2, 3, 4, 5].reduce(2) do |memo, element|
#   puts "memo: #{memo}"
#   puts "element: #{element}"
#   arr << 2 * element
# end

# x = 'outside x'
# 1.times { x = 'x is modified within the block' }
# puts x

# x = 'outside x'
# 1.times { |_x| x = 'x is modified within the block' }
# puts x

# class Integer
#   def times(&block)
#     yield
#     temp = self - 1
#     temp.times(&block) if temp >= 1
#   end
# end

class Integer
  def times
    x = 0
    while x < self
      yield
      x += 1
    end
  end
end

# 2.times { puts 'This is the recursive time' }

# class Array
#   def each
#     x = 0

#     while x < count
#       puts "x is: #{x}"
#       yield(self[x])
#       x += 1
#     end
#   end
# end

# arr = [0, 1, 2, 3, 4, 5, 10]
# arr.each do |num|
#   puts "Num is: #{num}"
# end
