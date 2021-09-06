# Pushing the "which class" decision down on a subclass

class Truck
  def deliver
    puts 'Being delivered by truck'
  end
end

class Ship
  def deliver
    puts 'Being delivered by ship'
  end
end

class Logistic
  def plan_delivery
    # create_transport is the factory method
    # Before this method is created, I construct the Truck object directly here and it shows tight coupling between Logistic and Truck
    vehicle = create_transport
    vehicle.deliver
  end
end

class RoadLogistic < Logistic
  def create_transport
    Truck.new
  end
end

class ShipLogistic < Logistic
  def create_transport
    Ship.new
  end
end

logistic = ShipLogistic.new
logistic.plan_delivery
logistic = RoadLogistic.new
logistic.plan_delivery
