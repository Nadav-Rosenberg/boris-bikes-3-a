require_relative 'bike'

class DockingStation
  @empty = true
  def release_bike
    Bike.new
    fail 'No Bikes Available' if empty?
  end
  attr_reader :empty
  alias_method :empty?, :empty
end
