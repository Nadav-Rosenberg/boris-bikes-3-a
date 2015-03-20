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

feature 'maintaner increases capacity of a station' do
  scenario 'to 40' do
    docking_station = DockingStation.new
    docking_station.capacity = 40
    expect(docking_station.capacity).to eq 40
  end
end

feature 'docking station does not release broken bikes' do
  scenario 'when there is only broken bike station raises error' do
    docking_station = DockingStation.new
    broken_bike = Bike.new
    broken_bike.break
    docking_station.dock broken_bike
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end
