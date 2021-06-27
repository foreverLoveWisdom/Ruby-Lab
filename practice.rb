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

good_report = OpenStruct.new(to_csv: '59.99,Great Success')
bad_report = OpenStruct.new(to_csv: nil)

generator = Generator.new(good_report)
puts generator.run

error_generator = Generator.new(bad_report)
puts error_generator.run

Notifier.new(Generator.new(good_report),
             on_success: lambda { |r| puts "Send #{r} to boss@acme.co" }), 
on_failure: lambda { puts "Send email to ben@acme.co"  }).tap do |n|
  n.run
end
