require_relative 'bike'

class DockingStation
  def release_bike
    Bike.new
  end

  def empty
  end
end
