require 'docking_station'
require 'capybara/rspec'
require 'bike'

feature 'member of the public access bike' do
  scenario 'docking station releases a bike that is not broken' do
    docking_station = DockingStation.new
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end

  scenario 'docking station does not release a bike when it is empty' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end
