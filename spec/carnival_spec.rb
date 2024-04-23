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

        expect(carnival_A.rides).to eq([ride1])
    end
end