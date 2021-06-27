class Dialog
  def create_button
    raise NotImplementedError, 'Subclasses should implement this method'
  end

  def render
    ok_button = create_button
    ok_button.on_click
    ok_button.render
  end
end

class WindowsDialog < Dialog
  def create_button
    WindowButton.new
  end
end

class WebDialog < Dialog
  def create_button
    HTMLButton.new
  end
end

class IOSDialog < Dialog
  def create_button
    IOSButton.new
  end
end

class Button
  def render
    raise NotImplementedError, "Subclasses' responsibilities"
  end

  def on_click
    raise NotImplementedError, "Subclasses' responsibilities"
  end
end

class WindowButton < Button
  def render
    puts 'Rendering a windows button....'
  end

  def on_click
    puts 'Binding a native OS click....'
  end
end

class HTMLButton < Button
  def render
    puts 'Rendering a web button....'
  end

  def on_click
    puts 'Binding a web browser click...'
  end
end

class IOSButton < Button
  def render
    puts 'Rendering an iOS button....'
  end

  def on_click
    puts 'Binding a native iOS click...'
  end
end

# puts 'Which button you want to create and render?'
# button_type = gets.chomp
# dialog = if button_type == 'Windows'
#            WindowsDialog.new
#          elsif button_type == 'iOS'
#            IOSDialog.new
#          else
#            WebDialog.new
#          end

# dialog.render

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def speak
    raise NotImplementedError
  end

  def eat
    raise NotImplementedError
  end

  def sleep
    raise NotImplementedError
  end
end

class Duck < Animal
  def eat
    puts "Duck #{name} is eating..."
  end

  def speak
    puts "Duck #{name} is speaking..."
  end

  def sleep
    puts "Duck #{name} is sleeping..."
  end
end

class Frog < Animal
  def eat
    puts "Frog #{name} is eating..."
  end

  def speak
    puts "Frog #{name} is speaking..."
  end

  def sleep
    puts "Frog #{name} is sleeping..."
  end
end

class Pond
  attr_reader :animals

  def initialize(num_of_animals, _number_of_plants)
    @animals = []
    num_of_animals.times do |i|
      animal = new_organism(:animal, "Animal#{i}")
      @animals << animal
    end

    @plants = []
    num_of_plants.times do |i|
      plant = new_organism(:plant, "Plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    animals.each(&:eat)
    animals.each(&:speak)
    animals.each(&:sleep)
  end
end

class DuckPond < Pond
  def new_organism(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_organism(name)
    Frog.new(name)
  end
end

class Plant
  def initialize(name)
    @name = name
  end
end

class Algae < Plant
  def grow
    puts "The Algae #{@name} soaks up the sun and grows"
  end
end

class WaterLily < Plant
  def grow
    puts "The WaterLily #{@name} soaks up the sun and grows"
  end
end

pond = FrogPond.new(1)
pond.simulate_one_day
