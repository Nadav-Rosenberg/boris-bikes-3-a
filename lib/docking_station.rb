require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
    @capacity = 20
  end

  attr_accessor :capacity

  def dock bike
    fail 'Station Full' if full?
    bikes << bike
    nil
  end

  def release_bike
    fail 'No Bikes Available' if empty?
    bikes.pop
  end

  private

  attr_reader :bikes

  def full?
    bikes.length >= @capacity
  end

  def empty?
    bikes.empty? # select { |bike| !bike.broken }.empty?
  end
end
