# frozen_string_literal: true

require 'pry'

adder = lambda do |acc, arr|
  if arr.empty?
    acc
  else
    adder.call(acc + arr.first, arr.drop(1))
  end
end

puts adder.call(10, [1, 2, 3, 4, 5])

multiplier = lambda do |acc, arr|
  if arr.empty?
    acc
  else
    multiplier.call(acc * arr.first, arr.drop(1))
  end
end

puts multiplier.call(10, [1, 2, 3])

reducer = lambda do |acc, arr, binary_function|
  if arr.empty?
    acc
  else
    reducer.call(binary_function.call(acc, arr.first), arr.drop(1), binary_function)
  end
end

puts reducer.call(1, [1, 2, 3, 4, 5], ->(x, y) { x / y })
