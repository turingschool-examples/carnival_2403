require "./spec/spec_helper"

RSpec.describe Carnival do
  before do
    @carnival1 = Carnival.new("Boulder Carnival", 14)
  end

  describe 'carnival class variables' do
    it 'can keep track of all carnivals' do
      expect(Carnival.all_carnivals).to eq([@carnival1])
      carnival2 = Carnival.new("Colorado Carnival", 21)
      expect(Carnival.all_carnivals).to eq([@carnival1, carnival2])
    end
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

  describe 'carnival methods' do
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

    it 'can calculate the most popular ride' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival1.most_popular_ride).to eq(@ride1)
    end

    it 'can calculate the most profitable ride' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival1.most_profitable_ride).to eq(@ride3)
    end
  end

  describe 'summary' do
    it 'can provide a summary of the carnival' do
      @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride3)
      @visitor1 = Visitor.new('Bruce', 54, '$10')
      @visitor3 = Visitor.new('Penny', 64, '$15')
      @visitor3.add_preference(:thrilling)
      @visitor1.add_preference(:gentle)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      expected = ({
        visitor_count: 2,
        revenue_earned: 6,
        visitors: [
          {
            visitor: @visitor1,
            favorite_ride: @ride1,
            total_money_spent: 3
          },
          {
            visitor: @visitor3,
            favorite_ride: @ride3,
            total_money_spent: 4
          }],
        rides: [
          {
            ride: @ride1,
            riders: [@visitor1],
            revenue: 3
          },
          {
            ride: @ride3,
            riders: [@visitor3],
            revenue: 4
          }]
      })

      expect(@carnival1.summary).to eq(expected)
    end
  end
end