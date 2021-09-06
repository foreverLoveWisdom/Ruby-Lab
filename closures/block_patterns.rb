# Resource management

f = File.open('astarstarst.txt', 'w')
f << 'airsnetairsnt'
f << 'airsnetairsnt'
f.close

# No need to close the file manually
File.open('arstarst', 'w') do |v|
  v << 'airestnairstn'
  v << 'airestnairstn'
end

class File
  def self.open(name, mode)
    file = new(name, mode)
    return file unless block_given?

    yield(file)
  ensure
    file.close
  end
end

# file = File.open('test_file.txt', 'w')
# file << 'I am testing...'
# file << 'I am testing...'
# file.close
# puts File.readlines(file)

file2 = File.open('test_file_block.txt', 'w') do |v|
  v << 'Writing to file with a block\n'
  v << 'Writing to file with a block'
end

# puts File.readlines(file2)

# Object Initialization

module Twitter
  module REST
    class Client
      attr_accessor :consumer_key,
                    :consumer_secret,
                    :access_token,
                    :access_token_secret

      def initialize
        yield(self) if block_given?
      end
    end
  end
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'asrtarst'
  config.consumer_secret     = 'asrtarst'
  config.access_token        = 'asrtarst'
  config.access_token_secret = 'asrtarst'
end

# puts client.inspect

class Router
  def initialize
    yield if block_given?
  end

  def match(hash)
    puts hash.inspect
  end
end

routes = Router.new do
  puts "What is self? #{self}"
  match '/about': 'home#about'
  match '/users': 'users#index'
end
