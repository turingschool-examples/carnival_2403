require "./spec/spec_helper"

RSpec.describe Carnival do
    it 'exists' do
        carnival1 = Carnival.new(14)
        expect(carnival1).to be_a Carnival
    end

    it 'has no rides to start' do
        carnival1 = Carnival.new(14)
        expect(carnival1.rides).to eq([])
    end

    it 'can add rides' do
        carnival1 = Carnival.new(14)
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        
        expect(carnival1.rides).to eq([])

        carnival1.add_ride(ride1)

        expect(carnival1.rides).to eq([ride1])
    end    

    it 'can check most profitable ride' do
        carnival1 = Carnival.new(14)
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        visitor1 = Visitor.new('Bruce', 54, '$20') 
        visitor2 = Visitor.new('Tucker', 36, '$20')

        carnival1.add_ride(ride1)
        carnival1.add_ride(ride2)

        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        

        expect(visitor1.spending_money).to eq(19)
        expect(visitor2.spending_money).to eq(19)

        ride2.board_rider(visitor1)
        ride2.board_rider(visitor2)
        ride2.board_rider(visitor2)
        ride2.board_rider(visitor1)

        expect(visitor1.spending_money).to eq(9)
        expect(visitor2.spending_money).to eq(9)

        expect(ride1.rider_log).to eq({visitor1 => 1, visitor2 => 1})
        expect(ride1.total_revenue).to eq(2)

        expect(ride2.rider_log).to eq({visitor1 => 2, visitor2 => 2})
        expect(ride2.total_revenue).to eq(20)

        expect(carnival1.total_revenue).to eq(22)
    end

end