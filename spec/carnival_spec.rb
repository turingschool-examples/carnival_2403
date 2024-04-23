require "./spec/spec_helper"

RSpec.describe Carnival do
  before do
    @carnival1 = Carnival.new("Boulder Carnival", 14)
  end

  describe 'initialize' do
    it 'can create a carnival object' do
      expect(@carnival1).to be_a(Carnival)
    end

    it 'has attributes' do
      expect(@carnival1.name).to eq("Boulder Carnival")
      expect(@carnival1.duration).to eq(14)
      expect(@carnival1.rides).to eq([])
    end
  end

  describe 'rides' do
    it 'can add rides to the rides array' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      @carnival1.add_ride(ride1)
      @carnival1.add_ride(ride2)
      @carnival1.add_ride(ride3)

      expect(@carnival1.rides).to eq([ride1, ride2, ride3])
    end
  end
end