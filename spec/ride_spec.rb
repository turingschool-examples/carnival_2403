require "./spec/spec_helper"

RSpec.describe Visitor do
  describe 'initialize' do
    it 'exists' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1).to be_a(Ride)
    end

    it 'has a name' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1.name).to eq('Carousel')
    end
    
    it 'has a min_height' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1.min_height).to eq(24)
    end
    
    it 'has an admission_fee' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1.admission_fee).to eq(1)
    end

    it 'has an excitement level' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1.excitement).to eq(:gentle)
    end

    it 'has rider log empty by default' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1.rider_log).to eq({})
    end

    it 'has total revenue of 0 by default' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      expect(ride1.total_revenue).to eq(0)
    end
  end

  describe '#boad_rider' do
    it 'can board riders based on attributes and update rider log' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })      
      visitor1 = Visitor.new('Bruce', 4, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      # ride1.board_rider(visitor1)
      # ride1.board_rider(visitor2)
      # ride1.board_rider(visitor1)

      expect(ride1.rider_admitted?(visitor1)).to be true
      expect(ride1.rider_admitted?(visitor2)).to be true

      #expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      #helper for rider admitted?
        #visitor.tall_enough? true &&
        #visitor.preferences.include? ride[:excitement]
        #visitor.spending_money > @admission_fee
      #helper for update_visitor_spending_money
        #visitor.spending_money - ride[:admission_fee]
    end
  end
end