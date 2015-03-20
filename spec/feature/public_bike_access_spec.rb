require 'capybara/rspec'
require 'docking_station'
require 'bike'

feature 'member of public accesses bike' do
  scenario 'docking station releases a bike that is not broken' do
    docking_station = DockingStation.new
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end

  scenario 'docking station does not release a bike when it is empty' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end

feature 'memebr of public docking bike' do
  scenario 'docking station unable to receive as full' do
    docking_station = DockingStation.new
    20.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
end

# feature 'maintaner increases station capacity' do
#   scenario 'docking station able to have any capacity' do
#     docking_station = DockingStation.new
#     docking_station.increase_capacity num
#     expect(docking_station.capacity num).to eq num
#   end
# end
