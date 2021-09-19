[1, 2, 3].inject(0) { |result, element| result + element }
class Symbol
  def to_proc
    lambda do |x, args|
      # puts "current object is: #{x}"
      # puts "current argument is: #{args}"
      # puts "the method is: #{self}"
      x.send(self, *args)
    end
  end
end

puts([1, 2, 10, 20].inject(&:+))
puts(1.+(2))
puts(1.send(:+, 2))
