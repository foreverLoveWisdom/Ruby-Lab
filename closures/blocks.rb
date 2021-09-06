# puts(Array(1..20).select { |x| x.even? })

# Only needs to change the logic inside the block. No need to reimplement the logic for select
# puts(Array(1..20).select { |x| x.even? && x > 10 })

require 'ostruct'
catalog = []
catalog << OpenStruct.new(name: 'Nike', qty: 20, price: 99.00)
catalog << OpenStruct.new(name: 'Adidas', qty: 10, price: 109.00)
catalog << OpenStruct.new(name: 'New Balance', qty: 2, price: 89.00)
# puts catalog.inspect
# puts(catalog.sort_by { |x| x.price })
# puts(catalog.sort_by { |x| x.qty }.reverse)

def do_it
  yield
end

# do_it do
#   puts 'I am doing it'
# end

do_it do
  puts
end
