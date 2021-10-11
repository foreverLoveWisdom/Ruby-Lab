module Twitter
  module REST
    # Client Interfacte for Twitter REST API
    class Client
      attr_accessor :consumer_key,
                    :consumer_secret,
                    :access_token,
                    :access_token_secret

      # def initialize
      #   yield(self) if block_given?
      # end

      def initialize(options = {}, &block)
        options.each do |method_name, value|
          puts "Method name: #{method_name}"
          send("#{method_name}=", value)
        end

        instance_eval(&block) if block_given?
      end
    end
  end
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_SECRET'
end

client = Twitter::REST::Client.new(consumer_key: 'aristnaritn', consumer_secret: 'airstnarsitn') do |config|
  config.access_token = 'airsntairestn'
  config.access_token_secret = '192837iarsenrait'
end
