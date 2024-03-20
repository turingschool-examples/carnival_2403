require './harness/spec_helper'

RSpec.describe 'Carnival' do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$40')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end
  describe 'Iteration 1' do
    describe '#initialize' do
      it '1. can create visitors with attributes' do
        expect(Visitor).to respond_to(:new).with(3).argument
        expect(@visitor1).to be_an_instance_of(Visitor)
        expect(@visitor1).to respond_to(:name).with(0).argument
        expect(@visitor1.name).to eq('Bruce')
        expect(@visitor1).to respond_to(:height).with(0).argument
        expect(@visitor1.height).to eq(54)
        expect(@visitor1).to respond_to(:spending_money).with(0).argument
        expect(@visitor1.spending_money).to eq(10)
        expect(@visitor1).to respond_to(:preferences).with(0).argument
        expect(@visitor1.preferences).to eq([])
      end
    end
    describe '#add_preference' do
      it '2. can add a preference to a visitor' do
        expect(@visitor1.preferences).to eq([])
        expect(@visitor1).to respond_to(:add_preference).with(1).argument
        @visitor1.add_preference(:gentle)
        @visitor1.add_preference(:thrilling)
        expect(@visitor1.preferences).to eq([:gentle, :thrilling])
      end
    end
    describe '#tall_enough?' do
      it '3. can determine is a visitor is tall' do
        expect(@visitor1).to respond_to(:tall_enough?).with(1).argument
        expect(@visitor1.tall_enough?(54)).to eq(true)
        expect(@visitor2.tall_enough?(54)).to eq(false)
        expect(@visitor3.tall_enough?(54)).to eq(true)
      end
    end
  end
  describe 'Iteration 2' do
    before(:each) do
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor2.add_preference(:thrilling)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)
    end
    describe '#initialize' do
      it '4. can create rides with attributes' do
        expect(Ride).to respond_to(:new).with(1).argument
        expect(@ride1).to be_an_instance_of(Ride)
        expect(@ride1).to respond_to(:name).with(0).argument
        expect(@ride1.name).to eq('Carousel')
        expect(@ride1).to respond_to(:min_height).with(0).argument
        expect(@ride1.min_height).to eq(24)
        expect(@ride1).to respond_to(:admission_fee).with(0).argument
        expect(@ride1.admission_fee).to eq(1)
        expect(@ride1).to respond_to(:rider_log).with(0).argument
        expect(@ride1.rider_log).to eq({})
      end
    end
    describe '#board_rider' do
      it '5. can track rider_log of a the ride' do
        expect(@ride1).to respond_to(:board_rider).with(1).argument
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        expect(@ride1.rider_log).to eq({ @visitor1 => 2, @visitor2 => 1 })
        expect(@visitor1.spending_money).to eq(8)
        expect(@visitor2.spending_money).to eq(39)
      end
      it '6. reduces riders spending money' do
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride2.board_rider(@visitor3)
        @ride2.board_rider(@visitor3)
        expect(@visitor1.spending_money).to eq(8)
        expect(@visitor2.spending_money).to eq(34)
        expect(@visitor3.spending_money).to eq(0)
      end
      it '7. does not board a rider who is too short to ride nor match preference, and does not reduce their spending money' do
        @ride3.board_rider(@visitor1)
        @ride3.board_rider(@visitor2)
        @ride3.board_rider(@visitor3)
        expect(@visitor1.spending_money).to eq(10)
        expect(@visitor2.spending_money).to eq(40)
        expect(@visitor3.spending_money).to eq(13)
        expect(@ride3.rider_log).to eq({ @visitor3 => 1 })
      end
    end
    describe '#total_revenue' do
      it '8. can calculate revenue earned' do
        expect(@ride1).to respond_to(:total_revenue).with(0).argument
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride2.board_rider(@visitor3)
        @ride2.board_rider(@visitor3)
        expect(@ride1.total_revenue).to eq(3)
        expect(@ride2.total_revenue).to eq(20)
      end
    end
  end

  describe "Iteration 3" do 
    before(:each) do
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor2.add_preference(:thrilling)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)
    end

    describe "#initialize" do 
      it "9. can create a Carnival with attributes" do 
        carnival = Carnival.new(14)
        expect(Carnival).to respond_to(:new).with(1).argument
        expect(carnival).to be_an_instance_of(Carnival)
        expect(carnival).to respond_to(:duration).with(0).argument
        expect(carnival.duration).to eq(14)
      end

      it "10. has rides" do 
        carnival = Carnival.new(14)
        expect(carnival).to respond_to(:add_ride).with(1).argument
        expect(carnival).to respond_to(:rides).with(0).argument
        carnival.add_ride(@ride1)
        carnival.add_ride(@ride2)
        carnival.add_ride(@ride3)
        expect(carnival.rides).to eq [@ride1, @ride2, @ride3]
      end
    end

    describe "#most_popular_ride" do 
      it "11. tells most popular ride" do 
        carnival = Carnival.new(14)
        expect(carnival).to respond_to(:most_popular_ride).with(0).argument
        carnival.add_ride(@ride1)
        carnival.add_ride(@ride2)
        carnival.add_ride(@ride3)

        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride2.board_rider(@visitor3)
        @ride2.board_rider(@visitor3)
        @ride3.board_rider(@visitor1)
        expect(carnival.most_popular_ride).to eq @ride2
      end
    end

    describe "#most_profitable_ride" do 
      it "12. tells most profitable ride" do 
        carnival = Carnival.new(14)
        expect(carnival).to respond_to(:most_profitable_ride).with(0).argument
        carnival.add_ride(@ride1)
        carnival.add_ride(@ride2)
        carnival.add_ride(@ride3)

        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride3.board_rider(@visitor1)
        expect(carnival.most_profitable_ride).to eq @ride2
      end
    end

    describe "#total_revenue" do 
      it "13. calculates total revenue" do 
        carnival = Carnival.new(14)
        expect(carnival).to respond_to(:total_revenue).with(0).argument
        carnival.add_ride(@ride1)
        carnival.add_ride(@ride2)
        carnival.add_ride(@ride3)

        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride3.board_rider(@visitor1)
        expect(carnival.total_revenue).to eq 15
      end 
    end
  end

  describe "Iteration 4" do 
    describe "#summary" do 
      it "14. gives a summary" do 
        carnival = Carnival.new(14)
        expect(carnival).to respond_to(:summary).with(0).argument
        carnival.add_ride(@ride1)
        carnival.add_ride(@ride2)
        carnival.add_ride(@ride3)

        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @visitor2.add_preference(:thrilling)
        @visitor3.add_preference(:gentle)
        @visitor3.add_preference(:thrilling)

        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride3.board_rider(@visitor1)

        expected = {
          visitor_count: 3, 
          revenue_earned: 20, 
          visitors: [
            {
              visitor: @visitor1,
              favorite_ride: @ride1,
              total_money_spent: 4
            }, 
            {
              visitor: @visitor2,
              favorite_ride: @ride2,
              total_money_spent: 11
            },
            {
              visitor: @visitor3,
              favorite_ride: @ride2,
              total_money_spent: 5
            }],
          rides: [
            {
              ride: @ride1,
              riders: [@visitor1, @visitor2],
              total_revenue: 5
            },
            {
              ride: @ride2,
              riders: [@visitor2, @visitor3],
              total_revenue: 15
            },
            {
              ride: @ride3,
              riders: [],
              total_revenue: 0
            }]
          }
        expect(carnival.summary).to eq expected
      end
    end

    describe ".total_revenues" do 
      it "15. calculates total revenue of all carnivals" do 
        carnival1 = Carnival.new(14)
        carnival1.add_ride(@ride1)
        carnival1.add_ride(@ride2)
        carnival1.add_ride(@ride3)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor1)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor2)
        @ride2.board_rider(@visitor3)
        @ride3.board_rider(@visitor1)

        carnival2 = Carnival.new("10 days")
        @ride4 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride5 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride6 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor4 = Visitor.new('Bruce', 54, '$10')
        @visitor5 = Visitor.new('Tucker', 36, '$5')
        @visitor6 = Visitor.new('Penny', 64, '$15')

        @visitor4.add_preference(:gentle)
        @visitor4.add_preference(:thrilling)
        @visitor5.add_preference(:gentle)
        @visitor6.add_preference(:gentle)
        @visitor6.add_preference(:thrilling)

        carnival2.add_ride(@ride4)
        carnival2.add_ride(@ride5)
        carnival2.add_ride(@ride6)

        @ride4.board_rider(@visitor4)
        @ride4.board_rider(@visitor5)
        @ride5.board_rider(@visitor4)
        @ride5.board_rider(@visitor4)
        @ride5.board_rider(@visitor5)
        @ride5.board_rider(@visitor6)
        @ride6.board_rider(@visitor4)
        @ride6.board_rider(@visitor5)
        @ride6.board_rider(@visitor6)

        expect(Carnival).to respond_to(:total_revenue).with(0).argument
        expect(Carnival.total_revenue).to eq 89
      end
    end
  end
end
