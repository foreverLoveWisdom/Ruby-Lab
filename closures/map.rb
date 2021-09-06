class Array
  def map
    result = []
    each do |ele|
      result << yield(ele)
    end
    result
  end
end

arr = [1.23, 2.324, 3.2384]
r = arr.map(&:class)
puts r.inspect
