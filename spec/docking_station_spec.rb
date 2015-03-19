require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to :empty? }
  it { expect(-> { subject.release_bike }).to raise_error 'No Bikes Available' }
end
