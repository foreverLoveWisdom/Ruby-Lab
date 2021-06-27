# As we can easily see that the high level class Report Generator Manager is
# dependent on the low level class XML
class ReportGeneratorManager
  def initialize(data)
    @data = data
  end

  def call
    generate_xml_report
    additional_actions
  end

  private

  attr_reader :data

  def generate_xml_report
    XmlRaportGenerator.new(data).generate
  end

  def additional_actions
    puts '....'
  end
end

class ReportGeneratorManager
  def initialize(data, generator = XmlRaportGenerator)
    @data = data
    @generator = generator
  end

  def call
    generate_report
    additional_actions
  end

  private

  attr_reader :data, :generator

  def generate_report
    generator.new(data).generate
  end

  def additional_actions
    '....'
  end
end
