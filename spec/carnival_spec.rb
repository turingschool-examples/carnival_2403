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
    before do
      @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)
      @visitor1 = Visitor.new('Bruce', 54, '$10')
      @visitor3 = Visitor.new('Penny', 64, '$15')
      @visitor3.add_preference(:thrilling)
      @visitor1.add_preference(:gentle)
    end

    it 'can add rides to the rides array' do
      expect(@carnival1.rides).to eq([@ride1, @ride2, @ride3])
    end

    it 'can calculate total revenue' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      expect(@carnival1.total_revenue).to eq(6)
    end
  end
end