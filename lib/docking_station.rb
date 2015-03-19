require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def dock bike
    fail 'Station Full' if @bikes.length >= 20
    @bikes << bike
  end

  def release_bike
    fail 'No Bikes Available' if @bikes.empty?
    @bikes.pop
  end
end
