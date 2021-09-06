# frozen_string_literal: true

require 'ostruct'

class Generator
  attr_reader :report

  def initialize(report)
    @report = report
  end

  def run
    report.to_csv
  end
end

class Notifier
  attr_reader :generator, :callbacks

  def initialize(generator, callbacks)
    @generator = generator
    @callbacks = callbacks
  end

  def run
    # This is free variable
    result = generator.run

    if result
      callbacks.fetch(:on_success).call(result)
    else
      callbacks.fetch(:on_failure).call
    end
  end
end

bad_report = OpenStruct.new(to_csv: nil)
good_report = OpenStruct.new(to_csv: 'This is a success report!!!')

Notifier.new(Generator.new(good_report), on_success: lambda { |args|
  puts "Repost send to boss@acme.co: #{args}"
}).tap(&:run)

puts "\n"

Notifier.new(Generator.new(bad_report), on_success: lambda { |args|
  puts "Repost send to boss@acme.co: #{args}"
}, on_failure: lambda {
  puts 'Whoops! Send email to ben@acme.co'
}).tap(&:run)
