require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'should release a working bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it 'raises and error when full' do
      subject.dock(Bike.new)
      expect { subject.dock Bike.new }.to raise_error 'Docking Station full'
    end

  end

end
