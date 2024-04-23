require "./spec/spec_helper"

RSpec.describe Carnival do
    before(:all) do 
        @carnival1 = Carnival.new(14)
        @carnvial2 = Carnival.new(7)
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    describe "#initialize" do
        it "can initialize" do
            expect(@carnival1).to be_an_instance_of (Carnival)
        end

        it "can initialize with a duration" do
            expect(@carnival1.duration).to eq (14)
        end

        it "can initialize with all rides" do
            expect(@carnival1.rides).to eq ([])
        end
    end
end