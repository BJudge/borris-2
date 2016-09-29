require 'van'
require 'docking_station'
require 'bike'

describe Van do

  describe '#collect_from_station' do

    it { is_expected.to respond_to(:collect_from_station).with(1) .argument }

    it 'should collect only broken bikes from a docking station' do
      station = double(:station) 

      bike = double(:bike, broken?: true)
      expect(station.dock(bike)).to eq [bike]
      subject.collect_from_station(bike)
      expect(bike).to be_broken
    end
  end

  # describe '#return_to_station' do
  #
  # end

end
