require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'has a default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking Station full'
    end
  end

  describe '#release_bike' do

    it 'should release a working bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'raises an error when there are no bikes available' do
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'should not release a broken bike' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'Bike is broken'
    end

  end

  describe '#dock' do
    let(:bike) { Bike.new }

    it 'docks something' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do

      subject.dock(bike)
      # expect(subject.bike).to eq bike
    end

    it 'raises and error when full' do
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking Station full'
    end

  end

end
