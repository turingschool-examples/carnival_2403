require "./spec/spec_helper"

RSpec.describe Carnival do 

    it 'initializes' do
        carnival_A = Carnival.new(14)

        expect(carnival_A).to be_an_instance_of Carnival
    end

    it 'can add rides' do
        carnival_A = Carnival.new(14)
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        
        carnival_A.add_ride(ride1)
        carnival_A.add_ride(ride2)
        
        expect(carnival_A.rides).to eq([ride1, ride2])
    end
    
    it 'can tell the most popular ride' do
        carnival_A = Carnival.new(14)
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)
        visitor3.add_preference(:gentle)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride1.board_rider(visitor3)

        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)
        ride3.board_rider(visitor3)

        expect(carnival_A.most_popular_ride).to eq(ride1)
    end
end