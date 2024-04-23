require "./spec/spec_helper"

RSpec.describe Ride do
  before do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
  end

  describe 'initialize' do
    it 'can initialize a ride object' do
      expect(@ride1).to be_a(Ride)
    end

    it 'has attributes' do
      expect(@ride1.name).to eq("Carousel")
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
      expect(@ride1.rider_log).to eq({})
    end

    it 'starts with an empty revenues counter' do
      expect(@ride1.total_revenue).to eq(0)
    end
  end

  describe 'visitors on ride' do
    before do
      @visitor1 = Visitor.new('Bruce', 54, '$10')
      @visitor2 = Visitor.new('Tucker', 36, '$5')
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
    end

    it 'can board riders onto the ride and generates a rider log' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      expected = ({
        @visitor1 => 2,
        @visitor2 => 1
      })

      expect(@ride1.rider_log).to eq(expected)
    end

    it 'can generate revenue from riders' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      expect(@ride1.total_revenue).to eq(3)
    end

    it 'works with multiple rides' do
      visitor3 = Visitor.new('Penny', 64, '$15')
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      @visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
      ride3.board_rider(@visitor1)
      ride3.board_rider(@visitor2)
      ride3.board_rider(visitor3)

      expect(visitor3.spending_money).to eq(13)
      expect(ride3.total_revenue).to eq(2)
    end
  end
end