require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      fail 'No bikes available'
    else
      return_bike
    end
  end

  def dock(bike)
    fail 'Docking Station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def return_bike
      @bikes.each do |bike|
        return bike unless bike.broken?
      end
      fail 'Bike is broken'
    end

  def full?
    bikes.count >= @capacity
  end

  def empty?
    bikes.empty?
  end

end
