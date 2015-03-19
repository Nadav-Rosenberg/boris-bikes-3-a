require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'can dock a bike' do
    expect(subject.dock :bike).to eq :bike
  end
end
