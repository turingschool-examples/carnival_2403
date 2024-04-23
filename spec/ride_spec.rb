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
      expected = ({

      })

      expect(@ride_1.rider_log).to eq(expected)
    end
  end
end