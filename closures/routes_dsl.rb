# old way
# routes = Router.new do |r|
#   r.match '/about' => 'home#about'
#   r.match '/users' => 'users#index'
# end

# Evolved way
class Router
  def initialize(&block)
    puts "Self is: #{inspect}"
    instance_eval(&block)
  end


  def match(options)
    puts "The url is: localhost/#{options.keys.first}"
    puts "The controller is: #{options.values.first.match(/[aA-zZ]+?(?=#)/)}_controller"
  end
end

Router.new do
  puts "Self inside block is: #{inspect}"
  match 'about' => 'home#about'
  match 'users' => 'users#index'
end
